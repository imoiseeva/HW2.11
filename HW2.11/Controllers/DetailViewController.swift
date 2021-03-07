//
//  DetailViewController.swift
//  HW2.11
//
//  Created by Irina Moiseeva on 05.03.2021.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate{

    var webView: WKWebView!
    var urlForWebView = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        if let url = URL(string: "\(urlForWebView)") {
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        }
    }
}

