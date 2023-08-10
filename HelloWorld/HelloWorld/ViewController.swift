//
//  ViewController.swift
//  HelloWorld
//
//  Created by 한보원 on 7/27/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var IbIHello: UILabel!
    @IBOutlet var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        
        IbIHello.text="Hello, "+txtName.text!
    }
    
}

