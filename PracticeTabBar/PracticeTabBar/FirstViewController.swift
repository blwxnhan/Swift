//
//  First.swift
//  PracticeTabBar
//
//  Created by Bowon Han on 1/4/24.
//

import UIKit
import SnapKit

class FirstViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setLayout()
    }
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("첫번째 화면", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
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
