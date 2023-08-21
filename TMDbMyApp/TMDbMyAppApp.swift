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
            MoviesHomeView()
                .opacity(firstLaunch ? 0 : 1)//para q no aparezca esta view en la 1ª carga de la app
                .overlay {
                    if firstLaunch {//no hace falta comparar con == si es true, pq la 1ª cond de if siempre es tru(si queremos verificar q es false pondríamos !=)
                        PagerView(firstLaunch: $firstLaunch)
                    }//si quisieramos otra acción con el false pondríamos el else
                }
        }
    }
}
