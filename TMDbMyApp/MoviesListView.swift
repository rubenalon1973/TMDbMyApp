//
//  PopMoviesListView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 12/8/23.
//

import SwiftUI

struct MoviesListView: View {
    @ObservedObject var vm: MoviesVM//no lo inicializamos pq luego a la preview le pasaremos el que queramos
    
    var type: GetMoviesType//para pasarle .Popular, .Playing, TopRates o Upcoming
    
    var body: some View {
//        TODO: Probar a quitar el NavigationStack del movieView
//        aquí estaría NavigationStack, pero lo tenemos en el MovieView para que nos navegue en el list y en el grid y no crear dos pilas de navegación
        //el list hace el foreach
        List(vm.movies) { movie in
            NavigationLink(value: movie) {
                MovieCell(movie: movie, listType: .list)
                    .onAppear {//quitamos () para q antes de aparecer en la vista hace la acción dentro de las llaves
                        vm.loadNextPage(movie: movie)
                    }
            }
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.clear)
                    .shadow(radius: 10)
            }
        }
//        para elegir el tipo de listado
        .task {
            vm.moviesType = type
        }
        .navigationDestination(for: Movie.self, destination: { movie in
//            si no llamamos al repository en el MovieDetailVM, nos haría las llamadas a la API al navegar en la preview
            MovieDetailView(vm: MovieDetailVM(repository: vm.repository, selectedMovie: movie))
        })
        .navigationTitle(vm.titleView)//elige title el vm con un switch de un enum existente
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

