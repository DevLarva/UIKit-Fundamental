//
//  ViewController.swift
//  PetGallary
//
//  Created by 백대홍 on 2022/12/22.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path  = "/Users/baegdaehong/Desktop/xcode/PetGallary/Pic"
        let filemanager = FileManager.default
        
        let items = try! filemanager.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("Pet") {         // 여기서 사진을 읽어 옴
                pictures.append(item)
            }
        }
        print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // 테이블뷰에 셀로 사진 텍스트 출력
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {  //디테일뷰에 이미지 출력
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
