//
//  PopMoviesGridView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 12/8/23.
//

import SwiftUI


struct MoviesGridView: View {
    //    array(rep:, count:) repite algo x veces
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)
    @ObservedObject var vm: MoviesVM
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid (columns: columns, spacing: 20){//spacing entre poster vertical
                ForEach(vm.movies) { movie in
                    NavigationLink(value: movie) {
                        MovieCell(movie: movie, listType: .grid)
                    }
                            .onAppear {
                                vm.loadNextPage(movie: movie)
                            
                    }
                }
            }
            .padding()
        }
        .navigationDestination(for: Movie.self, destination: { movie in
            MovieDetailView(vm: MovieDetailVM(selectedMovie: movie))
        })
        .navigationTitle(vm.titleView)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    vm.viewType = .list
                } label: {
                    Image(systemName: "list.star")
                }
            }
        }
    }
}

struct PopMoviesGridView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MoviesGridView(vm: .previewMovie)
        }
    }
}
