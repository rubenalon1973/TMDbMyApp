//
//  ProvidersDTO.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 22/8/23.
//

import Foundation


struct WatchProvidersResponseDTO: Codable {
    let id: Int
    let results: [String: WatchProviderDTO]
}

struct WatchProviderDTO: Codable {
    let link: String
    let flatRate: [WatchProviderItemDTO]?
    let rent: [WatchProviderItemDTO]?
    let buy: [WatchProviderItemDTO]?
}

struct WatchProviderItemDTO: Codable, Identifiable {
    let logoPath: String
    let id: Int
    let providerName: String
    
    enum CodingKeys: String, CodingKey {
        case providerName = "provider_name"
        case logoPath = "logo_path"
        case id = "provider_id"
    }
}

extension WatchProviderItemDTO {
    func mapToModel() -> WatchProviderItem {
        WatchProviderItem(logoPath: logoPath, id: id, providerName: providerName)
    }
}

extension WatchProviderDTO {
    func mapToModel() -> WatchProvider {
        WatchProvider(link: link,
                      flatRate: flatRate?.map({ providerItem in
            providerItem.mapToModel()
        }),
                      rent: rent?.map{ $0.mapToModel() }, //es lo mismo que la anterior, + inferido
                      buy: buy?.map { $0.mapToModel() })
    }
}

extension WatchProvidersResponseDTO {
    func mapToModel() -> WatchProvidersResponse {
        WatchProvidersResponse(id: id, results: results.mapValues { $0.mapToModel() })
    }
}
