//
//  MovieDTO.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import Foundation

struct MoviesResult: Codable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [MovieDTO]
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct MovieDTO: Codable {
    let id: Int
    let title: String
    let originalTitle: String
    let overview: String
    let releaseDate: Date
    let voteAverage: Double
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id, overview, title
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
    let type: VideoType
    let official: Bool
}

enum VideoType: String, Codable {
    case behindTheScenes = "Behind the Scenes"
    case clip = "Clip"
    case featurette = "Featurette"
    case teaser = "Teaser"
    case trailer = "Trailer"
}

extension MovieDTO {
    func mapToModel() -> Movie {
        Movie(id: id,title: title, originalTitle: originalTitle, overview: overview, releaseDate: releaseDate, voteAverage: voteAverage, posterPath: posterPath)
    }
}

extension MoviesVideosDTO {
    func mapToModel() -> MoviesVideos {
        MoviesVideos(key: key, type: type, official: official)
    }
}
