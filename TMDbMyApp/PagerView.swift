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
    let dotAppearience = UIPageControl.appearance()
    var pagesReal = PageModel.pagesReal
    
    var body: some View {
        TabView(selection: $pageIndex) {
            ForEach(pagesReal) { page in
                ZStack {
                    PageView(page: page)
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
                .tag(page.tag)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .background(.black)
        .onAppear {
            dotAppearience.currentPageIndicatorTintColor = .black
            dotAppearience.pageIndicatorTintColor = .white
        }
    }
    
    func nextPage() {
        pageIndex += 1
    }
}

struct PagerView_Previews: PreviewProvider {
    static var previews: some View {
        PagerView(firstLaunch: .constant(false))
    }
}
