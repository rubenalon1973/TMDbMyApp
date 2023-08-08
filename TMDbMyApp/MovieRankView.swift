//
//  MovieRankView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 8/8/23.
//

import SwiftUI

enum VoteRankViewSize {
    case small
    case large
}

struct MovieRankView: View {
    let movie: Movie
        var size: VoteRankViewSize = .small
        
        var body: some View {
            Text(movie.rank)
                .bold()
                .font(size == .small ? .body : .title)
                .padding(size == .small ? 6 : 15)
                .background {
                    Circle()
                        .fill(Color(white: 0.9))
                }
                .background {
                    Circle()
                        .trim(from: 0.0, to: movie.voteAverage / 10)
                        .stroke(lineWidth: size == .small ? 8 : 12)
                        .fill(movie.voteAverage > 8 ? Color.green : Color.orange)
                        .rotationEffect(.degrees(-90))
                }
                .background {
                    Circle()
                        .stroke(lineWidth: size == .small ? 8 : 12)
                        .fill(Color.gray)
                }
                .offset(x: 5, y: 5)
        }
}

struct MovieRankView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRankView(movie: .testMovie)
    }
}
