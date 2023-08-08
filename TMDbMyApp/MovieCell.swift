//
//  MovieCell.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 8/8/23.
//

import SwiftUI

struct MovieCell: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            MoviePosterView(movie: movie)
                .overlay(alignment: .bottomTrailing) {//lo contrario a background
                    MovieRankView(movie: movie)
                }
            VStack {
                Text(movie.originalTitle)
                    .font(.title2)
                Text("Year: \(movie.releaseYear)")
            }
        }
    }
}

struct MovieCell_Previews: PreviewProvider {
    let movie: Movie
    static var previews: some View {
        MovieCell(movie: .testMovie)
    }
}
