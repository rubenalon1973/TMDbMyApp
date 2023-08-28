//
//  Movie.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import Foundation

//mi modelo, para crear campos personalizados q no están en la API, y pq es una buena práctica no trabajar con el modelo de la api
struct Movie: Codable,Identifiable, Hashable {
    let id: Int
    let title: String
    let originalTitle: String
    let overview: String
    let releaseDate: Date
    let voteAverage: Double
    let posterPath: String
    
    var rank: String {//creamos esta prop calculada para darle formato al promedio de votos
        voteAverage.formatted( .number.precision(.integerAndFractionLength(integer: 1, fraction: 1)))//con un dígito izq de la coma y otro a la drcha
    }
    
    var releaseYear: String {//creamos esta prop calculada para darle formato al año de estreno
        releaseDate.formatted(.dateTime.year(.defaultDigits))//para que solo ponga el año de la fecha
    }
}
