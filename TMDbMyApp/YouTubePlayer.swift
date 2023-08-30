//
//  YouTubePlayer.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 21/8/23.
//

import SwiftUI
import WebKit

struct YouTubePlayer : UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
