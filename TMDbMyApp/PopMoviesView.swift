//
//  PopMoviesView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import SwiftUI

//MARK: - View principal de las movies
struct PopMoviesView: View {
    @EnvironmentObject var vm: PopMoviesVm //no instanciamos para poder llamar a los dos sitios
    
    var body: some View {
        NavigationStack {
            //el switch es una máquina de estado, que sustituye al if comentado de abajo, queda mejor
            switch vm.moviesListState {
//            case .isLoading:
//                ProgressView()//florecilla
//                    .controlSize(.large)
//                simplificamos llevando el list en una vista aparte y lo llamamos desde aquí
            case .isLoaded:
//                viene del enum del vm para poder elegir navegar a la vista list o grid
                switch vm.moviesStyle {
                case .listView:
                    PopMoviesListView()
                case .gridView:
                    PopMoviesGridView()
                }
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
        .overlay {
            if vm.isLoading {
                ZStack {
                    Color.blue
                    ProgressView()
                        .controlSize(.large)
                }
            }
        }
        .refreshable {//refresca la view
            vm.loadMovies()
        }
    }
}
//MARK: MIRAR EL ENVIRONMENT
struct PopMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        PopMoviesView()
            .environmentObject(PopMoviesVm.previewMovie)
            .environmentObject(MovieDetailVm.previewDetail)
    }
}




