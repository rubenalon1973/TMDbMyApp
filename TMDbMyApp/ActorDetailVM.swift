//
//  ActorDetailVM.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 17/8/23.
//

import Foundation

final class ActorDetailVM: ObservableObject {
    let repository: MovieRepositoryProtocol
    @Published var selectedActor: Actor?
    @Published var errorMessage: String = ""
    var castMember: CastMember
    
    init(repository: MovieRepositoryProtocol = MoviesRepository.shared, castMember: CastMember) {
        self.repository = repository
        self.castMember = castMember
        self.loadActor(id: castMember.id)
    }
    
    func loadActor(id: Int) {
        Task { @MainActor in
            do {
                selectedActor = try await repository.getActorDetail(id: id)
            } catch {
                errorMessage = "Error fetching actor details: \(error)"
            }
        }
    }
}
