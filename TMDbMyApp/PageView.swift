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
        VStack {
            Image(page.image)
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Text(page.title)
                .font(.title)
            Text(page.description)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: PageModel(title: "Title", description: "Description", image: "cineApp", tag: 0))
    }
}
