//
//  URLSessionExtension.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import Foundation
//este dataRequest nos va a devolver lo mismo q el URLSession si lo hubieramos hecho en la fx de getPopularMovies, y así dividimos las responsabilidades
extension URLSession {
    func dataRequest(urlReq: URLRequest) async throws -> (Data, URLResponse) {
        do {
            return try await data(for: urlReq)
        } catch {
            throw NetworkError.urlRequesNotValid
        }
    }
}
//para poder escalar luego el error a la 1ª capa al usuario
enum NetworkError: Error {
    case urlRequesNotValid
    case general
    
    
    var description: String {
        switch self {
        case .urlRequesNotValid:
            return "URL Request Not Valid"
        case .general:
            return "General Error"
        }
    }
}
