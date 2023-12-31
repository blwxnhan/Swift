//
//  ViewController.swift
//  PracticeTodoNetwork
//
//  Created by Bowon Han on 11/27/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let saveData = Networks.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setLayout()
    }
    
    private let label : UILabel = {
        let label = UILabel()
        label.text = "hello"
        
        return label
    }()
    
    private lazy var buttonAdd : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.addTarget(self, action: #selector(tabButtonAdd), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var buttonDelete : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        button.addTarget(self, action: #selector(tabButtonDelete), for: .touchUpInside)
        
        return button
    }()

    
    @objc private func tabButtonAdd(_:UIButton) {
//        saveData.createTodoList("success","success","2023-11-30",2)
        let text = "to"
        let date = Date.now
        let dateToString = date.toString()
        print(dateToString)
        saveData.createTodoList(text, "", dateToString, 2)

//        saveData.fetchAllTodoList(2)
    }
    
    @objc private func tabButtonDelete(_:UIButton) {
//        saveData.deleteTodoList(15)
        saveData.modifyTodoList(title: "bowon",description: "list", isFinished: true, endDate: "2023-11-30", id: 43)
    }
    
    private func setLayout () {
        view.addSubview(label)
        view.addSubview(buttonAdd)
        view.addSubview(buttonDelete)
        
        label.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
        
        buttonAdd.snp.makeConstraints {
            $0.top.equalTo(label.snp.top).offset(30)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.trailing.equalTo(buttonDelete.snp.leading).offset(-20)
        }
        
        buttonDelete.snp.makeConstraints {
            $0.top.equalTo(label.snp.top).offset(30)
            $0.leading.equalTo(buttonAdd.snp.trailing).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(30)
        }
    }
}
    


extension String {
    func toDate() -> Date? { //"yyyy-MM-dd HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return nil
        }
    }
}

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        return dateFormatter.string(from: self)
    }
}
