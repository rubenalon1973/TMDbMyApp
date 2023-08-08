//
//  DateFormattedExtension.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 8/8/23.
//

import Foundation

//para crear una ext de dateforma

extension DateFormatter {
//    propiedad computada que lo almacena, la calculada no
    static let dateFormat = {
        let date = DateFormatter()
        date.dateFormat = "yyyy-MM-dd"
        return date
    }()
}
