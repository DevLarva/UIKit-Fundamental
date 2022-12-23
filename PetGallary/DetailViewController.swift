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
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    


}
