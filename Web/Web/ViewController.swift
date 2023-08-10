//
//  ViewController.swift
//  Web
//
//  Created by 한보원 on 8/2/23.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivitiyIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String){
        let myUrl=URL(string: url)
        let myRequest=URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.navigationDelegate=self
        loadWebPage("https://blog.naver.com/blwxnhan")
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivitiyIndicator.startAnimating()
        myActivitiyIndicator.isHidden=false
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivitiyIndicator.stopAnimating()
        myActivitiyIndicator.isHidden=false
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivitiyIndicator.stopAnimating()
        myActivitiyIndicator.isHidden=true
    }
    
    func checkUrl(_ url: String) -> String{
        var strUrl=url
        let flag = strUrl.hasPrefix("http://")
        if !flag{
            strUrl="http://"+strUrl
        }
        return strUrl
    }

    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text=""
        loadWebPage(myUrl)
    }
    
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("https://www.naver.com")
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("https://www.youtube.com/?app=desktop&hl=ko")

    }
    
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹페이지</p><p><a href=\"http://2sam.net\">2sam</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath=Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
        
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
    
}

