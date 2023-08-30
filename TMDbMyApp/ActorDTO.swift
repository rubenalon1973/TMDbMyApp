//
//  ActorDTO.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 17/8/23.


import Foundation

struct ActorDTO: Codable {
    let adult: Bool
    let alsoKnownAs: [String]
    let biography: String
    let birthday: String
    let deathday: String?
    let gender: Int
    let homepage: String?
    let id: Int
    let imdbID, knownForDepartment, name, placeOfBirth: String
    let popularity: Double
    let profilePath: String
    
    enum CodingKeys: String, CodingKey {
        case adult
        case alsoKnownAs = "also_known_as"
        case biography, birthday, deathday, gender, homepage, id
        case imdbID = "imdb_id"
        case knownForDepartment = "known_for_department"
        case name
        case placeOfBirth = "place_of_birth"
        case popularity
        case profilePath = "profile_path"
    }
}

extension ActorDTO {
    func mapToModel() -> Actor {
        Actor(biography: biography, birthday: birthday, deathday: deathday, id: id, name: name, placeOfBirth: placeOfBirth, popularity: popularity, profilePath: profilePath)
    }
}

