//
//  MoviesRepository.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//
//MARK: Creamos carpeta REPOSITORIES x si en futuro nos piden sacar info de otro endpoint, otra llamada a red

import Foundation

//MARK: PERSISTENCE = REPOSITORY
//Creamos un protocolo para alojar la declaración de la fx, q usaremos tanto para cargar los datos en producción como en test
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
    //    llamada a red q nos dev los datos con async, y sino se suelen utilizar los callbacks
    //    en la fx getpopularmovies estamos utilizando la fx de llamada  generica -> getjson, la cual tiene dentro la fx ext de Request | añadimos el page tb en getpopularmovies
    func getPopMovies(page: Int) async throws -> [Movie] {
        print("entra getpopmovies api")
        
        return try await getJSON(urlRequest: .MoviesRequest(url: .getPopMovies, page: page), type: MoviesResult.self).results.map{ $0.mapToModel()
        }
        
        /*  lo de debajo es creando let movies en vez del return y transf con el map llamando a la fx mapToModel de MovieDTO a Movie, pero si lo hacemos directax en las dos líneas de arriba, es más pro y menos cod.
         
         let moviesReal = movies.map{ $0.mapToModel() }
         
         return moviesReal
         */
    }
    
    func getCastMember(id: Int) async throws -> [CastMember] {
        print("entra getcastmember api")
        
        return try await getJSON(urlRequest: .movieCastRequest(url: .getMovieCast(id: id)), type: CreditResult.self).cast.map{ $0.mapToModel()
        }
    }
    
    func getNowPlayingMovies(page: Int) async throws -> [Movie] {
        print("entra getNowPlayingMovies api")

        return try await getJSON(urlRequest: .MoviesRequest(url: .getPlayingMovies, page: page), type: MoviesResult.self).results.map{ $0.mapToModel()
        }
    }
    
    func getTopRatedMovies(page: Int) async throws -> [Movie] {
        print("entra getTopRatedMovies api")

        return try await getJSON(urlRequest: .MoviesRequest(url: .getTopRatedMovies, page: page), type: MoviesResult.self).results.map{ $0.mapToModel()
        }
    }
    
    func getUpcomingMovies(page: Int) async throws -> [Movie] {
        print("entra getUpcomingMovies api")

        return try await getJSON(urlRequest: .MoviesRequest(url: .getUpcomingMovies, page: page), type: MoviesResult.self).results.map{ $0.mapToModel() }
    }
    
    func getActorDetail(id: Int) async throws -> Actor {
        print("entra getActorDetail api")

        return try await getJSON(urlRequest: .actorRequest(url: .getActorDetail(id: id)), type: ActorDTO.self).mapToModel()
    }
    
    func getMoviesVideos(id: Int) async throws -> [MoviesVideos] {
        print("entra getMoviesVideos api")

        return try await getJSON(urlRequest: .movieVideoRequest(url: .getMovieTrailer(id: id)), type: MoviesVideosResultsDTO.self).results.map{ $0.mapToModel() }
    }
    
    func getWatchProviders(id: Int) async throws -> WatchProvidersResponse {
        print("entra getWatchProviders api")

        return try await getJSON(urlRequest: .providerRequest(url: .getWatchProviders(id: id)), type: WatchProvidersResponseDTO.self).mapToModel()
    }
}
