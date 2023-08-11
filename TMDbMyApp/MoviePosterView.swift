//
//  MoviePosterView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 8/8/23.
//

import SwiftUI

//MARK: - View para diseño del poster
struct MoviePosterView: View {
    let movie: PopMovie
    var size:CGFloat = 120
    
    var body: some View {
//        AsyncImage hace el foreach utilizando la fx extensión de URL en capa de config de llamadas
        AsyncImage(url: .getPosterPath(poster: movie.posterPath)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: size)
                .padding()
        } placeholder: {
            Image(systemName: "star")
                .resizable()
                .scaledToFit()
                .frame(width: size)
                .padding()
        }
    }
}

struct MoviePosterView_Previews: PreviewProvider {
    static var previews: some View {
//        le damos el testMovie a la preview
        MoviePosterView(movie: .testMovie)
    }
}
