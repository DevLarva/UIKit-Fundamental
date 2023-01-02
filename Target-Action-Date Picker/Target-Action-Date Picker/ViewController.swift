//
//  ViewController.swift
//  Target-Action-Date Picker
//
//  Created by 백대홍 on 2023/01/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    let dateFormatter: DateFormatter = {                        //데이터 포멧
        let formatter: DateFormatter = DateFormatter()
//        formatter.dateStyle = .full   // 날짜
//        formatter.timeStyle = .long   // 시간
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"                   //위 2개처럼 쓸수도 있고 해당 줄처럼 쓸 수도 있음
        return formatter
    }()
     
    
    
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {  //데이터 피커에서 값 변하면 출력
        print("value changed")
        
        let date: Date = sender.date
        let dateString: String = self.dateFormatter.string(from: date)      //string 으로 변환
        self.dateLabel.text = dateString
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
    }
    
    


}

