//
//  TabBarView.swift
//  PracticeTabBar
//
//  Created by Bowon Han on 1/5/24.
//

import UIKit
import SnapKit

// 필요없었다!

class CustomTabBar : UIView {
    private let contentView : UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .darkBlue
        
        return contentView
    }()
    
    private let tabBar : UITabBar = {
        let tabBar = UITabBar()
        tabBar.tintColor = .darkBlue
        tabBar.barTintColor = .skyBlue
        
        return tabBar
    }()
    
    private let buttonStackView = ButtonStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setLayout(){
        [contentView,
         tabBar].forEach {
            addSubview($0)
        }
        
        tabBar.addSubview(buttonStackView)
        
        
        contentView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self)
            $0.bottom.equalTo(tabBar.snp.top)
        }
        
        tabBar.snp.makeConstraints {
            $0.leading.bottom.trailing.equalTo(self)
            $0.top.equalTo(contentView.snp.bottom)
        }
    
        buttonStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-50)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
}
