//
//  MovieDetailVM.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 10/8/23.
//

import Foundation

enum ProviderType {
    case buy
    case rent
    case flatRate
}


final class MovieDetailVM: ObservableObject {
    let repository: MovieRepositoryProtocol
    let selectedMovie: Movie//para la seleccion de la peli q vamos a ver en detalle
    var providerType: ProviderType = .buy
    
    @Published var castMember: [CastMember] = []
    @Published var trailers: [MoviesVideos] = []
    @Published var providers: WatchProvidersResponse?//al no ser array le damos valor nil
    
    
//    MARK: - Variable calculada (computed property) ------------------------------
    /*
     Las principales diferencias entre una variable calculada (computed property) y una función en Swift son:

     Sintaxis: una propiedad calculada se declara como parte de una struct/class usando get { } set { }, mientras que una función se declara con la palabra func.
     Llamada: una propiedad calculada se accede como cualquier otra propiedad con ., mientras que una función se llama con ().
     Valor de retorno: una propiedad calculada retorna un valor, una función puede retornar o no un valor.
     Almacenamiento: una propiedad calculada no almacena un valor, calcula uno nuevo cada vez. Una función puede guardar estado entre llamadas.
     Parámetros: una propiedad calculada no recibe parámetros. Una función puede aceptar múltiples parámetros.
     Mutabilidad: una propiedad calculada puede ser de solo lectura (get) o de lectura/escritura (get y set). Una función es siempre inmutable.
     Tipo de retorno: la propiedad calculada debe tener siempre el mismo tipo de retorno en get y set. Una función puede tener diferentes tipos de retorno.
     En resumen, una propiedad calculada es como una función embebida en una struct/class, mientras que una función es independiente. Se elige una u otra según si tiene sentido "adjuntar" esa lógica a un tipo dado o no.
     */
    
    
    var oneTrailer: MoviesVideos? {
//        trailers.first { trailer in
//            trailer.official == true
//        }
        trailers.filter{ $0.type == "Trailer" && $0.official == true }.first
    }
    
    var buyProviders: [WatchProviderItem] {
        guard let providers = providers?.results["ES"]?.buy else { return [] }
        
        return providers

    }
    
    var rentProviders: [WatchProviderItem] {
        guard let providers = providers?.results["ES"]?.rent else { return [] }
        
        return providers
    }
    
    var flatRateProviders: [WatchProviderItem] {
        guard let providers = providers?.results["ES"]?.flatRate else { return [] }
        
        return providers
    }
    
//    aquí llamamos a las fx al entrar en detail
    init(repository: MovieRepositoryProtocol = MoviesRepository.shared, selectedMovie: Movie) {
        self.repository = repository
        self.selectedMovie = selectedMovie
        self.loadMember(id: selectedMovie.id)
        self.loadTrailer(id: selectedMovie.id)
        self.loadProviders(id: selectedMovie.id)
    }
    
    func loadMember(id: Int) {
        Task { @MainActor in //MainActor como va a haber cambios en la UI de detail
            do {
                castMember = try await repository.getCastMember(id: id)
            } catch {
                print("error load member")//MARK: QUITAR PRINT
                castMember = []
            }
        }
    }
    
    func loadTrailer(id: Int) {
        Task { @MainActor in
            do {
                trailers = try await repository.getMoviesVideos(id: id)
            } catch {
                print("error load trailer")//MARK: QUITAR PRINT
                trailers = []
            }
        }
    }
    
    func loadProviders(id: Int) {
        Task { @MainActor in
            do {
                providers = try await repository.getWatchProviders(id: id)
            } catch {
                print("error load provider")//MARK: QUITAR PRINT
                providers = nil
            }
        }
    }
}


