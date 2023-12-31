//
//  ViewController.swift
//  Navigation
//
//  Created by 한보원 on 8/9/23.
//

import UIKit

class ViewController: UIViewController,EditDelegate {
    
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var txtMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton"{
            editViewController.textWayValue = "segue : use button"
            
        }
        else if segue.identifier == "editBarButton"{
            editViewController.textWayValue = "segue : use Bar button"
            
        }
        editViewController.textMessage = txtMessage.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
    }
    
    func didMessageEditDone(_controller: EditViewController, message: String) {
        txtMessage.text = message
    }
    func didImageOnOffDone(_controller: EditViewController, isOn: Bool) {
        if isOn{
            imgView.image = imgOn
            self.isOn = true
        }
        
        else{
            imgView.image = imgOff
            self.isOn = false
        }
    }


}

