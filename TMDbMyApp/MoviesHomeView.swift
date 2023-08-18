//
//  MoviesHomeView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 13/8/23.
//

import SwiftUI

struct MoviesHomeView: View {
    @ObservedObject var popVM = MoviesVM()
    @ObservedObject var nowPlayVM = MoviesVM(movieType: .nowPlay)
    @ObservedObject var topRatedVM = MoviesVM(movieType: .topRated)
    @ObservedObject var upcomingVM = MoviesVM(movieType: .upcoming)
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
            MoviesView(vm: topRatedVM)
                .tabItem {
                    Label("Top Rated", systemImage: "star.fill")
                }
            MoviesView(vm: upcomingVM)
                .tabItem {
                    Label("Upcoming", systemImage: "calendar")
                }
        }
    }
}

struct MoviesHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesHomeView(popVM: .previewMovie, nowPlayVM: .previewMovie, topRatedVM: .previewMovie, upcomingVM: .previewMovie)
    }
}
