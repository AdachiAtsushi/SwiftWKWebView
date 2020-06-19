//
//  ViewController.swift
//  SwiftWKWebView
//
//  Created by 安達篤史 on 2020/06/19.
//  Copyright © 2020 Adachi Atsushi. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView = WKWebView()
    
    // 画面項目定義
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var toolBar: UIToolbar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ViewにWebViewを定義する
        webView.frame = CGRect(x: 0, y: toolBar.frame.size.height, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height * 2)
        view.addSubview(webView)
        
        // WebKitのDelegateメソッドを呼び出し可能にする
        webView.navigationDelegate = self
        
        // ロードの流れの定義をする
        let url = URL(string: "https://www.yahoo.co.jp/")
        let request = URLRequest(url: url!)
        webView.load(request)
        
    }
    
    //========== ロードが開始・終了のメソッドを定義　==========
    // ロードが開始時Delegateメソッド
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.startAnimating()
    }
    
    // ロードが終了時のDelegateメソッド
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
    
    // ========== 画面項目のIBActionを定義 ==========
    // 次のページに遷移
    @IBAction func go(_ sender: Any) {
        webView.goForward()
    }
    
    // 前のページに遷移
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    

}

