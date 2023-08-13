//
//  PopMovieDTO.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import Foundation


//Modelo general, donde dentro está el detalle de Movie, cdo veamos { al inicio, es ya un objeto, un struct
struct MoviesResult: Codable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [PopMovieDTO]
    
    enum CodingKeys: String, CodingKey {
        case page, results //un case con dos case sep x coma
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
//MARK: "DTO" Domain Transfer Object: Modelo de API
//cogemos lo que nos interesa, los q vamos a utilizar
struct PopMovieDTO: Codable {
    let id: Int
    let originalTitle: String
    let overview: String
    let releaseDate: Date//lo pasaremos de String a formato fecha
    let voteAverage: Double
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id, overview
        case originalTitle = "original_title"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
}

//fx para mapear a nuestro modelo, en Movie en la fx los parámetros son de DTO
extension PopMovieDTO {
    func mapToModel() -> Movie {
        Movie(id: id, originalTitle: originalTitle, overview: overview, releaseDate: releaseDate, voteAverage: voteAverage, posterPath: posterPath)
    }
}
/*
 En Swift y en muchos otros lenguajes de programación, es común crear modelos de datos separados para representar la estructura de los datos recibidos de una API y para representar la estructura de datos interna de la aplicación. Esto se hace por varias razones:

 Separación de responsabilidades: Mantener los modelos de la API y los modelos de la aplicación separados ayuda a mantener una separación clara entre la lógica de la API y la lógica interna de la aplicación. Esto hace que el código sea más organizado y mantenible.

 Cambios en la API: Las APIs externas pueden cambiar con el tiempo, lo que podría afectar la estructura de los datos que recibes. Si tienes modelos separados, los cambios en la API no necesariamente afectarán directamente a toda tu aplicación. Solo tendrás que ajustar la capa de adaptación entre los modelos de la API y los modelos de la aplicación.

 Flexibilidad: Los modelos de la API pueden estar diseñados específicamente para reflejar la estructura de los datos proporcionados por la API, lo cual puede no ser ideal para la representación interna en la aplicación. Los modelos de la aplicación pueden ser optimizados para el uso y la presentación en la interfaz de usuario, lo que proporciona más flexibilidad en cómo se manejan y muestran los datos.

 Transformaciones y validaciones: En muchos casos, es posible que necesites realizar transformaciones en los datos recibidos de la API antes de mostrarlos en la interfaz de usuario. Por ejemplo, podrías necesitar formatear fechas, convertir tipos de datos o realizar cálculos. Tener modelos separados permite que estas transformaciones se realicen de manera más controlada y centralizada.

 Encapsulación: Los modelos de la aplicación pueden encapsular lógica específica de la aplicación, como cálculos relacionados con los datos o métodos de ayuda para mostrar información en la interfaz de usuario. Esto ayuda a mantener un diseño más limpio y cohesivo en la capa de la interfaz de usuario.
 */
