//
//  ClockView.swift
//  Clock
//
//  Created by Bowon Han on 12/31/23.
//

import UIKit

class ClockStackView : UIView {
    private let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 30
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fill
        
        return stackView
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    var timeLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setLayout() {
        [label,timeLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
