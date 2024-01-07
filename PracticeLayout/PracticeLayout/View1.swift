//
//  View1.swift
//  PracticeLayout
//
//  Created by Bowon Han on 1/7/24.
//

import UIKit
import SnapKit

class View1 : UIView {
    private let view2 = View2()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setLayout() {
        [view2].forEach {
            addSubview($0)
        }
        
        view2.snp.makeConstraints {
            $0.top.leading.equalTo(self).offset(20)
            $0.trailing.bottom.equalTo(self).offset(-20)
        }
    }
}
