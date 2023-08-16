//
//  MoviePosterView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 8/8/23.
//

import SwiftUI

enum posterSize: CGFloat {
    case poster = 120
    case cover = 400
    case grid = 160
}
//MARK: - View para diseño del poster
struct MoviePosterView: View {
    let movie: Movie
    var size: posterSize //= .poster //inicializamos a uno cualquiera
    
    var body: some View {
//        AsyncImage hace el foreach utilizando la fx extensión de URL en capa de config de llamadas
        AsyncImage(url: .getPosterPath(poster: movie.posterPath)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: size.rawValue)//luego al llamarlo pondremos en la vista q sea el tamaño q queramos
                .padding()
        } placeholder: {
            Image(systemName: "star")
                .resizable()
                .scaledToFit()
                .frame(width: size.rawValue)
                .padding()
        }
    }
}

struct MoviePosterView_Previews: PreviewProvider {
    static var previews: some View {
//        le damos el testMovie a la preview
        MoviePosterView(movie: .testMovieDetail, size: .cover)
    }
}
