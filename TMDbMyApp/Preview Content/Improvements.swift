//
//  Improvements.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 24/8/23.
//

import Foundation

//TODO: - GENERALES CON ALBERTO
/*
 - Arreglar la repetición de las llamadas -> es normal en el ciclo de vida de la app en swiftUI, no importa
 - Retorno a inicio Scroll pulsando en el Tab, o volver a la vista de los tab
 - Crear barra de "search"
 - Meter las series
 - TODO: Test de la app:
 - DetailView expandir image al tocarla
 - Maxland Cine -> mirar en AppStore(Jordi Villaró Ferré) mirar en Linkedin
 
 * Comentarios prueba técnica
 Testing. Sobre todo en proyectos de largo recorrido consideramos de gran importancia el testing para asegurar que la implementación es correcta. En muchas ocasiones el resultado parece correcto pero existen errores o problemas en ciertas situaciones, y el testing es importante para detectar y corregir esos casos.
 Tests unitarios. En mi opinión la gran mayoría de tests deberían ser unitarios, y probar la lógica interna de la app. En el caso de usar MVVM se deberían testear los view models, cambiando la implementación de las llamadas de red por respuestas fijas que no realicen ningún side effect. Aquí también entrarían tests de parsing de las respuestas del servidor, pero usando respuestas fijas.
 Los tests de integración, con llamadas reales, pueden ser útiles en ciertos casos, pero son tests que fallarán con cierta frecuencia (timeout, servidor caído, etc). Por este motivo el testing debería centrarse sobre todo en la lógica local de la aplicación.
 Para cambiar la implementación que se usa para testing (o previews) tenemos varias opciones: podemos usar un protocolo que use el ViewModel para abstraerlo de las operaciones concretas, o podríamos usar structs con funciones almacenadas en variables, lo que permite más flexibilidad.
 */



//TODO: - INDIVIDUALES
/*
 - TODO: Probar a quitar el NavigationStack del movieView
 - Arreglar el fondo del poster del Actor en el detail, q se ve mal en mi Iphone
 - TODO: Poner el rankView en mi detail y mirar opacidad y q empiece el poster debajo del toolbar
 - TODO: Hacer la app de nuevo sin componetizar, más sencilla, aunque tenga más código
 - Wellcome Scream igualar fotos tamaño
 */
