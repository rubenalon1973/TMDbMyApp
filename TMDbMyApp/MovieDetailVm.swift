//
//  MovieDetailVM.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 10/8/23.
//

import Foundation

final class MovieDetailVM: ObservableObject {
    let repository: MovieRepositoryProtocol
    let selectedMovie: Movie
    
    @Published var castMember: [CastMember] = []
    @Published var trailers: [MoviesVideos] = []
    @Published var providers: WatchProvidersResponse?
    
    var oneTrailer: MoviesVideos? {
        trailers.filter{ $0.type == "Trailer" && $0.official == true }.first
    }
    
    var buyProviders: [WatchProviderItem] {
        guard let providers = providers?.results["ES"]?.buy else { return [] }
        
        return providers
        
    }
    
    var rentProviders: [WatchProviderItem] {
        guard let providers = providers?.results["ES"]?.rent else { return [] }
        
        return providers
    }
    
    var flatRateProviders: [WatchProviderItem] {
        guard let providers = providers?.results["ES"]?.flatrate else { return [] }
        
        return providers
    }
    
    init(repository: MovieRepositoryProtocol = MoviesRepository.shared, selectedMovie: Movie) {
        self.repository = repository
        self.selectedMovie = selectedMovie
        self.loadMember(id: selectedMovie.id)
        self.loadTrailer(id: selectedMovie.id)
        self.loadProviders(id: selectedMovie.id)
    }
    
    func loadMember(id: Int) {
        Task { @MainActor in //MainActor como va a haber cambios en la UI de detail
            do {
                castMember = try await repository.getCastMember(id: id)
            } catch {
                castMember = []
            }
        }
    }
    
    func loadTrailer(id: Int) {
        Task { @MainActor in
            do {
                trailers = try await repository.getMoviesVideos(id: id)
            } catch {
                trailers = []
            }
        }
    }
    
    func loadProviders(id: Int) {
        Task { @MainActor in
            do {
                providers = try await repository.getWatchProviders(id: id)
            } catch {
                print("error load provider")//MARK: QUITAR PRINT
                providers = nil
            }
        }
    }
    
    func checkEmptyProviders() -> Bool {
        [buyProviders, rentProviders, flatRateProviders].allSatisfy{ $0.isEmpty}
    }
}


