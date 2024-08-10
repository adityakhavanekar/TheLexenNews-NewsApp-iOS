//
//  WebViewController.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/9/24.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var newsUrl:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }
    
    @IBAction func dismissButtonClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func getNewsUrl(url:String){
        newsUrl = url
    }
    
    private func setupWebView(){
        let preference  = WKWebpagePreferences()
        preference.preferredContentMode = .mobile
        preference.allowsContentJavaScript = true
        let configration = WKWebViewConfiguration()
        configration.defaultWebpagePreferences = preference
        if let url = URL(string: newsUrl){
            webView.load(URLRequest(url: url))
        }
    }
}
