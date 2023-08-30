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
    @State var progress = false
    
    
    var body: some View {
        Text(movie.rank)
            .bold()
            .font(size == .small ? .body : .title)
            .foregroundColor(.black)
            .padding(size == .small ? 6 : 15)
            .background {
                Circle()
                    .fill(Color(white: 0.9))
            }
            .background {
                Circle()
                    .trim(from: 0.0, to: progress ? (movie.voteAverage / 10) : 0)
                    .stroke(lineWidth: size == .small ? 6 : 10)
                    .fill(movie.voteAverage > 8 ? Color.green : Color.red)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 2), value: progress)
            }
            .background {
                Circle()
                    .stroke(lineWidth: size == .small ? 6 : 10)
                    .fill(Color.gray)
            }
            .onAppear {
                progress = true
            }
            .offset(x: 5, y: 5)
    }
}

struct MovieRankView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRankView(movie: .testMovieDetail)
    }
}
