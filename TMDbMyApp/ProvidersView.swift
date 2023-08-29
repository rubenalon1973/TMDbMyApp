//
//  ProvidersView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 29/8/23.
//

import SwiftUI



struct ProvidersView: View {
    let titleSection: String
    let providerType: [WatchProviderItem]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(titleSection)
                .font(.title2)
                .bold()
            HStack {
                ForEach(providerType) { provider in
                    AsyncImage(url: URL(string: "https://www.themoviedb.org/t/p/original/\(provider.logoPath)")!) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                    } placeholder: {
                        Image(systemName: "film")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ProvidersView_Previews: PreviewProvider {
    static var previews: some View {
        ProvidersView(titleSection: "Buy", providerType: [])
    }
}
