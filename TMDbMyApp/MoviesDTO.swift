//
//  MovieDTO.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import Foundation


//Modelo general, donde dentro está el detalle de Movie, cdo veamos { al inicio, es ya un objeto, un struct
struct MoviesResult: Codable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [MovieDTO]
    
    enum CodingKeys: String, CodingKey {
        case page, results //un case con dos case sep x coma
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
//MARK: "DTO" Domain Transfer Object: Modelo de API
//cogemos lo que nos interesa, los q vamos a utilizar
struct MovieDTO: Codable {
    let id: Int
    let originalTitle: String
    let overview: String
    let releaseDate: Date//lo pasaremos de String a formato fecha
    let voteAverage: Double
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id, overview
        case originalTitle = "original_title"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
}

struct MoviesVideosResultsDTO: Codable {
    let results: [MoviesVideosDTO]
}

struct MoviesVideosDTO: Codable {
    let key: String
    let type: String
    let official: Bool
}

extension MoviesVideosDTO {
    func mapToModel() -> MoviesVideos {
        MoviesVideos(key: key, type: type, official: official)
    }
}


//fx para mapear a nuestro modelo, en Movie en la fx los parámetros son de DTO
extension MovieDTO {
    func mapToModel() -> Movie {
        Movie(id: id, originalTitle: originalTitle, overview: overview, releaseDate: releaseDate, voteAverage: voteAverage, posterPath: posterPath)
    }
}

