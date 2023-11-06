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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        let url = URL(string: "https://www.hackingwithswift.com")!  ///URL 객체 생성
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true  ///webview에서 앞, 뒤로 이동하는 제스처 허용
    }

    @objc func openTapped() {   /// open 버튼 누르면 호출되는 함수
        let ac = UIAlertController(title: "Open page", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem =
        navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction) {  ///UIAlertAction 핸들러로 사용되는 함수, 사용자가 선택한 웹사이트의 이름을 받아 해당 웹사이트 로드
        guard let actionTitle = action.title else { return }
        guard let url = URL(string: "https://" + actionTitle) else { return }
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {   /// 웹사이트 로딩이 완료 되었을때 호출되는 WKNavigationDelegate 프로토콜 메서드
        title = webView.title
    }
}



/**
 - WKNavigationDelegate 프로토콜 메서드
    - 이 메서드는 웹사이트의 제목을 뷰 컨트롤러의 타이틀로 설정.
 */
