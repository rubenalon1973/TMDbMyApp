//
//  CastMemberDTO.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 10/8/23.
//

import Foundation

//MARK: Modelo del scroll de actores
struct CreditResult: Codable {
    let id: Int
    let cast: [CastMemberDTO]
}

//para sacar el scroll horiz de los actores
struct CastMemberDTO: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let profilePath: String?
    let character: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, character
        case profilePath = "profile_path"
    }
}

extension CastMemberDTO {
    func mapToModel() -> CastMember {
        CastMember(id: id, name: name, profilePath: profilePath, character: character)
    }
}
