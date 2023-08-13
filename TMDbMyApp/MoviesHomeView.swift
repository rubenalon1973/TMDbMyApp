//
//  MoviesHomeView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 13/8/23.
//

import SwiftUI

struct MoviesHomeView: View {
    var body: some View {
        TabView {
            PopMoviesView()
                .tabItem {
                    Label("Popular", systemImage: "heart.fill")
                }
            Text("Now Playing")
                .tabItem {
                    Label("Top Rate", systemImage: "play")
                }
            Text("Top Rated")
                .tabItem {
                    Label("Top Rated", systemImage: "star.fill")
                }
            Text("Upcoming")
                .tabItem {
                    Label("Upcoming", systemImage: "calendar")
                }
        }
    }
}

struct MoviesHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesHomeView()
            .environmentObject(PopMoviesVm.previewMovie)
            .environmentObject(MovieDetailVm.previewDetail)
    }
}
