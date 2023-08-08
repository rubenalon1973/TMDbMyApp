//
//  JSONDecoder.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import Foundation

//hacemos la fx genérica de carga del json
func getJSON<JSON:Codable>(urlRequest: URLRequest, type: JSON.Type) async throws -> JSON {
    //    hacemos la llamada de red de la fx dataRequest
    let (data, response) = try await URLSession.shared.dataRequest(urlReq: urlRequest)//estamos llamando a la ext de URLSession creada
    
    let decoder = JSONDecoder()
//    estrategia para decirle como queremos que sean las fechas
    decoder.dateDecodingStrategy = .formatted(.dateFormat)
    
    
    guard let response = response as? HTTPURLResponse else {
        throw NetworkError.general
    }
    //    hacemos el decode de los datos
    if response.statusCode == 200 {
        do {
            return try decoder.decode(JSON.self, from: data)//cambiamos el jsondecoder x el decoder de helpers
        } catch {
            throw NetworkError.general
        }
    } else {
        throw NetworkError.general
    }
}
