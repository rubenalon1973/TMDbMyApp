//
//  PopMoviesListView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 12/8/23.
//

import SwiftUI

struct MoviesListView: View {
    @ObservedObject var vm: MoviesVM
    var type: GetMoviesType
    
    var body: some View {
        List(vm.movies) { movie in
            NavigationLink(value: movie) {
                MovieCell(movie: movie, listType: .list)
                    .onAppear {
                        vm.loadNextPage(movie: movie)
                    }
            }
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.clear)
                    .shadow(radius: 10)
            }
        }
        .task {
            vm.moviesType = type
        }
        .navigationDestination(for: Movie.self, destination: { movie in
            MovieDetailView(vm: MovieDetailVM(repository: vm.repository, selectedMovie: movie))
        })
        .navigationTitle(vm.titleView)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    vm.viewType = .grid
                } label: {
                    Image(systemName: "squareshape.split.2x2")
                }
                
            }
        }
    }
}

struct PopMoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MoviesListView(vm: .previewMovie, type: .popular)
        }
    }
}

