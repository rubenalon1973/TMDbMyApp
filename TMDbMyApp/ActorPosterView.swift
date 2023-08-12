//
//  ActorPosterView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 11/8/23.
//

import SwiftUI

struct ActorPosterView: View {
    let actor: CastMember
    var size:CGFloat = 120
    
    var body: some View {
//        AsyncImage hace el foreach utilizando la fx extensión de URL en capa de config de llamadas
//        el asyncimage gestiona opcionales y no hace falta unwrapp
        AsyncImage(url: .getprofilePath(actor: actor)) { image in
            image
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .frame(width: 150, height: 250)
        } placeholder: {
            Image(systemName: "popcorn")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 250)
        }
    }
}


struct CrewPosterView_Previews: PreviewProvider {
    static var previews: some View {
        ActorPosterView(actor: .testCrew)
    }
}
