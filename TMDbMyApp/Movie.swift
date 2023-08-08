//
//  Movie.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import Foundation

//mi modelo, para crear campos personalizados q no están en la API
struct Movie: Codable,Identifiable {
    let id: Int
    let originalTitle: String
    let overview: String
    let releaseDate: Date
    let voteAverage: Double
    let posterPath: String
    
    var rank: String {
        voteAverage.formatted( .number.precision(.integerAndFractionLength(integer: 1, fraction: 1)))
    }
    
    var releaseYear: String {
        releaseDate.formatted(.dateTime.year(.defaultDigits))//para que solo ponga el año de la fecha
    }
}
