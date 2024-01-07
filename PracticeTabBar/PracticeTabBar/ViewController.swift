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
    
    private let contentView : UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .darkBlue
        
        return contentView
    }()
    
    private let customBar = CustomTabBar()
    
    private func setLayout() {
        [contentView,
         customBar].forEach{
            view.addSubview($0)
        }
        
        contentView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(customBar.snp.top)
        }
    
        customBar.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(contentView.snp.bottom)
        }
    }
}

