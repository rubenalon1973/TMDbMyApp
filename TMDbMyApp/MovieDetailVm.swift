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
    
    init(repository: MovieRepositoryProtocol = MoviesRepository.shared, selectedMovie: Movie) {
        self.repository = repository
        self.selectedMovie = selectedMovie
        self.loadMember(id: selectedMovie.id)
    }
    
    func loadMember(id: Int) {
        Task { @MainActor in
            do {
                castMember = try await repository.getCastMember(id: id)
            } catch {
                print("error load member")//MARK: QUITAR PRINT
                castMember = []
            }
        }
    }
}


