//
//  PopMoviesView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import SwiftUI

//MARK: - View principal de las movies
struct PopMoviesView: View {
    @ObservedObject var vm: PopMoviesVm //no instanciamos para poder llamar a los dos sitios
    
    var body: some View {
        NavigationStack {
            //el switch es una máquina de estado, que sustituye al if comentado de abajo, queda mejor
            switch vm.moviesListState {
            case .isLoading:
                ProgressView()//florecilla
                    .controlSize(.large)
            case .isLoaded:
                //el list hace el foreach
                List(vm.movies) { movie in
                    NavigationLink(value: movie) {
                        MovieCell(movie: movie)
                            .onAppear {//quitamos () para q antes de aparecer en la vista hace la acción dentro de las llaves
                                vm.loadNextPage(movie: movie)
                            }
                    }
                }
                .navigationDestination(for: PopMovie.self, destination: { movie in
                    MovieDetailView(movie: movie, vm: MovieDetailVm())
        })
                .navigationTitle("Popular movies")
            case .error:
                CustomAlertView(title: "Something went wrong", message: "Cannot load data", buttonText: "Try again") {
                    vm.loadMovies()
                }

            }
            /*
             Esta opción es menos estética en el código:
             
             if !vm.isLoading {//negamos el isloading
             List(vm.movies) { movie in
             MovieCell(movie: movie)
             }
             .navigationTitle("Movies")
             } else {
             ProgressView()//florecilla
             .controlSize(.large)
             }
             
             */
        }
        .refreshable {//refresca la view
            vm.loadMovies()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PopMoviesView(vm: .preview)
    }
}
