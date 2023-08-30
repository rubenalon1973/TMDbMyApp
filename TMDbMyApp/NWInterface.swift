//
//  NWInterface.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import Foundation

let mainURL = URL(string: "https://api.themoviedb.org/3")!
let imageURLBase = URL(string: "https://image.tmdb.org/t/p/w500")!
let linkURLBase = URL(string: "https://www.themoviedb.org/movie/")!
let profilePathURLBase = URL(string: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/")!

let token = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYzI2YmU1ZWM5NDQ0ZjM5YTMwZjI1ZTY4YWQ3NWVkYSIsInN1YiI6IjY0YjdmMGYzZDM5OWU2MDBhZDQ0YmQ1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S2e2kr8N4Q8bhOlle2AQU0NsQ6AEZ9iaBPA090nxdPo"

extension URL {
    static let getPopMovies = mainURL.appending(path: "movie/popular")
    static let getPlayingMovies = mainURL.appending(path: "movie/now_playing")
    static let getUpcomingMovies = mainURL.appending(path: "movie/upcoming")
    static let getTopRatedMovies = mainURL.appending(path: "movie/top_rated")
    
    static func getPosterPath(poster: String) -> URL {
        imageURLBase.appending(path: poster)
    }
    
    static func getLinkMovies(id: Int, title: String) -> URL {
        linkURLBase.appending(path: "\(id)-\(title)")
    }
    
    static func getMovieCast(id: Int) -> URL {
        mainURL.appending(path: "movie/\(id)/credits")
    }
    
    static func getprofilePathCast(actor: CastMember) -> URL? {
        guard let actor = actor.profilePath else { return nil }
        
        return profilePathURLBase.appending(path: actor)
    }
    
    static func getActorDetail(id: Int) -> URL {
        mainURL.appending(path: "person/\(id)")
    }
    
    static func getProfilePathActor(actor: Actor) -> URL? {
        guard let actor = actor.profilePath else { return nil }
        
        return profilePathURLBase.appending(path: actor)
    }
    
    static func getMovieTrailer(id: Int) -> URL {
        mainURL.appending(path: "movie/\(id)/videos")
    }
    
    static func getWatchProviders(id: Int) -> URL {
        mainURL.appending(path: "movie/\(id)/watch/providers")
    }
}

extension URLRequest {
    static func MoviesRequest(url: URL, page: Int = 1) -> URLRequest {
        var request = URLRequest(url: url)
        request.url?.append(queryItems: [URLQueryItem(name: "page", value: String(page))])
        request.httpMethod = HTTPMethods.get.rawValue
        request.addValue(token, forHTTPHeaderField: "Authorization")
        return request
    }
    
    static func movieCastRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get.rawValue
        request.addValue(token, forHTTPHeaderField: "Authorization")
        return request
    }
    
    static func actorRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get.rawValue
        request.addValue(token, forHTTPHeaderField: "Authorization")
        return request
    }
    
    static func movieVideoRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get.rawValue
        request.addValue(token, forHTTPHeaderField: "Authorization")
        return request
    }
    
    static func providerRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get.rawValue
        request.addValue(token, forHTTPHeaderField: "Authorization")
        return request
    }
}

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

