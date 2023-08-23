//
//  PageModel.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 19/8/23.
//

import Foundation


struct PageModel: Identifiable {
    let id = UUID()//cada vez q se cree un pageModel le dará un id
    let title: String
    let description: String
    let image: String
    let tag: Int//permite al pager saber en q pag está, es un identificador
}

//    TODO: - Personalizar con mis textos e imágenes
extension PageModel {
    
    static var pagesReal: [PageModel] =
    [
        PageModel(title: "Explora un Mundo de Películas", description: "Sumérgete en un vasto océano de películas, desde clásicos atemporales hasta los últimos éxitos de taquilla. ¡Descubre historias que te emocionarán y te cautivarán!", image: "cineApp", tag: 0),
        PageModel(title:  "Encuentra tus Favoritas", description: "Explora y busca tus películas favoritas utilizando nuestras herramientas de búsqueda avanzada. Marca las películas que te encantan y crea tu propia lista personalizada.", image: "cineApp2", tag: 1),
        PageModel(title:  "Mantente al Día", description: "No te pierdas nunca más una nueva película. Nuestra aplicación te mantendrá informado sobre los próximos lanzamientos y te proporcionará detalles exclusivos directamente de The Movie DB.", image: "cineApp3", tag: 2)
    ]
}

// TODO: Queda pdte tal vez hacer unos localized string aquí para las language
