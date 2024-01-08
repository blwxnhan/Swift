//
//  LoginViewController.swift
//  PracticeCoordinator
//
//  Created by Bowon Han on 1/7/24.
//

import UIKit
import SnapKit

protocol LoginViewControllerDelegate {
    func login()
}

class LoginViewController : UIViewController {
    var delegate : LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item = UIBarButtonItem(title: "로그인",
                                   style: .plain,
                                   target: self,
                                   action: #selector(self.loginButtonDidTap))
        
        self.navigationItem.rightBarButtonItem = item
        self.navigationItem.title = "로그인 화면"
    }
    
    @objc func loginButtonDidTap() {
        self.delegate?.login()
    }
}
