//
//  LoginViewController.swift
//  practiceNetworkRefactoring
//
//  Created by Bowon Han on 12/24/23.
//

import UIKit
import SnapKit

final class LoginViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setLayout()
    }
    
    private let loginLabel : UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 50, weight: .black)
        label.textAlignment = .center
        
        return label
    }()
    
    let idInputView : InputView = {
        let inputView = InputView()
        inputView.inputLabel.text = "email"
        inputView.inputTextField.placeholder = "email을 입력하세요."
        
        return inputView
    }()
    
    let passwordInputView : InputView = {
        let inputView = InputView()
        inputView.inputLabel.text = "password"
        inputView.inputTextField.placeholder = "password를 입력하세요."

        return inputView
    }()
    
    private let buttonStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fill
        stackView.alignment = .center
        
        return stackView
    }()
        
    private lazy var loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("login", for: .normal)
        button.tintColor = .systemGray
        button.layer.borderWidth = 10
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.backgroundColor = UIColor.gray.cgColor
        button.addTarget(self, action: #selector(tabLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func tabLoginButton(_: UIButton) {
        let vc = ViewController()
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    private func setLayout() {
        buttonStackView.addArrangedSubview(loginButton)
        
        [loginLabel,
         idInputView,
         passwordInputView,
         buttonStackView].forEach{
            view.addSubview($0)
        }
    
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
        
        idInputView.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(50)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(50)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-50)
        }
        
        passwordInputView.snp.makeConstraints {
            $0.top.equalTo(idInputView.snp.bottom).offset(30)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(50)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-50)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(passwordInputView.snp.bottom).offset(40)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(50)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-50)
        }
    }
}
