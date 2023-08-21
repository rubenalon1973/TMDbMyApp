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
