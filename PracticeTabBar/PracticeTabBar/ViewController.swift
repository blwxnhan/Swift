//
//  ViewController.swift
//  PracticeTabBar
//
//  Created by Bowon Han on 1/4/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setLayout()
    }
    
    private let customBar = CustomTabBar()
    
    private func setLayout() {
        [customBar].forEach{
            view.addSubview($0)
        }
        
        customBar.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

