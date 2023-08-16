//
//  PopMoviesVm.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 4/8/23.
//

import Foundation

//estos enum podrían estar dentro del struct pq sólo se van a utilizar para las view de este vm

//para la florecilla
enum MovieListState {
//    case isLoading-> lo borramos pq nos liaba, pq al quitar del init loadmovies, este case no pasaba del isloading y se quedaba en la florecilla
    case isLoaded
    case error
}
//para nav a una vista u otra
enum MoviesViewType {
    case listView
    case gridView
}

enum GetMoviesType {
    case popular
    case nowPlay
}

final class MoviesVm: ObservableObject {
//    para poder decirle de que datos tirar. NO inicializamos y x eso tenmos el init
    let repository: MovieRepositoryProtocol
    var page = 1
    
    @Published var movies: [Movie] = []
    @Published var errorMessage = ""
    @Published var isLoading = true//para el loading al iniciar la app
//    inyección de dependencias, para poder decirle de q repository tirar, por defecto será del real, sino se lo indicamos
    @Published var moviesListState: MovieListState = .isLoaded//para el switch de la vista
    @Published var viewType: MoviesViewType = .listView
    @Published var moviesType: GetMoviesType = .popular
    
    init(movieType: GetMoviesType = .popular, repository: MovieRepositoryProtocol = MoviesRepository.shared) {
        self.repository = repository//posibilidad de cargar de otro, esta es la inicialización, y sino le decimmos nada coge el real y sino le diremos aqui el otro que queramos
        self.moviesType = movieType
        loadMovies()
    }
    
    func loadMovies() {
        Task { @MainActor in
            do {
                //                sleep(3)//podemos poner esto para ver que sale el isloading, pero lo quitamos pq sino la preview se raya pq dice que ha tardado + de 5seg en hacerlo
                switch moviesType {
                case .popular:
                    movies += try await repository.getPopMovies(page: page)//+= para q no se borren las anteriores
                    isLoading = false
                case .nowPlay:
                    movies += try await repository.getNowPlayingMovies(page: page)//+= para q no se borren las anteriores
                    isLoading = false
                }
            } catch let error as NetworkError {
                moviesListState = .error
                errorMessage = error.description
                movies = []
            } catch {
                moviesListState = .error
                movies = []
            }
        }
    }
//    cada vez q se exe se resetea la vista q entremos de nuevo
//    func initialDataValue() {
//        page = 1
//        movies = []
//    }
    //    para comprobar si estamos en el último item, y sumamos una pag(llamamos a la fx de debajo de esta)
    func loadNextPage(movie: Movie) {
        if isLastItem(movie: movie) {
            page += 1
            loadMovies()
        }
        }
//    esto busca la última pos de nuestra lista
    func isLastItem(movie: Movie) -> Bool {
//        si utilizamos last sobre array puede q no lo haya por eso ?
        movies.last?.id == movie.id
    }
}
