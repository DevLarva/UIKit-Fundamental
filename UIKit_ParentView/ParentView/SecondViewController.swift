//
//  SecondViewController.swift
//  ParentView
//
//  Created by 백대홍 on 2022/12/28.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var IDLabel:UILabel!
    @IBOutlet weak var PasswordLabel:UILabel!
    @IBOutlet weak var CheckPasswordLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func dismissModal() {                     // 모달 내리기 버튼
        self.dismiss(animated: true, completion: nil)
        print("모달 내려감")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.IDLabel.text = UserInformation.shared.ID
        self.PasswordLabel.text = UserInformation.shared.Password
        self.CheckPasswordLabel.text = UserInformation.shared.CheckPassWord
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
