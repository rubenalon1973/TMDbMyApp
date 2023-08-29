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
                            .frame(width: 400)
                            .cornerRadius(8)
                    } placeholder: {
                        Image(systemName: "star")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400)
                            .cornerRadius(8)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Name:")
                            .bold()
                        Text(actor.name)
                            .foregroundColor(.gray)
                        Text("Birthday")
                            .bold()
                        Text(actor.birthday)
                            .foregroundColor(.gray)
                        Text("Place of birth")
                            .bold()
                        Text(actor.placeOfBirth)
                            .foregroundColor(.gray)
                        Text("Popularty")
                            .bold()
                        Text(String(actor.popularity))
                            .foregroundColor(.gray)
                        Text("Biography:")
                            .bold()
                        Text(actor.biography)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)//esto ajusta el ancho del contenido en fx de su relleno, y lo alinea donde quieras
                    .padding(10)
                }
            }
        }
        .padding(.bottom, 120)//para salvar toda la vista con el los tab de abajo de la vista principal
        .ignoresSafeArea()
    }
}

struct ActorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActorDetailView(vm: .previewCast, size: 400)
    }
}
