//
//  MoviesDetailView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 9/8/23.
//

import SwiftUI

//MARK: - Vista detalle para las movie
struct MovieDetailView: View {
    @ObservedObject var vm: MovieDetailVM
    
    var body: some View {
        ScrollView {
            VStack {
                MoviePosterView(movie: vm.selectedMovie, size: .cover
                )
                .ignoresSafeArea()//para q ocupe toda la pantalla
                HStack {
                    VStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 30))
                            .padding(0.5)
                        Text("\(vm.selectedMovie.rank)/10")
                        Text("\(vm.selectedMovie.releaseYear)")
                            .font(.title3)
                    }
                }
                Link(destination: .getLinkMovies(id: vm.selectedMovie.id, title: vm.selectedMovie.originalTitle)) {
                    Image(systemName: "link")
                        .foregroundColor(.accentColor)
                    Text("Show in TMDb")
                        .font(.title3)
                }
                .padding()
                VStack {
                    Text(vm.selectedMovie.originalTitle)
                        .font(.title2)
                        .bold()
                        .padding(8)
                    Text(vm.selectedMovie.overview)
                        .padding()
                    
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid (rows: [GridItem()]){
                        ForEach(vm.castMember) { member in
                            ActorPosterView(actor: member, size: 120)
                        }
                        .padding(8)
                    }
                    .onAppear(perform: {
                        vm.loadMember(id: vm.selectedMovie.id)
                    })
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            ShareLink("Share", item: .getLinkMovies(id: vm.selectedMovie.id, title: vm.selectedMovie.originalTitle))
                        }
                    }
                }
                .ignoresSafeArea()//para q ocupe toda la pantalla
            }
        }
    }
}
//MARK: Los constructores de las vistas pedirán en su inicialización las prop no inicializadas q contenga el struct dentro
struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MovieDetailView(vm: .previewDetail)
        }
    }
}

