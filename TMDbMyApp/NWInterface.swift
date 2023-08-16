//
//  NWInterface.swift
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
let linkURLBase = URL(string: "https://www.themoviedb.org/movie/")!
var profilePathURLBase = URL(string: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/")!

//Extensión con el edpoint de lo que necesitamos
extension URL {
    static let getPopMovies = mainURL.appending(path: "movie/popular")//para poner el edpoint a la main
    static let getPlayingMovies = mainURL.appending(path: "movie/now_playing")
    
    static func getPosterPath(poster: String) -> URL {//para poner el edpoint del poster de la image de cada peli donde en la view de diseño del poster
        imageURLBase.appending(path: poster)
    }
    
    static func getLinkMovies(id: Int, title: String) -> URL {
        linkURLBase.appending(path: "\(id)-\(title)")
    }
    
    static func getMovieCast(id: Int) -> URL {
        mainURL.appending(path: "movie/\(id)/credits")
    }
//    aquí ponemos el param ent de tipo del modelo, pq necesitamos acceder al ser opc, para poder hacer el unwrapp
    static func getprofilePath(actor: CastMember) -> URL? {
        guard let actor = actor.profilePath else { return nil }
        
        return profilePathURLBase.appending(path: actor)
    }
    
}

//Extensión con  fx para sacar las funcionalidades q queremos de URLRequest
extension URLRequest {
//    MARK: PAGINACIÓN
//    añadimos el page para que empiece en la pag 1 directx, y no la pida
    static func MoviesRequest(url: URL, page: Int = 1) -> URLRequest {
        var request = URLRequest(url: url)
//        este request es para la paginación, hemos visto en la api q el edpoint pone page 1, 2, etc...añade &page=1 esto el URLQueryItem(name: "page", value: String(page))])
        request.url?.append(queryItems: [URLQueryItem(name: "page", value: String(page))])
        
//        para poder elegir post o get
        request.httpMethod = HTTPMethods.get.rawValue
//        para poder poner el token(siempre probar con "Bearer" delante) y "Authorization"
        request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYzI2YmU1ZWM5NDQ0ZjM5YTMwZjI1ZTY4YWQ3NWVkYSIsInN1YiI6IjY0YjdmMGYzZDM5OWU2MDBhZDQ0YmQ1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S2e2kr8N4Q8bhOlle2AQU0NsQ6AEZ9iaBPA090nxdPo", forHTTPHeaderField: "Authorization")
        
        return request
    }
    
    static func movieCastRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get.rawValue
//        para poder poner el token(siempre probar con "Bearer" delante) y "Authorization"
        request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYzI2YmU1ZWM5NDQ0ZjM5YTMwZjI1ZTY4YWQ3NWVkYSIsInN1YiI6IjY0YjdmMGYzZDM5OWU2MDBhZDQ0YmQ1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S2e2kr8N4Q8bhOlle2AQU0NsQ6AEZ9iaBPA090nxdPo", forHTTPHeaderField: "Authorization")
        return request
    }
}
//por si necesitamos hacer también algún post
enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}
