//
//  ViewController.swift
//  SimpleTableView
//
//  Created by 백대홍 on 2023/01/12.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    let korean: [String] = ["가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "타", "파", "하"]
    let english: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" ]
                    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //테이블뷰의 섹션에 있는 row가 몇개여야 하는지 알려달라하는 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        default:
            return 0
            
        }
    }
    //해당 row마다 해당하는 셀을 돌려달라 하는 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
        
        cell.textLabel?.text = text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "한글" : "영어"
    }


}

