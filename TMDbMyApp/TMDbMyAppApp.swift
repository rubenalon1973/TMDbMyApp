//
//  TMDbMyAppApp.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import SwiftUI

@main
struct TMDbMyAppApp: App {
//@stateObject junto con @enviromentobject para cdo más de dos view tiran del vm, entonces lo hacemos desde aquí
    
//    MARK: Mirar @AppStorage prop + usos
    @AppStorage("FirstLaunch") var firstLaunch = true //esta var estará en true al arranque de la app
    
    
    var body: some Scene {
        WindowGroup {
            if firstLaunch {//no hace falta comparar con == si es true, pq la 1ª cond de if siempre es tru(si queremos verificar q es false pondríamos !=)
                PagerView(firstLaunch: $firstLaunch)
            } else {
                MoviesHomeView()
            }
            
//            TODO: Queda pdte el hacer una animación del WellcomeScream, hemos arreglado lo de las llamadas repetidas
//            MoviesHomeView()
////            aunque es 0 la opacidad, hace las llamadas a red, y luego al continuar a la app las hace otra vez
//                .opacity(firstLaunch ? 0 : 1)//para q no aparezca esta view en la 1ª carga de la app
//                .animation(.easeOut, value: firstLaunch)
//                .overlay {
//
//                }
        }
    }
}
