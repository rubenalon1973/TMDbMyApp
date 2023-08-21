//
//  MovieDetailVM.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 10/8/23.
//

import Foundation

final class MovieDetailVM: ObservableObject {
    let repository: MovieRepositoryProtocol
    let selectedMovie: Movie//para la seleccion de la peli q vamos a ver en detalle
    
    @Published var castMember: [CastMember] = []
    @Published var trailers: [MoviesVideos] = []
    var oneTrailer: MoviesVideos? {
//        trailers.first { trailer in
//            trailer.official == true
//        }
        trailers.filter{ $0.type == "Trailer" && $0.official == true }.first
    }
    
    init(repository: MovieRepositoryProtocol = MoviesRepository.shared, selectedMovie: Movie) {
        self.repository = repository
        self.selectedMovie = selectedMovie
        self.loadMember(id: selectedMovie.id)
        self.loadTrailer(id: selectedMovie.id)
    }
    
    func loadMember(id: Int) {
        Task { @MainActor in //MainActor como va a haber cambios en la UI de detail
            do {
                castMember = try await repository.getCastMember(id: id)
            } catch {
                print("error load member")//MARK: QUITAR PRINT
                castMember = []
            }
        }
    }
    
    func loadTrailer(id: Int) {
        Task { @MainActor in
            do {
                trailers = try await repository.getMoviesVideos(id: id)
            } catch {
                print("error load trailer")//MARK: QUITAR PRINT
                trailers = []
            }
        }
    }
}


