//
//  BaseViewController.swift
//  PracticeBaseVC
//
//  Created by Bowon Han on 1/2/24.
//

import UIKit
import SnapKit

class BaseViewController : UIViewController {
    // MARK: - Property
    private(set) var didSetupConstraints = false
    
    // MARK: - Initializing
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        self.view.backgroundColor = .systemBackground
        self.view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        if !self.didSetupConstraints {
            self.setupConstraints()
            self.didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
    // MARK: - Top View
    func setupConstraints() {
        // Override point
        
    }
}

