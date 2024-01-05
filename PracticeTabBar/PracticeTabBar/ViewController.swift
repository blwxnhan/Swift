//
//  ViewController.swift
//  PracticeTabBar
//
//  Created by Bowon Han on 1/4/24.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setLayout()
    }
    
    private let contentView : UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .green
        
        return contentView
    }()
    
    private let tabBar = CustomTabBar()
    
    private func setLayout() {
        [contentView, tabBar].forEach {
            view.addSubview($0)
        }
        
        contentView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(tabBar.snp.top).offset(-10)
        }
        
        tabBar.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
//            $0.width.equalToSuperview()
            $0.height.equalTo(tabBar.snp.height)
            $0.top.equalTo(contentView.snp.bottom)
        }
    }
}

