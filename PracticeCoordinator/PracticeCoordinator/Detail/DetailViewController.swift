//
//  DetailViewController.swift
//  PracticeCoordinator
//
//  Created by Bowon Han on 1/7/24.
//

import UIKit
import SnapKit

protocol DetailViewControllerDelegate {
    func backMain()
}

class DetailViewController : UIViewController {
    var delegate : DetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "메인화면",
                                   style: .plain,
                                   target: self,
                                   action: #selector(self.mainButtonDidTap))
        
        self.navigationItem.rightBarButtonItem = item
        self.navigationItem.title = "디테일 화면"
    }
    
    @objc func mainButtonDidTap() {
        self.delegate?.backMain()
    }
}
