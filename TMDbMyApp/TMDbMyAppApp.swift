//
//  TMDbMyAppApp.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import SwiftUI

@main
struct TMDbMyAppApp: App {
    var body: some Scene {
        WindowGroup {
            PopularMoviesView(vm: MoviesVm())
        }
    }
}
