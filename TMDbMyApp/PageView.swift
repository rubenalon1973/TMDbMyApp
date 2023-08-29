//
//  PageView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 19/8/23.
//

import SwiftUI

struct PageView: View {
    let page: PageModel
    @State var offsetY = CGFloat.zero
    
    var body: some View {
        
        ZStack{
            
            Image(page.image)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
            
            // Fondo semi-transparente
            Color.black
                .opacity(0.7)
            
            VStack(alignment: .leading) {
                Text(page.title)
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                Text(page.description)
                    .foregroundColor(.white)
                    .padding()
                
            }
        }
        .ignoresSafeArea()
    }
    
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: PageModel(title: "Title", description: "Description", image: "cineApp", tag: 0))
    }
}
