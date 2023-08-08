//
//  MoviePosterView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 8/8/23.
//

import SwiftUI

struct MoviePosterView: View {
    let movie: Movie
    var body: some View {
        AsyncImage(url: .getPosterPath(poster: movie.posterPath)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                
        } placeholder: {
            Image(systemName: "star")
                .resizable()
                .scaledToFit()
                .frame(width: 150)

        }
    }
}

struct MoviePosterView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterView(movie: .testMovie)
    }
}
