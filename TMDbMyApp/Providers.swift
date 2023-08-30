//
//  Providers.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 22/8/23.
//

import Foundation

struct WatchProvidersResponse: Codable {
    let id: Int
    let results: [String: WatchProvider]
}

struct WatchProvider: Codable {
    let link: String
    let flatrate: [WatchProviderItem]?
    let rent: [WatchProviderItem]?
    let buy: [WatchProviderItem]?
}

struct WatchProviderItem: Codable, Identifiable {
    let logoPath: String
    let id: Int
    let providerName: String
}
