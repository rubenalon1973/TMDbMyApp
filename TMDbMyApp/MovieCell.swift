//
//  MovieCell.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 8/8/23.
//

import SwiftUI

enum CellType {
    case list
    case grid
}

struct MovieCell: View {
    let movie: Movie
    @State var listType: CellType
    
    var body: some View {
        switch listType {
        case .list:
            HStack {
                MoviePosterView(movie: movie, size: .poster)
                    .overlay(alignment: .bottomTrailing) {
                        MovieRankView(movie: movie)
                    }
                VStack(alignment: .leading){
                    Text(movie.title)
                        .font(.title2)
                        .bold()
                    Text("Year: \(movie.releaseYear)")
                        .padding(1)
                        .foregroundColor(.gray)
                        .bold()
                }
                .padding(10)
            }
        case .grid:
            MoviePosterView(movie: movie, size: .grid)
                .overlay(alignment: .bottomTrailing) {
                    MovieRankView(movie: movie)
                }
        }
        
    }
}

struct MovieCell_Previews: PreviewProvider {
    let movie: Movie
    static var previews: some View {
        VStack {
            MovieCell(movie: .testMovieDetail, listType: .list)
            MovieCell(movie: .testMovieDetail, listType: .grid)
        }
    }
}
