//
//  PopMoviesListView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 12/8/23.
//

import SwiftUI

struct PopMoviesListView: View {
    @EnvironmentObject var vm: PopMoviesVm
    
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
            vm.loadMovies()
        }
        .navigationDestination(for: Movie.self, destination: { movie in
            MovieDetailView(movie: movie)
        })
        .navigationTitle("Popular movies")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    vm.moviesStyle = .gridView
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
            PopMoviesListView()
                .environmentObject(PopMoviesVm.previewMovie)
        }
        .environmentObject(MovieDetailVm.previewDetail)
    }
}

