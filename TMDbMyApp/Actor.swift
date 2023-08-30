//
//  Actor.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 17/8/23.
//

import Foundation

struct Actor: Codable, Hashable {
    let biography: String
    let birthday: String
    let deathday: String?
    let id: Int
    let name: String
    let placeOfBirth: String
    let popularity: Double
    let profilePath: String?
}
