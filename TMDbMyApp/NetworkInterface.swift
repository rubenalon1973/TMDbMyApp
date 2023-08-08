//
//  NetworkInterface.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import Foundation

//MARK: Capa config llamadas

//Url principal
let mainURL = URL(string: "https://api.themoviedb.org/3")!
let imageURLBase = URL(string: "https://image.tmdb.org/t/p/w500")!

//Extensión con el edpoint de lo que necesitamos
extension URL {
    static let getPopularMovies = mainURL.appending(path: "movie/popular")
    static func getPosterPath(poster: String) -> URL {
        imageURLBase.appending(path: poster)
    }
}

//Extensión con  fx para sacar las funcionalidades q queremos de URLRequest
extension URLRequest {
    static func popularMoviesRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        
//        para poder elegir post o get
        request.httpMethod = HTTPMethods.get.rawValue
//        para poder poner el token(siempre probar con "Bearer" delante) y "Authorization"
        request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwODcwMDViYjhjZmM1YmFiZWI1MjY4MjI2NmM2OTNhZSIsInN1YiI6IjY0YjdmMGYzZDM5OWU2MDBhZDQ0YmQ1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PSWGYl0_bbRcFh23pfdgf44VV8qjl69Qy0C3mEiNJ8I", forHTTPHeaderField: "Authorization")
        
        return request
    }
}
//por si necesitamos hacer también algún post
enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}
