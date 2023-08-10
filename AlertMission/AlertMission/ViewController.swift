//
//  ViewController.swift
//  AlertMission
//
//  Created by 한보원 on 8/2/23.
//

import UIKit

class ViewController: UIViewController {

    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count=0
    var alarmTime: String?
    var alertFlag=false


    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblAlertTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func changeDateTime(_ sender: UIDatePicker) {
        let datePickerView=sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblAlertTime.text = formatter.string(from: datePickerView.date)
        formatter.dateFormat = "MM-dd hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
        
        
    }
    
    

    @objc func updateTime(){
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = formatter.string(from: date as Date) // Date는 현재시간? date는?
        
        formatter.dateFormat = "MM-dd hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        
        if (alarmTime == currentTime){
            if !alertFlag{
                let alarmAlert = UIAlertController(title: "알림",message: "설정된 시간입니다.", preferredStyle: UIAlertController.Style.alert)
                let offAction = UIAlertAction(title: "네 알겠습니다.", style: UIAlertAction.Style.default,handler: nil)
                alarmAlert.addAction(offAction)
                present(alarmAlert,animated: true,completion: nil)
                alertFlag=true
            }
            
        }
        else{
            alertFlag=false
        }
        
    }

}

