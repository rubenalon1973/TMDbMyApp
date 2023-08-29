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
    var pagesReal = PageModel.pagesReal
    
    var body: some View {
        //MARK: - TabView. Es un contenedor de vistas, q permite crear una interfaz de usuario con pestañas o similar, y cada una con su contenido
        TabView(selection: $pageIndex) {
            ForEach(pagesReal) { page in
                ZStack {
                    //tenemos en vstack la vista de la page y un condicional para poner un button u otro
                    PageView(page: page)
                        .onTapGesture {
                            if page.id == PageModel.pagesReal.last?.id {
                                firstLaunch = false
                            } else {
                                nextPage()
                            }
                        }
                    
                    VStack {
                        Spacer()
                        if page.id == pagesReal.last?.id {
                            Button {
                                firstLaunch = false
                            } label: {
                                Text("Go to app")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            .padding(.bottom, 60)
                        } else {
                            Button {
                                nextPage()
                            } label: {
                                Text("Next")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            .padding(.bottom, 60)
                        }
                    }
                }
                .tag(page.tag)//es un indicador de posición, los tag, se pone al final del vstack
            }
        }
        .tabViewStyle(.page)//son los 3 puntitos, le hace paginador al tabview
        .indexViewStyle(.page(backgroundDisplayMode: .always))//estilo de los marcadores,  y siempre se verá el fondo de los mismos
        .background(.black)
        //el onAppear se quitan los () y ponemos {} pq es un bloque de cod que vamos a mostrar, pq es un trailing closure
        .onAppear {
            //son la apariencia de los puntitos, de donde está actualx, y de los demás
            dotAppearience.currentPageIndicatorTintColor = .black
            dotAppearience.pageIndicatorTintColor = .white
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
