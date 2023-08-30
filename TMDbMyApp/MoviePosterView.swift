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
struct MoviePosterView: View {
    let movie: Movie
    var size: posterSize
    
    var body: some View {
        VStack {
            AsyncImage(url: .getPosterPath(poster: movie.posterPath)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: size.rawValue)
                    .cornerRadius(8)
            } placeholder: {
                Image(systemName: "star")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size.rawValue)
                    .cornerRadius(8)
            }
        }
    }
}

struct MoviePosterView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterView(movie: .testMovieDetail, size: .cover)
    }
}
