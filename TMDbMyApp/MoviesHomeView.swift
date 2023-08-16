//
//  MoviesHomeView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 13/8/23.
//

import SwiftUI

struct MoviesHomeView: View {
    @ObservedObject var popVM = MoviesVm()
    @ObservedObject var nowPlayVM = MoviesVm(movieType: .nowPlay)
    
    var body: some View {
        TabView {
            MoviesView(vm: popVM)
                .tabItem {
                    Label("Popular", systemImage: "heart.fill")
                }
            MoviesView(vm: nowPlayVM)
                .tabItem {
                    Label("Now Playing", systemImage: "play")
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
            .environmentObject(MoviesVm.previewMovie)
            .environmentObject(MovieDetailVm.previewDetail)
    }
}
