//
//  TabBarView.swift
//  PracticeTabBar
//
//  Created by Bowon Han on 1/5/24.
//

import UIKit
import SnapKit

class CustomTabBar : UIView {
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
        [tabBar,
         buttonStackView].forEach {
            addSubview($0)
        }
        
        tabBar.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(tabBar.snp.top).offset(10)
            $0.bottom.equalTo(tabBar.snp.bottom).offset(-10)
            $0.leading.equalTo(tabBar.snp.leading).offset(20)
            $0.trailing.equalTo(tabBar.snp.trailing).offset(-20)
        }
    }
}
