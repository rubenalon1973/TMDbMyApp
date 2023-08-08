//
//  MoviesRepositories.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import Foundation
//MARK: Creamos carpeta REPOSITORIES x si en futuro nos piden sacar info de otro endpoint, otra llamada a red

//Creamos un protocolo para alojar la declaración de la fx, q usaremos tanto para cargar los datos en producción como en test
protocol MovieRepositoryProtocol {
    func getPopularMovies() async throws -> [Movie]
}

final class MoviesRepository: MovieRepositoryProtocol {
    static let shared = MoviesRepository()
    
    private init() {}
//    llamada a red q nos dev los datos con async, y sino se suelen utilizar los callbacks
//    en la fx(getpopularmovies, ext de urlrequest) estamos utilizando la fx de llamada  generica -> getjson, ????????????
    func getPopularMovies() async throws -> [Movie] {
        return try await getJSON(urlRequest: .popularMoviesRequest(url: .getPopularMovies), type: MoviesResult.self).results.map{ $0.mapToModel() }
        
/*  lo de debajo es creando let movies en vez del return y transf con el map llamando a la fx mapToModel de MovieDTO a Movie, pero si lo hacemos directax en las dos líneas de arriba, es más pro y menos cod.
 
        let moviesReal = movies.map{ $0.mapToModel() }

        return moviesReal
 */
    }
}
