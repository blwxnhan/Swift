//
//  TabBarView.swift
//  PracticeTabBar
//
//  Created by Bowon Han on 1/5/24.
//

import UIKit
import SnapKit

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
         tabBar,
         buttonStackView].forEach {
            addSubview($0)
        }
        
        contentView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self)
            $0.bottom.equalTo(tabBar.snp.top)
        }
        
        tabBar.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(self)
            $0.top.equalTo(contentView.snp.bottom)
        }
    
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(tabBar.snp.top).offset(10)
            $0.bottom.equalTo(tabBar.snp.bottom).offset(-10)
            $0.leading.equalTo(tabBar.snp.leading).offset(10)
            $0.trailing.equalTo(tabBar.snp.trailing).offset(-10)
        }
    }
}
