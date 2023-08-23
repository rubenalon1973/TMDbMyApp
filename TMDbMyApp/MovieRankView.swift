//
//  MovieRankView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 8/8/23.
//

import SwiftUI
//MARK: - View para el círculo del porcentaje de votos

//le damos dos opciones con el enum, para poder utilizarlo en dif views
enum VoteRankViewSize {
    case small
    case large
}

struct MovieRankView: View {
    let movie: Movie
    var size: VoteRankViewSize = .small
    @Binding var progress: Bool
    
    
    var body: some View {
        Text(movie.rank)
            .bold()
            .font(size == .small ? .body : .title)//aquí cambia el tamaño en fx del case q se elija
            .foregroundColor(.black)
            .padding(size == .small ? 6 : 15)//aquí cambia el tamaño en fx del case q se elija
            .background {
                Circle()
                    .fill(Color(white: 0.9))
            }
            .background {
                Circle()
                    .trim(from: 0.0, to: progress ? (movie.voteAverage / 10) : 0)
                    .stroke(lineWidth: size == .small ? 6 : 10)//aquí cambia el tamaño en fx del case q se elija
                    .fill(movie.voteAverage > 8 ? Color.green : Color.red)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 2), value: progress)
            }
            .background {
                Circle()
                    .stroke(lineWidth: size == .small ? 6 : 10)//aquí cambia el tamaño en fx del case q se elija
                    .fill(Color.gray)
            }
            .offset(x: 5, y: 5)//ubicación en esta vista, q es dónde se ubicará donde lo sobrepongamos
    }
}

struct MovieRankView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRankView(movie: .testMovieDetail, progress: .constant(true))
    }
}
