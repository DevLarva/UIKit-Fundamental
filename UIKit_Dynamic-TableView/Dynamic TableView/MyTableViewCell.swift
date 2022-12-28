//
//  MyTableViewCell.swift
//  Dynamic TableView
//
//  Created by 백대홍 on 2022/12/24.
//

import Foundation
import UIKit

class MyTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userProfileImg: UIImageView!
    
    @IBOutlet weak var userContentLabel: UILabel!
    
    
   //cell이 렌더링 될때
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("MyTableViewCell - awakeFromNib() called")
        
        userProfileImg.layer.cornerRadius = userProfileImg.frame.width / 2
    }
}
