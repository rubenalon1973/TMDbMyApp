//
//  PageView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 19/8/23.
//

import SwiftUI

struct PageView: View {
    let page: PageModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(page.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: .infinity)
                .ignoresSafeArea()
            
            Color.black
                .opacity(0.2)
            
            VStack(alignment: .leading, spacing: 16) {
                Text(page.title)
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                    .padding(.horizontal)
                Text(page.description)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }
        }
        .padding()
        .ignoresSafeArea()
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: PageModel(title: "Bienvenido a la magia del cine", description: "Bienvenido al fascinante mundo del cine. Descubre las últimas novedades, explora los clásicos imprescindibles y sumérgete en la magia del séptimo arte", image: "jake-hills-23LET4Hxj_U-unsplash", tag: 0))
    }
}
