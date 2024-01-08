//
//  ViewController.swift
//  PracticeLayout
//
//  Created by Bowon Han on 1/7/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setLayout()
    }
    
    private let view1 = View1()
    
    private func setLayout() {
        [view1].forEach {
            view.addSubview($0)
        }
        
        view1.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.bottom.trailing.equalToSuperview().offset(-30)
            $0.leading.equalToSuperview().offset(30)
        }
    }
}

