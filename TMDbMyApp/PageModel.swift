//
//  PageModel.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 19/8/23.
//

import Foundation

struct PageModel: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let image: String
    let tag: Int
}

extension PageModel {
    static var pagesReal: [PageModel] =
    [
        PageModel(title: "Bienvenido a la magia del cine",
                  description: "Bienvenido al fascinante mundo del cine. Descubre las últimas novedades, explora los clásicos imprescindibles y sumérgete en la magia del séptimo arte",
                  image: "jake-hills-23LET4Hxj_U-unsplash",
                  tag: 0),
        PageModel(title:  "El séptimo arte en la palma de tu mano",
                  description: "Explora y busca tus películas favoritas utilizando nuestras herramientas de búsqueda avanzada. Marca las películas que te encantan y crea tu propia lista personalizada.",
                  image: "felix-mooneeram-evlkOfkQ5rE-unsplash",
                  tag: 1),
        PageModel(title:  "Explora el fascinante mundo del cine",
                  description: "No te pierdas nunca más una nueva película. Nuestra aplicación te mantendrá informado sobre los próximos lanzamientos y te proporcionará detalles exclusivos directamente de The Movie DB.",
                  image: "jeremy-yap-J39X2xX_8CQ-unsplash",
                  tag: 2)
    ]
}

