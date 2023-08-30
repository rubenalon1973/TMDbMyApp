//
//  URLSessionExtension.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import Foundation

extension URLSession {
    func dataRequest(urlReq: URLRequest) async throws -> (Data, URLResponse) {
        do {
            return try await data(for: urlReq)
        } catch {
            throw NetworkError.urlRequesNotValid
        }
    }
}

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
