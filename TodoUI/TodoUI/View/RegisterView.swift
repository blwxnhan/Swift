//
//  RegisterView.swift
//  TodoUI
//
//  Created by Bowon Han on 11/7/23.
//

import UIKit
import SnapKit

protocol PlusListButtonDelegate : AnyObject {
    func tabAddTodoButton(forView view: RegisterView)
    func tabAddSectionButton(forView view: RegisterView)
}

final class RegisterView : UIView {
    weak var delegate : PlusListButtonDelegate?
    
    private lazy var registerStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.backgroundColor = .darkGreen
    
        return stackView
    }()
    
    let registerTextField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        textField.clearButtonMode = .always
        textField.placeholder = "I want to ..."
        
        return textField
    }()
    
    lazy var addTodoButton : UIButton = {
        let button = UIButton()
        button.setTitle("Today", for: .normal)
        button.tintColor = .white
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        button.addTarget(self, action: #selector(tabAddTodoButton), for: .touchUpInside)

        return button
    }()
    
    lazy var addSectionButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        button.tintColor = .systemGray6
        button.addTarget(self, action: #selector(tabAddSectionButton), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStackViewLayout()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc private func tabAddTodoButton(_:UIButton){
        delegate?.tabAddTodoButton(forView: self)
    }
    
    @objc private func tabAddSectionButton(_:UIButton){
        delegate?.tabAddSectionButton(forView: self)
    }

    private func setStackViewLayout(){
        registerStackView.addArrangedSubview(registerTextField)
        registerStackView.addArrangedSubview(addTodoButton)
        registerStackView.addArrangedSubview(addSectionButton)
        registerStackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: .zero, right: 10)
        registerStackView.isLayoutMarginsRelativeArrangement = true
    }
    
    private func setLayout() {
        addTodoButton.snp.makeConstraints {
            $0.width.lessThanOrEqualTo(100)
        }
        
        addSubview(registerStackView)

        registerStackView.snp.makeConstraints { (make) in
            make.bottom.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(70)
        }
    }
}
