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
    let urlActor = Bundle.main.url(forResource: "ActorTest", withExtension: "json")!
    
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
    
    func getTopRatedMovies(page: Int = 1) async throws -> [Movie] {
        let data = try Data(contentsOf: urlMovie)
        let decoder = JSONDecoder()
        return try decoder.decode(MoviesResult.self, from: data).results.map { $0.mapToModel() }
    }
    
    func getUpcomingMovies(page: Int) async throws -> [Movie] {
        let data = try Data(contentsOf: urlMovie)
        let decoder = JSONDecoder()
        return try decoder.decode(MoviesResult.self, from: data).results.map { $0.mapToModel() }
    }
    
    func getActorDetail(id: Int) async throws -> Actor {
        let data = try Data(contentsOf: urlActor)
        let decoder = JSONDecoder()
        
        return try decoder.decode(ActorDTO.self, from: data).mapToModel()
    }
}
//creamos esta ext de moviesvm para poder elegir aquí la de test, y la creamos para no tener que poner todo en la preview y solo poner la prop de moviesvm preview, la creamos aqui para q no suba a produccion
extension MoviesVM {
    static let previewMovie = MoviesVM(repository: MovieRepositoryTest())
}

extension MovieDetailVM {
    static let previewDetail = MovieDetailVM(repository: MovieRepositoryTest(), selectedMovie: .testMovieDetail)
}

extension ActorDetailVM {
//    static let previewActor = ActorDetailVM(repository: MovieRepositoryTest(), selectedActor: .testActorDetail)
    static let previewCast = ActorDetailVM(repository: MovieRepositoryTest(), castMember: .testMember)
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

extension Actor {
    static let testActorDetail = Actor(biography: "Mark Sinclair (born July 18, 1967), known professionally as Vin Diesel, is an American actor and producer. One of the world's highest-grossing actors, he is best known for playing Dominic Toretto in the Fast & Furious franchise.\n\nDiesel began his career in 1990, but faced difficulty achieving recognition until he wrote, directed and starred in the short film Multi-Facial (1995) and his debut feature Strays (1997); the films prompted Steven Spielberg to cast Diesel in the war epic Saving Private Ryan (1998). Diesel subsequently voiced the titular character in The Iron Giant (1999) and then gained a reputation as an action star after headlining the Fast & Furious, XXX, and The Chronicles of Riddick franchises. He is slated to appear in the upcoming Avatar films.\n\nDiesel voices Groot and Groot II in the Marvel Cinematic Universe (MCU); he portrayed the characters in six superhero films, beginning with Guardians of the Galaxy (2014). Diesel has reprised his role as Groot for the Disney+ animated shorts series I Am Groot (2022–present), the television special The Guardians of the Galaxy Holiday Special (2022), and the animated film Ralph Breaks the Internet (2018). Diesel achieved commercial success in the comedy The Pacifier (2005) and his portrayal of Jackie DiNorscio in Find Me Guilty (2006) was praised.\n\nHe founded the production company One Race Films, where he has also served as a producer or executive producer for his star vehicles. Diesel also founded the record label Racetrack Records and video game developer Tigon Studios, providing his voice and motion capture for all of Tigon's releases.\n\nDescription above from the Wikipedia article Vin Diesel, licensed under CC-BY-SA, full list of contributors on Wikipedia.",
                                       birthday: "1967-07-18",
                                       deathday: nil,
                                       id: 12835,
                                       name: "Vin Diesel",
                                       placeOfBirth: "Alameda County, California, USA",
                                       popularity: 57.941,
                                       profilePath: "/vD28HWRqBxDgdGLXSgu6XYcn3BI.jpg")
    
    static let emptyActor = Actor(biography: "", birthday: "", deathday: "", id: 12835, name: "", placeOfBirth: "", popularity: 0, profilePath: "")
}



