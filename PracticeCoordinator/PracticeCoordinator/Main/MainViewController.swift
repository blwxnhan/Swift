//
//  ViewController.swift
//  PracticeCoordinator
//
//  Created by Bowon Han on 1/7/24.
//

import UIKit

protocol MainViewControllerDelegate {
    func logout()
    func detailPresent()
}

class MainViewController: UIViewController {
    var delegate : MainViewControllerDelegate?
                                   
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "로그아웃",
                                   style: .plain,
                                   target: self,
                                   action: #selector(logoutButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
        self.navigationItem.title = "메인화면"
        
        setLayout()
    }
    
    private lazy var button : UIButton = {
        let button = UIButton()
        button.setTitle("눌러요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        button.addAction(UIAction { _ in
            self.detailButtonDidTap()
        }, for: .touchUpInside)
        
        return button
    }()
    
    @objc func logoutButtonDidTap() {
        self.delegate?.logout()
    }
    
    private func detailButtonDidTap() {
        self.delegate?.detailPresent()
    }
    
    private func setLayout() {
        view.addSubview(button)
        
        button.snp.makeConstraints {
            $0.top.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.trailing.bottom.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
    }
}

