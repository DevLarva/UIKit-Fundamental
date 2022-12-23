//
//  DetailViewController.swift
//  PetGallary
//
//  Created by 백대홍 on 2022/12/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never  // 세부정보 페이지의 선택한 제목 텍스트 크기 설정
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {  // 상단바 보이게 하기
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {  //상단바 숨기기
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    


}
