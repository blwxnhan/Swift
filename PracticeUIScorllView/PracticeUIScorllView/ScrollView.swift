//
//  ScrollView.swift
//  PracticeUIScorllView
//
//  Created by Bowon Han on 11/6/23.
//

import UIKit
import SnapKit

class ScrollView : UIView {
    //let scrollView : UIScrollView = UIScrollView()
    
    let sectionContentView : UIView = UIView()
    
    lazy var sectionStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fill
        stackView.alignment = .leading
        
        return stackView
    }()
    
    let sectionNameLabel : UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.text = "Today"
        label.font = .boldSystemFont(ofSize: 30)
        
        return label
    }()
    
    lazy var listStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.setContentHuggingPriority(.defaultLow, for: .vertical)
    
        return stackView
    }()
        
    lazy var checkButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        button.tintColor = .red
        
        return button
    }()
        
    var todoListLabel : UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.text = "building"
        
        return label
    }()
    
    required init?(coder: NSCoder) {
            super.init(coder: coder)
    }
        
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.setLayout()
    }
    
// MARK: - layout
   
    private func setLayout(){
        listStackView.addArrangedSubview(checkButton)
        listStackView.addArrangedSubview(todoListLabel)
        
        sectionStackView.addArrangedSubview(listStackView)
        sectionStackView.addArrangedSubview(listStackView)
    
        //addSubview(scrollView)
        //scrollView.addSubview(sectionContentView)
        addSubview(sectionContentView)
        sectionContentView.addSubview(sectionStackView)
        sectionContentView.addSubview(sectionNameLabel)
        
//        scrollView.snp.makeConstraints{
//            $0.top.bottom.leading.trailing.equalToSuperview()
//        }
        
//        sectionContentView.snp.makeConstraints{
//            $0.top.bottom.leading.trailing.equalTo(scrollView.contentLayoutGuide)
//            $0.width.equalTo(scrollView.snp.width)
//            $0.height.greaterThanOrEqualTo(scrollView.snp.height).priority(.low)
//        }
        
        sectionContentView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }

        sectionNameLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(30)
        }
        
        sectionStackView.snp.makeConstraints {
            $0.top.equalTo(sectionNameLabel.snp.bottom).offset(20)
            $0.bottom.leading.trailing.equalToSuperview().inset(30)
        }
    }
}

