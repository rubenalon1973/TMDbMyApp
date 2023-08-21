//
//  PagerView.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 19/8/23.
//

import SwiftUI

struct PagerView: View {
    @State private var pageIndex = 0
    @Binding var firstLaunch: Bool
    
    let dotAppearience = UIPageControl.appearance()//para personalizar la apariencia de los puntos los cuales indican en q page estamos del Screen
    
//    TODO: - Personalizar con mis textos e imágenes
    var pagesReal: [PageModel] =
             [
                PageModel(title: "Explora un Mundo de Películas", description: "Sumérgete en un vasto océano de películas, desde clásicos atemporales hasta los últimos éxitos de taquilla. ¡Descubre historias que te emocionarán y te cautivarán!", image: "cineApp", tag: 0),
                PageModel(title:  "Encuentra tus Favoritas", description: "Explora y busca tus películas favoritas utilizando nuestras herramientas de búsqueda avanzada. Marca las películas que te encantan y crea tu propia lista personalizada.", image: "cineApp2", tag: 1),
                PageModel(title:  "Mantente al Día", description: "No te pierdas nunca más una nueva película. Nuestra aplicación te mantendrá informado sobre los próximos lanzamientos y te proporcionará detalles exclusivos directamente de The Movie DB.", image: "cineApp3", tag: 2)
             ]
    
    var body: some View {
        
//        MARK: - TabView. Es un contenedor de vistas, q permite crear una interfaz de usuario con pestañas o similar, y cada una con su contenido
        TabView(selection: $pageIndex) {
            ForEach(pagesReal) { page in
                VStack(spacing: 30){
//                    tenemos en vstack la vista de la page y un condicional para poner un button u otro
                    PageView(page: page)
                        .foregroundColor(.white)
                        .lineSpacing(8)
                        .padding(5)
                    if page.id == pagesReal.last?.id {
                        Button {
                            firstLaunch = false
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
                .tag(page.tag)//es un indicador de posición, los tag, se pone al final del vstack
            }
//            ForEach(1..<5) { num in
//                Text("\(num)")
//            }
        }
        .tabViewStyle(.page)//son los 3 puntitos, le hace paginador al tabview
        .indexViewStyle(.page(backgroundDisplayMode: .always))//MARK: ???????????
        .background(.gray)
        
//        el onappear se quitan los () y ponemos {} pq es un bloque de cod que vamos a mostrar, pq es un trailing closure
        .onAppear {
//            son la apariencia de los puntitos, de donde está actualx, y de los demás
            dotAppearience.currentPageIndicatorTintColor = .red
            dotAppearience.pageIndicatorTintColor = .green
        }
    }
    
//    fx para pasar de page en Button
    func nextPage() {
        pageIndex += 1
    }
}

struct PagerView_Previews: PreviewProvider {
    static var previews: some View {
        PagerView(firstLaunch: .constant(false))//esta prop es para darle un valor permanente a la preview, al no tener acceso al binding q no está en este struct y nos lo pide, se usa esta prop
    }
}
