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
    @ObservedObject var vm: MoviesVm
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid (columns: columns, spacing: 20){//spacing entre poster vertical
                ForEach(vm.movies) { movie in
                    NavigationLink(value: movie) {
                        MoviePosterView(movie: movie, size: .grid)
                            .overlay(alignment: .topLeading) {
                                MovieRankView(movie: movie)
                            }
                            .onAppear {
                                vm.loadNextPage(movie: movie)
                            }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Popular movies")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    vm.viewType = .listView
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
