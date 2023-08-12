//
//  MoviesDetailView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 9/8/23.
//

import SwiftUI

//MARK: - Vista detalle para las movie
struct MovieDetailView: View {
    var movie: PopMovie
//    var crew: CastCrew
    @ObservedObject var vm: MovieDetailVm
    
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
//MARK: lo de debajo es sin descomponetizar:
                            //                                            AsyncImage(url: URL(string: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/\(member.profilePath ?? "lyUyVARQKhGxaxy0FbPJCQRpiaW")")) { image in
                            //                                                image
                            //                                                    .resizable()
                            //                                                    .scaledToFit()
                            //                                                    .cornerRadius(10)
                            //                                                    .frame(width: 150, height: 250)
                            //                                            } placeholder: {
                            //                                                Image(systemName: "popcorn")
                            //                                                    .resizable()
                            //                                                    .scaledToFit()
                            //                                                    .frame(width: 150, height: 250)
                            //                                            }
                            //                                        }
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

struct PopularMoviesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: .testMovie, vm: MovieDetailVm())
    }
}
