//
//  NetworkInterface.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import Foundation

//MARK: Capa config llamadas

//URL principal
let mainURL = URL(string: "https://api.themoviedb.org/3")!
//URL base de las image
let imageURLBase = URL(string: "https://image.tmdb.org/t/p/w500")!

//Extensión con el edpoint de lo que necesitamos
extension URL {
    static let getPopularMovies = mainURL.appending(path: "movie/popular")//para poner el edpoint a la main
    static func getPosterPath(poster: String) -> URL {//para poner el edpoint del poster de la image de cada peli donde en la view de diseño del poster
        imageURLBase.appending(path: poster)
    }
}

//Extensión con  fx para sacar las funcionalidades q queremos de URLRequest
extension URLRequest {
//    añadimos el page para que empiece en la pag 1 directx, y no la pida
    static func popularMoviesRequest(url: URL, page: Int = 1) -> URLRequest {
        var request = URLRequest(url: url)
//        este request es para la paginación, hemos visto en la api q el edpoint pone page 1, 2, etc...añade &page=1 esto el URLQueryItem(name: "page", value: String(page))])
        request.url?.append(queryItems: [URLQueryItem(name: "page", value: String(page))])
        
//        para poder elegir post o get
        request.httpMethod = HTTPMethods.get.rawValue
//        para poder poner el token(siempre probar con "Bearer" delante) y "Authorization"
        request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YjBiMzkzNjg1NzZjZTcwYzNkNjVhOGU1NjcyYjkwOSIsInN1YiI6IjY0YjdmMGYzZDM5OWU2MDBhZDQ0YmQ1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.1PWY2tV1Tfuy4N7uOIc5VzQ5Ey_qUSj4oniK2iBkRK8", forHTTPHeaderField: "Authorization")
        
        return request
    }
}
//por si necesitamos hacer también algún post
enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}
