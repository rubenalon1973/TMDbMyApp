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
        VStack {
            ZStack {
                AsyncImage(url: .getprofilePathCast(actor: actor)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 220)
                        .cornerRadius(10)
                } placeholder: {
                    Image(systemName: "popcorn")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 220)
                        .cornerRadius(10)
                }
            }
            
            VStack(alignment: .leading, spacing: 3) {
                Text(actor.name)
                    .frame(width: 150, height: .none)
                Text(actor.character)
                    .frame(width: 150, height: .none)
            }
            .padding()
        }
        .frame(maxWidth: 150)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.clear)
                .shadow(radius: 10)
        }
    }
}

struct ActorPosterView_Previews: PreviewProvider {
    static var previews: some View {
        ActorPosterView(actor: .testMember)
    }
}
