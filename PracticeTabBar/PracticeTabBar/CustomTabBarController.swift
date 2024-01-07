//
//  CustomTabBarController.swift
//  PracticeTabBar
//
//  Created by Bowon Han on 1/7/24.
//

import UIKit
import SnapKit

class CustomTabBarController : UIViewController {
    var firstVC : FirstViewController?
    var secondVC : SecondViewController?
    var settingVC : SettingViewController?
    var vcList = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension CustomTabBarController : UITabBarDelegate {
    override func didMove(toParent parent: UIViewController?) {
        <#code#>
    }
    
    
}
