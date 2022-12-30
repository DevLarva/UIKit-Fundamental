//
//  ViewController.swift
//  ParentView
//
//  Created by 백대홍 on 2022/12/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var IDField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    @IBAction func touchUpSetButton(_ sender: UIButton) {
        UserInformation.shared.ID = IDField.text
        UserInformation.shared.Password = PasswordField.text
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    


}

