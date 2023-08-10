//
//  EditViewController.swift
//  Navigation
//
//  Created by 한보원 on 8/9/23.
//

import UIKit

//프로토콜-> 추상함수, 인터페이스 느낌 only 선언만 함 
protocol EditDelegate{
    func didMessageEditDone(_controller: EditViewController,message: String)
    func didImageOnOffDone(_controller: EditViewController,isOn: Bool)
}

class EditViewController: UIViewController {
    
    @IBOutlet var swlsOn: UISwitch!
    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var lblWay: UILabel!
    
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate : EditDelegate?
    var isOn = false

    override func viewDidLoad() {
        super.viewDidLoad()

        lblWay.text = textWayValue
        txtMessage.text = textMessage
        swlsOn.isOn = isOn
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(_controller: self, message: txtMessage.text!)
            delegate?.didImageOnOffDone(_controller: self, isOn: isOn)

        }
        
        _=navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
        }
        else{
            isOn = false
        }
        
        
    }
}
