//
//  MovieTestData.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 4/8/23.
//

import Foundation

final class MovieRepositoryTest: MovieRepositoryProtocol {
    let url = Bundle.main.url(forResource: "MovieTest", withExtension: "json")!
    
    
    func getPopularMovies() async throws -> [Movie] {
//        creamos inst tb aquí para formatear la fecha del modelotest
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.dateFormat)
        
        return try decoder.decode(MoviesResult.self, from: data).results.map { $0.mapToModel() }//con esta fx ext de movieDTO lo pasamos a nuestro mod movie
    }
}
//creamos esta ext de moviesvm para poder elegir aquí la de test, y la creamos para no tener que poner todo en la preview y solo poner la prop de moviesvm preview, la creamos aqui para q no suba a produccion
extension MoviesVm {
    static let preview = MoviesVm(repository: MovieRepositoryTest())
}

extension Movie {
    static let testMovie = Movie(id: 29292,
                                     originalTitle: "Transformers: Rise of the Beasts",
                                     overview: "When a new threat capable of destroying the entire planet emerges, Optimus Prime and the Autobots must team up with a powerful faction known as the Maximals. With the fate of humanity hanging in the balance, humans Noah and Elena will do whatever it takes to help the Transformers as they engage in the ultimate battle to save Earth.",
                                 releaseDate: DateFormatter.dateFormat.date(from: "2014-11-05")!,
                                     voteAverage: 8.5,
                                     posterPath: "/gPbM0MK8CP8A174rmUwGsADNYKD.jpg")
}//hemos formateado la fecha aquí directx cogiendo de helpers
