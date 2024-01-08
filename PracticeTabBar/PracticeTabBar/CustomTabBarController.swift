//
//  CustomTabBarController.swift
//  PracticeTabBar
//
//  Created by Bowon Han on 1/7/24.
//

import UIKit
import SnapKit

class CustomTabBarController : UITabBarController {
    let firstVC = FirstViewController()
    let secondVC = SecondViewController()
    let settingVC = SettingViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tabBarConfig()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = 100
        tabFrame.origin.y = self.view.frame.size.height - 100
        self.tabBar.frame = tabFrame
    }
    
    private var buttonStackView = ButtonStackView()
    
    private func tabBarConfig() {
        self.tabBar.layer.backgroundColor = UIColor.skyBlue.cgColor
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.borderColor = UIColor.darkGray.cgColor
        self.tabBar.layer.borderWidth = 0.4
        
        tabBar.addSubview(buttonStackView)
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-40)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        setViewControllers([firstVC,secondVC,settingVC], animated: true)
    }
}
