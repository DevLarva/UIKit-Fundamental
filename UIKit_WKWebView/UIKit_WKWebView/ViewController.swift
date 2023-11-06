//
//  ViewController.swift
//  UIKit_WKWebView
//
//  Created by 백대홍 on 11/6/23.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!     ///WKWebView 인스턴스를 저장할 webview 변수 선언
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self   ///webView의 navigationDelegate를 현재 뷰 컨트롤러로 설정합니다.
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.hackingwithswift.com")!  ///URL 객체 생성
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true  ///webview에서 앞, 뒤로 이동하는 제스처 허용
    }


}

