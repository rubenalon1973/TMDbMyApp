//
//  MovieDetailVm.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 10/8/23.
//

import Foundation

final class MovieDetailVm: ObservableObject {
    let repository: MovieRepositoryProtocol
    
    @Published var castMember: [CastMember] = []
    
    init(repository: MovieRepositoryProtocol = MoviesRepository.shared) {
        self.repository = repository
    }
    
    func loadMember(id: Int) {
        Task { @MainActor in
            do {
                castMember = try await repository.getCastMember(id: id)
            } catch {
                print("error load member")//MARK: QUITAR PRINT
                castMember = []
            }
        }
    }
}


