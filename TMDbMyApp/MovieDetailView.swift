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
    @State var showProviders = false
    @State var showTrailer = false
    
    var body: some View {
        ScrollView {
            VStack {
                MoviePosterView(movie: vm.selectedMovie, size: .cover
                )
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
                                .padding()
                HStack(spacing: 10) {

                  Button {

                  } label: {
                    VStack {
                      Image(systemName: "link.circle")
                      Text("Link")
                    }
                    .font(.title2)
                    .frame(width: 100, height: 100)
                  }
                  .buttonStyle(.bordered)

                  Button {
                  
                  } label: {
                    VStack {
                      Image(systemName: "play.circle")
                      Text("Trailer")
                    }
                    .font(.title2)
                    .frame(width: 100, height: 100)
                  }
                  .buttonStyle(.bordered)

                  Button {

                  } label: {
                    VStack {
                      Image(systemName: "tv.circle")
                      Text("Providers")
                    }
                    .font(.title2)
                    .frame(width: 100, height: 100)
                  }
                  .buttonStyle(.bordered)
                }
                .padding()

//                HStack(spacing: 20) {
//                    Link(destination: .getLinkMovies(id: vm.selectedMovie.id, title: vm.selectedMovie.originalTitle)) {
//                        Image(systemName: "link.circle.fill")
//                        Text("Show in TMDb")
//                    }
//                    .buttonStyle(.borderedProminent)
//                    .frame(width: 100, height: 100)
//                    .background(.white)
//                    .clipShape(Circle())
////                    .overlay(
////                          RoundedRectangle(cornerRadius: 10)
////                            .stroke(.blue, lineWidth: 1)
////                        )
//                    Button {
//                        showTrailer.toggle()
//                    } label: {
//                       Image(systemName: "play.circle.fill")
//                       Text("Trailer")
//                    }
//                    .buttonStyle(.borderedProminent)
//                    .frame(width: 100, height: 200)
//                    .background(.white)
//                    .clipShape(Circle())
////                    .overlay(
////                          RoundedRectangle(cornerRadius: 10)
////                            .stroke(.gray, lineWidth: 1)
////                        )
//    //                MARK: Para ver en que plataformas está
//                    Button(action: {
//                        showProviders.toggle()
//                    }, label: {
//                        Image(systemName: "tv.circle.fill")
//                        Text("Whatch Providers")
//                    })
//                    .buttonStyle(.borderedProminent)
//                    .frame(width: 100, height: 100)
//                    .background(.white)
//                    .clipShape(Circle())
////                    .overlay(
////                          RoundedRectangle(cornerRadius: 10)
////                            .stroke(.gray, lineWidth: 1)
////                        )
//                }
                    
                VStack(alignment: .leading) {
                    Text(vm.selectedMovie.originalTitle)
                        .font(.title2)
                        .bold()
                        .padding(8)
                    Text(vm.selectedMovie.overview)
                        .foregroundColor(.gray)
                        .padding()                    
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid (rows: [GridItem()]){
                        ForEach(vm.castMember) { member in
                            NavigationLink(value: member) {
                                ActorPosterView(actor: member, size: 120)
                            }
                        }
                        .padding(8)
                    }
                    .onAppear(perform: {
                        vm.loadMember(id: vm.selectedMovie.id)
                    })
                }
                .padding(.bottom, 120)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                ShareLink("Share", item: .getLinkMovies(id: vm.selectedMovie.id, title: vm.selectedMovie.originalTitle))
            }
        }
        .ignoresSafeArea(.all)
        .sheet(isPresented: $showTrailer, content: {
            if let trailer = vm.oneTrailer,
               let url = URL(string: "https://www.youtube.com/watch?v=\(trailer.key)") {
                YouTubePlayer(url: url)
            }
        })
        
        .navigationDestination(for: CastMember.self) { member in
            ActorDetailView(vm: ActorDetailVM(castMember: member), size: 400)
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

