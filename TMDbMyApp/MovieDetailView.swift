//
//  MoviesDetailView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 9/8/23.
//

import SwiftUI

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
                        Text("Film Trailer")
                    }
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Capsule()
                        .fill(.blue)
                        .shadow(radius: 8, y: 10))
                    
                    Button(action: {
                        showProviders.toggle()
                    }, label: {
                        Image(systemName: "tv.circle.fill")
                        Text(vm.checkEmptyProviders() ? "No providers" : "Just watch" )
                    })
                    .disabled(vm.checkEmptyProviders())
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Capsule()
                        .fill(.blue)
                        .shadow(radius: 8, y: 10))
                    .opacity(vm.checkEmptyProviders() ? 0.3 : 1)//opacidad del boton si no hay providers
                    
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
            } else {
                CustomAlertView(title: "Trailer is not available", message: "Sorry", buttonText: "Go back") {
                    showTrailer.toggle()
                }
            }
        })
        .sheet(isPresented: $showProviders, content: {
            VStack(alignment: .leading) {
                ProvidersView(titleSection: "Buy", providerType: vm.buyProviders)
                ProvidersView(titleSection: "Rent", providerType: vm.rentProviders)
                ProvidersView(titleSection: "Flat rate", providerType: vm.flatRateProviders)
            }
            .frame(maxWidth: .infinity)
            .presentationDetents([.medium, .large])
            .presentationBackground(.thinMaterial)
            .presentationCornerRadius(70)
            .padding()
        })
        .navigationDestination(for: CastMember.self) { member in
            ActorDetailView(vm: ActorDetailVM(castMember: member), size: 400)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MovieDetailView(vm: .previewDetail)
        }
    }
}

