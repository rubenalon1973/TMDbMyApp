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
        //        tenemos aquí el NavigationStack para que nos sirva para el List y el Grid
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
//                        .listRowBackground(Color.blue)
//                        .background(.blue)
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
            if vm.isLoading {//salta la florecilla de carga,  q es una vista
                ZStack {
                    Color.gray
                    ProgressView()
                        .controlSize(.large)
                }
//                .ignoresSafeArea()
            }
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(vm: .previewMovie)
    }
}




