//
//  MovieCell.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 8/8/23.
//

import SwiftUI

//MARK: - View diseño de la cell
struct MovieCell: View {
    let movie: PopMovie
    
    var body: some View {
        HStack {
            MoviePosterView(movie: movie)
                .overlay(alignment: .bottomTrailing) {//lo contrario a background, es para poner elementos encima de una vista, en este caso abajo a la drcha
                    MovieRankView(movie: movie)//ponemos el círculo de los votos
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
    let movie: PopMovie
    static var previews: some View {
        MovieCell(movie: .testMovie)
    }
}
