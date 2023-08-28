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
                        
                    }
                }
                .padding()
                
                VStack(spacing: 20) {
                    Button {
                        showTrailer.toggle()
                    } label: {
                        Image(systemName: "play.circle.fill")
                        Text("Film Trailer ")
                    }
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Capsule()
                        .fill(.blue)
                        .shadow(radius: 8, y: 10))
                    
                    //MARK: Para ver en que plataformas está
                    Button(action: {
                        showProviders.toggle()
                    }, label: {
                        Image(systemName: "tv.circle.fill")
                        Text("Just Watch ")
                    })
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Capsule()
                        .fill(.blue)
                        .shadow(radius: 8, y: 10))
                    
                    Link(destination: .getLinkMovies(id: vm.selectedMovie.id, title: vm.selectedMovie.originalTitle)) {
                        Image(systemName: "link.circle.fill")
                        Text("Website Link")
                    }
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Capsule()
                        .fill(.blue)
                        .shadow(radius: 8, y: 10))
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Title:")
                        .font(.title2)
                        .bold()
                    Text(vm.selectedMovie.title)
                        .foregroundColor(.gray)
                    Text("Original title:")
                        .font(.title2)
                        .bold()
                    Text(vm.selectedMovie.originalTitle)
                        .foregroundColor(.gray)
                    Text("Realease year:")
                        .font(.title2)
                        .bold()
                    Text(vm.selectedMovie.releaseYear)
                        .foregroundColor(.gray)
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    Text(vm.selectedMovie.overview)
                        .foregroundColor(.gray)
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
        .overlay(alignment: .top, content: {
            Rectangle()
                .fill(.thinMaterial)
                .frame(height: 95)
        })
        .ignoresSafeArea()
        
        .sheet(isPresented: $showTrailer, content: {
            if let trailer = vm.oneTrailer,
               let url = URL(string: "https://www.youtube.com/watch?v=\(trailer.key)") {
                YouTubePlayer(url: url)
            }
        })
        .sheet(isPresented: $showProviders, content: {
            VStack(alignment: .leading) {
                Text("Buy")
                    .font(.title2)
                    .bold()
                HStack {
                    ForEach(vm.buyProviders) { provider in
                        AsyncImage(url: URL(string: "https://www.themoviedb.org/t/p/original/\(provider.logoPath)")!) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                        } placeholder: {
                            Image(systemName: "film")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                        }
                    }
                }

                Text("Rent")
                    .font(.title2)
                    .bold()
                HStack {
                    ForEach(vm.rentProviders) { provider in
                        AsyncImage(url: URL(string: "https://www.themoviedb.org/t/p/original/\(provider.logoPath)")!) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                        } placeholder: {
                            Image(systemName: "film")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                        }
                    }
                }
                
                Text("Flat rate")
                    .font(.title2)
                    .bold()
                HStack {
                    ForEach(vm.flatRateProviders) { provider in
                        AsyncImage(url: URL(string: "https://www.themoviedb.org/t/p/original/\(provider.logoPath)")!) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                        } placeholder: {
                            Image(systemName: "film")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                        }
                    }
                }                
            }
            .padding()
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

