//
//  MoviesRepository.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import Foundation

protocol MovieRepositoryProtocol {
    func getPopMovies(page: Int) async throws -> [Movie]
    func getCastMember(id: Int) async throws -> [CastMember]
    func getNowPlayingMovies(page: Int) async throws -> [Movie]
    func getTopRatedMovies(page: Int) async throws -> [Movie]
    func getUpcomingMovies(page: Int) async throws -> [Movie]
    func getActorDetail(id: Int) async throws -> Actor
    func getMoviesVideos(id: Int) async throws -> [MoviesVideos]
    func getWatchProviders(id: Int) async throws -> WatchProvidersResponse
}

final class MoviesRepository: MovieRepositoryProtocol {
    static let shared = MoviesRepository()
    
    private init() {}
    
    func getPopMovies(page: Int) async throws -> [Movie] {
        
        try await getJSON(urlRequest: .MoviesRequest(url: .getPopMovies, page: page), type: MoviesResult.self).results.map{ $0.mapToModel()
        }
    }
    
    func getCastMember(id: Int) async throws -> [CastMember] {
        
        try await getJSON(urlRequest: .movieCastRequest(url: .getMovieCast(id: id)), type: CreditResult.self).cast.map{ $0.mapToModel()
        }
    }
    
    func getNowPlayingMovies(page: Int) async throws -> [Movie] {
        
        try await getJSON(urlRequest: .MoviesRequest(url: .getPlayingMovies, page: page), type: MoviesResult.self).results.map{ $0.mapToModel()
        }
    }
    
    func getTopRatedMovies(page: Int) async throws -> [Movie] {
        
        try await getJSON(urlRequest: .MoviesRequest(url: .getTopRatedMovies, page: page), type: MoviesResult.self).results.map{ $0.mapToModel()
        }
    }
    
    func getUpcomingMovies(page: Int) async throws -> [Movie] {
        
        try await getJSON(urlRequest: .MoviesRequest(url: .getUpcomingMovies, page: page), type: MoviesResult.self).results.map{ $0.mapToModel() }
    }
    
    func getActorDetail(id: Int) async throws -> Actor {
        
        try await getJSON(urlRequest: .actorRequest(url: .getActorDetail(id: id)), type: ActorDTO.self).mapToModel()
    }
    
    func getMoviesVideos(id: Int) async throws -> [MoviesVideos] {
        
        try await getJSON(urlRequest: .movieVideoRequest(url: .getMovieTrailer(id: id)), type: MoviesVideosResultsDTO.self).results.map{ $0.mapToModel() }
    }
    
    func getWatchProviders(id: Int) async throws -> WatchProvidersResponse {
        
        try await getJSON(urlRequest: .providerRequest(url: .getWatchProviders(id: id)), type: WatchProvidersResponseDTO.self).mapToModel()
    }
}
