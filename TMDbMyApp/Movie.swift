//
//  Movie.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import Foundation

struct Movie: Codable,Identifiable, Hashable {
    let id: Int
    let title: String
    let originalTitle: String
    let overview: String
    let releaseDate: Date
    let voteAverage: Double
    let posterPath: String
    
    var rank: String {
        voteAverage.formatted( .number.precision(.integerAndFractionLength(integer: 1, fraction: 1)))
    }
    
    var releaseYear: String {
        releaseDate.formatted(.dateTime.year(.defaultDigits))
    }
}
