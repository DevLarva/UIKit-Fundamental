//
//  WelcomeViewController.swift
//  Spotify_UIKit
//
//  Created by 백대홍 on 11/29/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Sign In with Spotify", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Spotify"
        view.backgroundColor = .systemBlue
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(x: 20, y: view.height-50-view.safeAreaInsets.bottom, width: view.width-40, height: 50)
    }
    @objc func didTapSignIn() {
        let vc = AuthViewController()
        vc.completionHanler = { [weak self] success in
            DispatchQueue.main.async {
                self?.hangleSignIn(success: success)
            }
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func hangleSignIn(success:Bool) {
        guard success else {
            let alert = UIAlertController(title: "이런..", message: "로그인 시도 중 뭔가 잘못된거 같습니다... ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "나가기", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        
        let mainAppTabBarVC = TabBarViewController()
        mainAppTabBarVC.modalPresentationStyle = .fullScreen
        present(mainAppTabBarVC, animated: true)
    }
}
