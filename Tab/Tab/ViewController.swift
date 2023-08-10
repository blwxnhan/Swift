//
//  ViewController.swift
//  Tab
//
//  Created by 한보원 on 8/9/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func btnDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    
}

