//
//  ViewController.swift
//  DatePicker
//
//  Created by 한보원 on 7/31/23.
//

import UIKit

class ViewController: UIViewController {

    let timeSelector: Selector = #selector(ViewController.updateTime) //타이머가 구동되면 실행할 함수를 지정함
    let interval = 1.0 //타이머의 간격
    var count=0 //타이머가 설정한 간격대로 실행되는지 확인하기 위한 변수
    var alarmTime: String?
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true) //타이머간격, 동작될 뷰, 타이머 구동시 실행할 함수, 사용자 정보, 반복여부

    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        //데이터피커를 선택할 때 발생하는 액션함수 changeDatePicker 호출 후
        //sender라는 UIDatePicker 자료형의 인수가 전달됨
        //-> 이 sender를 datePickerView라는 상수에 저장
        
        let formatter = DateFormatter() //날짜를 출력하기 위해 클래스 상수 formatter를 선언
        formatter.dateFormat="yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat="hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
//        lblCurrentTime.text = String(count)
//        count+=1
        
        let date = NSDate() //현재시간을 가져오는 함수 NSDate
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date) // Date는 현재시간? date는?
        
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        
        if (alarmTime == currentTime){
            view.backgroundColor=UIColor.green
        }
        else{
            view.backgroundColor=UIColor.white
        }
        
    }
    
}

