//
//  NewsDescriptionViewController.swift
//  NewsMVVM
//
//  Created by Fahad Bin Raza on 30/12/2022.
//

import UIKit
import WebKit

class NewsDescriptionViewController: UIViewController, WKNavigationDelegate {
    
        var url: String?
    

       private let webView: WKWebView = {
        let prefs = WKPreferences()
        prefs.javaScriptEnabled = true
        let pagePrefs = WKWebpagePreferences()
        pagePrefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.preferences = prefs
        config.defaultWebpagePreferences = pagePrefs

        let webView = WKWebView(frame: .zero, configuration: config)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(webView)
        webView.frame = view.bounds
        webView.navigationDelegate = self
        guard let url = URL(string: url ?? "There is network error") else{
            print("No url found")
            return
        }
        DispatchQueue.main.async {
            self.webView.load(URLRequest(url: url))
        }
       
//        NSLayoutConstraint.activate([
//            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
//        ])
        
    }
   
    

}




    
