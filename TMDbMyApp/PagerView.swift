//
//  PagerView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 19/8/23.
//

import SwiftUI

struct PagerView: View {
    @State private var pageIndex = 0
    
    let dotAppearience = UIPageControl.appearance()//para personalizar la apariencia de los puntos
    
//    MARK: - Personalizar
    var pagesReal: [PageModel] =
             [
                PageModel(title: "Explora un Mundo de Películas", description: "Sumérgete en un vasto océano de películas, desde clásicos atemporales hasta los últimos éxitos de taquilla. ¡Descubre historias que te emocionarán y te cautivarán!", image: "ice1", tag: 0),
                PageModel(title:  "Encuentra tus Favoritas", description: "Explora y busca tus películas favoritas utilizando nuestras herramientas de búsqueda avanzada. Marca las películas que te encantan y crea tu propia lista personalizada.", image: "ice1", tag: 1),
                PageModel(title:  "Mantente al Día", description: "No te pierdas nunca más una nueva película. Nuestra aplicación te mantendrá informado sobre los próximos lanzamientos y te proporcionará detalles exclusivos directamente de The Movie DB.", image: "ice1", tag: 2)
             ]
    
    var body: some View {
//        MARK: ver con + prof prop del TabView
        TabView(selection: $pageIndex) {
            ForEach(pagesReal) { page in
                VStack(spacing: 30){
                    PageView(page: page)
                    if page.id == pagesReal.last?.id {
                        Button {
                            print("Last page")
                        } label: {
                            Text("Go to app")
                                .font(.title)
                        }
                    } else {
                        Button {
                            nextPage()
                        } label: {
                            Text("Next")
                                .font(.title)
                        }
                    }
                    
                }
                .tag(page.tag)//MARK: mirar más en detalle el tag
            }
//            ForEach(1..<5) { num in
//                Text("\(num)")
//            }
        }
        .tabViewStyle(.page)//le convierte en un paginador al tab
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
//        el onappear se quitan los () y ponemos {} pq es un bloque de cod que vamos a mostrar, pq es un trailing closure
        .onAppear {
            dotAppearience.currentPageIndicatorTintColor = .red
            dotAppearience.pageIndicatorTintColor = .green
        }
    }
    
    func nextPage() {
        pageIndex += 1
    }
}

struct PagerView_Previews: PreviewProvider {
    static var previews: some View {
        PagerView()
    }
}
