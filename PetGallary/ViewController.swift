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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
}
