//
//  MoviesView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import SwiftUI

//MARK: - View principal de las movies
struct MoviesView: View {
    @ObservedObject var vm: MoviesVM //no instanciamos para poder llamar a los dos sitios
    
    var body: some View {
        NavigationStack {
            switch vm.moviesListState {
//            case .isLoading:
//                ProgressView()//florecilla
//                    .controlSize(.large)
//                simplificamos llevando el list en una vista aparte y lo llamamos desde aquí
            case .isLoaded:
//                viene del enum del vm para poder elegir navegar a la vista list o grid
                switch vm.viewType {
                case .list:
                    MoviesListView(vm: vm, type: vm.moviesType)
                case .grid:
                    MoviesGridView(vm: vm)
                }
            case .error:
                CustomAlertView(title: "Something went wrong", message: "Cannot load data", buttonText: "Try again") {
                    vm.loadMovies()
                }
            }
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

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(vm: .previewMovie)
    }
}



