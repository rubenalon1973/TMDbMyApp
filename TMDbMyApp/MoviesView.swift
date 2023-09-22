//
//  MoviesView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 3/8/23.
//

import SwiftUI

struct MoviesView: View {
    @ObservedObject var vm: MoviesVM
    
    var body: some View {
        NavigationStack {
            switch vm.moviesListState {
            case .isLoaded:
                switch vm.viewType {
                case .list:
                    MoviesListView(vm: vm, type: vm.moviesType)
                case .grid:
                    MoviesGridView(vm: vm)
                }
            case .error:
                CustomAlertView(title: "Something went wrong", message: "Cannot load data", buttonText: "Try again") {
                    Task {
                      await vm.loadMovies()
                    }
                }
                    
            }
        }
        .overlay {
            if vm.isLoading {
                ZStack {
                    Color.gray
                    ProgressView()
                        .controlSize(.large)
                }
            }
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(vm: .previewMovie)
    }
}




