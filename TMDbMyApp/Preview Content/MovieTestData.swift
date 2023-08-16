//
//  MovieTestData.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 4/8/23.
//

import Foundation

final class MovieRepositoryTest: MovieRepositoryProtocol {
    let urlMovie = Bundle.main.url(forResource: "MovieTest", withExtension: "json")!
    let urlMember = Bundle.main.url(forResource: "CastMemberTest", withExtension: "json")!
    
//    fx para tirar de datos locales de test para PopMovies
    func getPopMovies(page: Int = 1) async throws -> [Movie] {
        //        creamos inst tb aquí para formatear la fecha del modelotest
        print("entra por getpopmovies test")

        let data = try Data(contentsOf: urlMovie)
        print("entra por data test")

        let decoder = JSONDecoder()
        print("entra por decoder test")

        //        estrategia de decode de la fecha para darle formato deseado en preview
        decoder.dateDecodingStrategy = .formatted(.dateFormat)
        
        return try decoder.decode(MoviesResult.self, from: data).results.map { $0.mapToModel() }//con esta fx ext de movieDTO lo pasamos a nuestro mod movie
    }
    //    fx para tirar de datos locales de test para CastMember en detailVies
    func getCastMember(id: Int) async throws -> [CastMember] {
        print("entra por getcast test")
        
        let data = try Data(contentsOf: urlMember)
        print("entra por data test")

        let decoder = JSONDecoder()
        print("entra por decoder test")

        return try decoder.decode(CreditResult.self, from: data).cast.map { $0.mapToModel() }
    }
    func getNowPlayingMovies(page: Int = 1) async throws -> [Movie] {
        print("entra por getNowPlayingMovies test")

        let data = try Data(contentsOf: urlMovie)
        print("entra por data test")

        let decoder = JSONDecoder()
        print("entra por decoder test")

        //        estrategia de decode de la fecha para darle formato deseado en preview
        decoder.dateDecodingStrategy = .formatted(.dateFormat)
        
        return try decoder.decode(MoviesResult.self, from: data).results.map { $0.mapToModel() }//con esta fx ext de movieDTO lo pasamos a nuestro mod movie
    }    
}
//creamos esta ext de moviesvm para poder elegir aquí la de test, y la creamos para no tener que poner todo en la preview y solo poner la prop de moviesvm preview, la creamos aqui para q no suba a produccion
extension MoviesVm {
    static let previewMovie = MoviesVm(repository: MovieRepositoryTest())
}

extension MovieDetailVm {
    static let previewDetail = MovieDetailVm(repository: MovieRepositoryTest(), selectedMovie: .testMovieDetail)
}

extension Movie {
    static let testMovieDetail = Movie(id: 29292,
                                 originalTitle: "Transformers: Rise of the Beasts",
                                 overview: "When a new threat capable of destroying the entire planet emerges, Optimus Prime and the Autobots must team up with a powerful faction known as the Maximals. With the fate of humanity hanging in the balance, humans Noah and Elena will do whatever it takes to help the Transformers as they engage in the ultimate battle to save Earth.",
                                 releaseDate: DateFormatter.dateFormat.date(from: "2014-11-05")!,
                                 voteAverage: 8.5,
                                 posterPath: "/gPbM0MK8CP8A174rmUwGsADNYKD.jpg")
}
//hemos formateado la fecha aquí directx cogiendo de helpers

extension CastMember {
    static let testMember = CastMember(
        id: 550,
        name: "Edward Norton",
        profilePath: "/8nytsqL59SFJTVYVrN72k6qkGgJ.jpg",
        character: "The Narrator"
    )
}
