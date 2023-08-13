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
    @StateObject var vm = PopMoviesVm()
    @StateObject var detalVm = MovieDetailVm()
    
    var body: some Scene {
        WindowGroup {
            MoviesHomeView()
                .environmentObject(vm)
                .environmentObject(detalVm)
        }
    }
}
