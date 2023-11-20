//
//  DetailViewController.swift
//  TodoListProject
//
//  Created by Bowon Han on 11/19/23.
//

import UIKit
import SnapKit

class DetailViewController : UIViewController {
    private let saveData = SaveData.shared
    
    var sectionNumber = 0
    var indexNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.navigationController?.navigationBar.tintColor = .darkGreen

        setLayout()
    }
    
    var detailViewListName : UILabel = {
        var label = UILabel()
        label = PaddingLabel(padding: UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16))
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.layer.borderWidth = 10
        label.layer.cornerRadius = 10
        label.layer.backgroundColor = UIColor.darkYellow.cgColor
        label.layer.borderColor = UIColor.darkYellow.cgColor
        
        return label
    }()
    
    private lazy var startDateView : DateSelectView = {
        let view = DateSelectView()
        view.dateLabel.text = "시작일"
        
        return view
    }()
    
    private lazy var endDateView : DateSelectView = {
        let view = DateSelectView()
        view.dateLabel.text = "마감일"
        
        return view
    }()
    
    private lazy var saveButton : UIButton = {
        let button = UIButton()
        button.setTitle("저장", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.borderWidth = 10
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.darkGreen.cgColor
        button.layer.backgroundColor = UIColor.darkGreen.cgColor
        button.addTarget(self, action: #selector(tabSaveButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tabSaveButton(_:UIButton) {
        if let startDate = saveData.dataSource[sectionNumber].list[indexNumber].startDate {
            startDate = startDateView.dataPicker.date
            
        }

        if let endDate = saveData.dataSource[sectionNumber].list[indexNumber].deadlineDate {
            endDate = endDateView.dataPicker.date
        }
    }
    
    private func setLayout() {
        [detailViewListName,startDateView,endDateView,saveButton].forEach {
            view.addSubview($0)
        }
        
        detailViewListName.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-40)
        }
        
        startDateView.snp.makeConstraints {
            $0.top.equalTo(detailViewListName.snp.bottom).offset(30)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        endDateView.snp.makeConstraints {
            $0.top.equalTo(startDateView.snp.bottom)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(endDateView.snp.bottom).offset(40)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-50)
            $0.width.equalTo(60)
        }
    }
}

//extension DetailViewController : ChangeDateButtonDelegate {
//    func tabChangeDateButton(forView view: DateSelectView) {
//        let formatter = DateFormatter()
//        formatter.dateFormat="yyyy-MM-dd"
////        view.text = "선택시간: " + formatter.string(from: datePickerView.date)
////
////        formatter.dateFormat="hh:mm aaa"
////        alarmTime = formatter.string(from: datePickerView.date)
//
//    }
//}
