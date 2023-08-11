//
//  MovieTestData.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 4/8/23.
//

import Foundation

final class MovieRepositoryTest: MovieRepositoryProtocol {
    
    let url = Bundle.main.url(forResource: "MovieTest", withExtension: "json")!
    
    
    func getPopularMovies(page: Int = 1) async throws -> [PopMovie] {
        //        creamos inst tb aquí para formatear la fecha del modelotest
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        //        estrategia de decode de la fecha para darle formato deseado en preview
        decoder.dateDecodingStrategy = .formatted(.dateFormat)
        
        return try decoder.decode(MoviesResult.self, from: data).results.map { $0.mapToModel() }//con esta fx ext de movieDTO lo pasamos a nuestro mod movie
    }
    
    func getMovieCast(id: Int) async throws -> [CastMember] {
        return []
    }
    
}
//creamos esta ext de moviesvm para poder elegir aquí la de test, y la creamos para no tener que poner todo en la preview y solo poner la prop de moviesvm preview, la creamos aqui para q no suba a produccion
extension PopMoviesVm {
    static let preview = PopMoviesVm(repository: MovieRepositoryTest())
}

extension PopMovie {
    static let testMovie = PopMovie(id: 29292,
                                 originalTitle: "Transformers: Rise of the Beasts",
                                 overview: "When a new threat capable of destroying the entire planet emerges, Optimus Prime and the Autobots must team up with a powerful faction known as the Maximals. With the fate of humanity hanging in the balance, humans Noah and Elena will do whatever it takes to help the Transformers as they engage in the ultimate battle to save Earth.",
                                 releaseDate: DateFormatter.dateFormat.date(from: "2014-11-05")!,
                                 voteAverage: 8.5,
                                 posterPath: "/gPbM0MK8CP8A174rmUwGsADNYKD.jpg")
}

extension CastMember {
    static let testCrew = CastMember(
        id: 550,
        name: "Edward Norton",
        profilePath: "/8nytsqL59SFJTVYVrN72k6qkGgJ.jpg",
        character: "The Narrator"
    )
}
//hemos formateado la fecha aquí directx cogiendo de helpers
