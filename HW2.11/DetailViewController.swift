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
   // let url = URL(string: "\(urlForWebView)")
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController {
    
}
