//
//  YouTubePlayer.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 21/8/23.
//

import SwiftUI
//para poder abrir una pag web dentro de nuestra app
import WebKit

//UIViewRepresentable es como una view de UIKit en SwiftUI
struct YouTubePlayer : UIViewRepresentable {
    let url: URL
//    estas  2 fx son siempre protocolo de UIViewRepresentable
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
