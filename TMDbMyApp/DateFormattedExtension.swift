//
//  DateFormattedExtension.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 8/8/23.
//

import Foundation

//para crear una ext de la class DateFormatter

extension DateFormatter {
//    el uso de la var computada con la clausura autoinvocada permite crear una instancia personalizada de DateFormatter con el formato de fecha deseado ("yyyy-MM-dd") y asegura que esta inicialización solo ocurra una vez durante el ciclo de vida de la aplicación, lo que puede ser más eficiente y conveniente en comparación con crear una instancia nueva cada vez que se accede a la propiedad.
    static let dateFormat = {
        let date = DateFormatter()
        date.dateFormat = "yyyy-MM-dd"
        return date
    }()
}
/*
 static let dateFormat = { ... }(): Aquí se define una propiedad estática llamada dateFormat que almacena una instancia de DateFormatter. La peculiaridad aquí es el uso de una clausura ({ ... }) seguida de paréntesis vacíos () al final.
 La clausura { ... } es un bloque de código que contiene instrucciones. En este caso, se usa para inicializar la instancia de DateFormatter con el formato de fecha deseado ("yyyy-MM-dd").
 Los paréntesis vacíos () al final de la clausura son utilizados para invocar inmediatamente la clausura y obtener el resultado de su ejecución. Esto significa que la instancia de DateFormatter se crea y se asigna a la propiedad dateFormat en el momento en que se define la propiedad
 El motivo detrás de utilizar una var computada (propiedad computada) en lugar de una simple constante es que, en este caso, deseas realizar una inicialización personalizada y asegurarte de que esa inicialización ocurra solo una vez. Al utilizar la var computada con una clausura autoinvocada, puedes asegurarte de que la inicialización ocurra solo una vez al cargar el código, en lugar de cada vez que se accede a la propiedad.
 */
