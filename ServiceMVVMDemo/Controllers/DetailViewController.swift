//
//  DetailViewController.swift
//  ServiceMVVMDemo
//
//  Created by Bharat Khatke on 22/08/20.
//  Copyright © 2020 Bharat Khatke. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var articleModel: ArticleViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
    }
    
    func loadWebView() {
        
        
        self.navigationController?.navigationBar.tintColor = .white
        
        let urlString = articleModel.url
            
        guard let url = URL(string: urlString) else {
            fatalError("URL is not correct")
        }
        
        let urlRequest = URLRequest(url: url)
        
        webView.load(urlRequest)
    }
    
    
}
