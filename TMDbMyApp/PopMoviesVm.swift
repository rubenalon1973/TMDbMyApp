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
    case isLoading
    case isLoaded
    case error
}
//para nav a una vista u otra
enum MoviesStyle {
    case listView
    case gridView
}

final class PopMoviesVm: ObservableObject {
//    para poder decirle de que datos tirar. NO inicializamos y x eso tenmos el init
    let repository: MovieRepositoryProtocol
    var page = 1
    
    @Published var movies: [PopMovie] = []
    @Published var errorMessage = ""
    @Published var isLoading = false//para el loading al iniciar la app
//    inyección de dependencias, para poder decirle de q repository tirar, por defecto será del real, sino se lo indicamos
    @Published var moviesListState: MovieListState = .isLoading//para el switch de la vista
    @Published var moviesStyle: MoviesStyle = .listView
    
    init(repository: MovieRepositoryProtocol = MoviesRepository.shared) { self.repository = repository//posibilidad de cargar de otro, esta es la inicialización, y sino le decimmos nada coge el real y sino le diremos aqui el otro que queramos
        loadMovies()
    }
    
    func loadMovies() {
        Task { @MainActor in
            do {
//                sleep(3)//podemos poner esto para ver que sale el isloading, pero lo quitamos pq sino la preview se raya pq dice que ha tardado + de 5seg en hacerlo
                movies += try await repository.getPopMovies(page: page)//+= para q no se borren las anteriores
                moviesListState = .isLoaded//cdo acaba de cargar las pelis
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
    //    para comprobar si estamos en el último item, y sumamos una pag(llamamos a la fx de debajo de esta)
    func loadNextPage(movie: PopMovie) {
        if isLastItem(movie: movie) {
            page += 1
            loadMovies()
        }
        }
//    esto busca la última pos de nuestra lista
    func isLastItem(movie: PopMovie) -> Bool {
//        si utilizamos last sobre array puede q no lo haya por eso ?
        movies.last?.id == movie.id
    }
}