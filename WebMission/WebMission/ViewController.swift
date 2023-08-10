//
//  ViewController.swift
//  WebMission
//
//  Created by 한보원 on 8/2/23.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet var myWebView: WKWebView!
    
    func loadWebPage(_ url: String){
        let myUrl=URL(string: url)
        let myRequest=URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filePath=Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
        
    }


}

