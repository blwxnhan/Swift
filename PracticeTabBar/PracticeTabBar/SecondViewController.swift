//
//  SecondViewController.swift
//  PracticeTabBar
//
//  Created by Bowon Han on 1/5/24.
//

import UIKit
import SnapKit

class SecondViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setLayout()
    }
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("두번째 화면", for: .normal)
        
        return button
    }()
    
    private func setLayout(){
        [button].forEach {
            view.addSubview($0)
        }
        
        button.snp.makeConstraints {
            $0.top.leading.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.trailing.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
        }
    }
}
