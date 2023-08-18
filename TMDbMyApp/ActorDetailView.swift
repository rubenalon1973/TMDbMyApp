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
                AsyncImage (url: .getProfilePathActor(actor: vm.selectedActor)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400)
                        .cornerRadius(8)
                        .padding()
                } placeholder: {
                    Image(systemName: "star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400)
                        .cornerRadius(8)
                        .padding()
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Group {
                        Text("Name:")
                            .bold()
                        Text(vm.selectedActor.name)
                        
                        Text("Birthday")
                            .bold()
                        Text(vm.selectedActor.birthday)
                        
                        Text("Place of birth")
                        Text(vm.selectedActor.placeOfBirth)
                    }
                    Group {
                        Text("Popularty")
                        Text(String(vm.selectedActor.popularity))
                        
                        Text("Biography:")
                            .bold()
                        Text(vm.selectedActor.biography)
                    }
                    
                   

                }
                .padding(10)
            }
            .frame(maxWidth: 400)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(radius: 10)
            }
        }
    }
}

struct ActorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActorDetailView(vm: ActorDetailVM(selectedActor: .testActorDetail), size: 400)
    }
}
