//
//  ActorDetailView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 17/8/23.
//

import SwiftUI

struct ActorDetailView: View {
    @ObservedObject var vm: ActorDetailVM
    var size: CGFloat
    
    var body: some View {
        ScrollView {
            VStack {
                if let actor = vm.selectedActor {
                    AsyncImage (url: .getProfilePathActor(actor: actor)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                            .cornerRadius(8)
                    } placeholder: {
                        Image(systemName: "star")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                            .cornerRadius(8)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Name:")
                            .bold()
                        Text(actor.name)
                        
                        Text("Birthday")
                            .bold()
                        Text(actor.birthday)
                        
                        Text("Place of birth")
                            .bold()
                        Text(actor.placeOfBirth)
                        
                        Text("Popularty")
                            .bold()
                        Text(String(actor.popularity))
                        
                        Text("Biography:")
                            .bold()
                        Text(actor.biography)
                    }
                    .padding(10)
                }
            }
            
        }
        .padding(.bottom, 80)
        .ignoresSafeArea()
    }
}

struct ActorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActorDetailView(vm: .previewCast, size: 400)
    }
}
