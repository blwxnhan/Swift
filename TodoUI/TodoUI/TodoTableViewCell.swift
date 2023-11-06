//
//  TodoTableViewCell.swift
//  TodoUI
//
//  Created by Bowon Han on 11/5/23.
//

import UIKit
import SnapKit

class TodoTableViewCell : UITableViewCell {
    private var toggle = true
    
    private lazy var checkButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        button.tintColor = .red
        button.addTarget(self, action: #selector(clickFinishButton), for: .touchUpInside)
        
        return button
    }()
        
    var todoListLabel : UILabel = {
        let label = UILabel()
        //label.text = "building"
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        return label
    }()
    
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fill
        stackView.alignment = .trailing
    
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        stackViewLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    @objc func clickFinishButton(_:UIButton){
        if toggle {
            checkButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            
            todoListLabel.textColor = .lightGray
            todoListLabel.strikethroughAndChangeLineColor(from: todoListLabel.text, at: todoListLabel.text)
            
            toggle = false
        }
        
        else {
            checkButton.setImage(UIImage(systemName: "circle"), for: .normal)
            
            todoListLabel.textColor = .black
            todoListLabel.unsetStrikethrough(from: todoListLabel.text, at: todoListLabel.text)
            
            toggle = true
        }
    }
    
// MARK: - layout
    private func stackViewLayout(){
        stackView.addArrangedSubview(checkButton)
        stackView.addArrangedSubview(todoListLabel)
    }
    
    private func setLayout(){
        contentView.addSubview(stackView)
                
        stackView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview().inset(20)
        }
    }
}

// MARK: - UITableViewCell extension
extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UILabel {
    func strikethroughAndChangeLineColor(from text: String?, at range: String?) {
        guard let text = text,
              let range = range else { return }
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttributes([
            NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.strikethroughColor: UIColor.lightGray
        ], range: NSString(string: text).range(of: range))
        self.attributedText = attributedString
    }
    
    func unsetStrikethrough(from text: String?, at range: String?) {
        guard let text = text, let range = range else { return }
        
        // 기존 텍스트의 NSAttributedString 생성
        let attributedString = NSMutableAttributedString(string: text)
        
        // 취소선 제거
        attributedString.removeAttribute(NSAttributedString.Key.strikethroughStyle, 
                                         range: NSString(string: text).range(of: range))
        
        // UILabel의 attributedText 설정
        self.attributedText = attributedString
    }
}
