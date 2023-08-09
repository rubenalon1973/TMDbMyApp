//
//  PopularMoviesDetailView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 9/8/23.
//

import SwiftUI

struct PopularMoviesDetailView: View {
    var movie: Movie
    
    var body: some View {
        ScrollView {
            VStack {
                MoviePosterView(movie: movie, size: 400)
                    .ignoresSafeArea()
                
            }
        }
        .ignoresSafeArea()//para q ocupe toda la pantalla

    }
}

struct PopularMoviesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesDetailView(movie: .testMovie)
    }
}
