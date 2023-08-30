//
//  TMDbMyAppApp.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import SwiftUI

@main
struct TMDbMyAppApp: App {
    @AppStorage("FirstLaunch") var firstLaunch = true
    
    var body: some Scene {
        WindowGroup {
            if firstLaunch {
                PagerView(firstLaunch: $firstLaunch)
            } else {
                MoviesHomeView()
            }
        }
    }
}
