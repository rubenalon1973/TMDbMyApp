//
//  PopMoviesListView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 12/8/23.
//

import SwiftUI

struct MoviesListView: View {
    @ObservedObject var vm: MoviesVm//no lo inicializamos pq luego a la preview le pasaremos el que queramos
    
    var type: GetMoviesType//para pasarle .Popular o .Playing
    
    var body: some View {
        //el list hace el foreach
        List(vm.movies) { movie in
            NavigationLink(value: movie) {
                MovieCell(movie: movie)
                    .onAppear {//quitamos () para q antes de aparecer en la vista hace la acción dentro de las llaves
                        vm.loadNextPage(movie: movie)
                    }
            }
        }
        .task {
            vm.moviesType = type
        }
        .navigationDestination(for: Movie.self, destination: { movie in
            MovieDetailView(vm: MovieDetailVm(selectedMovie: movie))
        })
        .navigationTitle("Popular movies")
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

