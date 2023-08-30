//
//  JSONDecoder.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import Foundation

func getJSON<JSON:Codable>(urlRequest: URLRequest, type: JSON.Type) async throws -> JSON {
    let (data, response) = try await URLSession.shared.dataRequest(urlReq: urlRequest)
    let decoder = JSONDecoder()
    
    decoder.dateDecodingStrategy = .formatted(.dateFormat)
    guard let response = response as? HTTPURLResponse else {
        throw NetworkError.general
    }
    
    if response.statusCode == 200 {
        do {
            return try decoder.decode(JSON.self, from: data)
        } catch {
            throw NetworkError.general
        }
    } else {
        throw NetworkError.general
    }
}
