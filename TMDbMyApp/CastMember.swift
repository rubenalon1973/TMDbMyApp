//
//  CastMember.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 10/8/23.
//

import Foundation

struct CastMember: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let profilePath: String?
    let character: String
}


