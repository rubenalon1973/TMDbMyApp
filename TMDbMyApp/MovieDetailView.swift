//
//  MoviesDetailView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 9/8/23.
//

import SwiftUI

//MARK: - Vista detalle para las movie
struct MovieDetailView: View {
    var movie: Movie
    @EnvironmentObject var vm: MovieDetailVm
    
    var body: some View {
        ScrollView {
            VStack {
                MoviePosterView(movie: movie, size: .cover
                                
                )
                    .ignoresSafeArea()//para q ocupe toda la pantalla
                Link(destination: .getLinkMovies(id: movie.id, title: movie.originalTitle)) {
                    Text("Link Movie")
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid (rows: [GridItem()]){
                        ForEach(vm.castMember) { member in
                            ActorPosterView(actor: member, size: 120)
                        }
                        .padding()
                    }
                    .onAppear(perform: {
                        vm.loadMember(id: movie.id)
                    })
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            ShareLink("Share", item: .getLinkMovies(id: movie.id, title: movie.originalTitle))
                        }
                    }
                }
                .ignoresSafeArea()//para q ocupe toda la pantalla
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            
        }
            .environmentObject(PopMoviesVm.previewMovie)
    }
}

