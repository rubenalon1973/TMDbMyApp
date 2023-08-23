//
//  MovieCell.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 8/8/23.
//

import SwiftUI

//MARK: - View diseño de la cell
struct MovieCell: View {
    let movie: Movie
    @State var progress = false//carga el círculo al arrancar progresivamente, la línea
    
    var body: some View {
        HStack {
            MoviePosterView(movie: movie, size: .poster)
                .overlay(alignment: .bottomTrailing) {//lo contrario a background, es para poner elementos encima de una vista, en este caso abajo a la drcha
                    MovieRankView(movie: movie, progress: $progress)//ponemos el círculo de los votos
                        .onAppear {
                            progress = true
                        }
                }
            VStack(alignment: .leading){
                Text(movie.originalTitle)
//                    .foregroundColor(.gray)
                    .font(.title2)
                    .bold()
                Text("Year: \(movie.releaseYear)")
                    .padding(1)
                    .foregroundColor(.gray)
                    .bold()
            }
            .padding(10)
        }
//        MARK: También se puede poner en el NavigatiónLink
//        .frame(maxWidth: 400)
//        .background {
//            RoundedRectangle(cornerRadius: 10)
//                .fill(Color.white)
//                .shadow(radius: 10)
//        }
    }
}

struct MovieCell_Previews: PreviewProvider {
    let movie: Movie
    static var previews: some View {
        MovieCell(movie: .testMovieDetail)
    }
}
