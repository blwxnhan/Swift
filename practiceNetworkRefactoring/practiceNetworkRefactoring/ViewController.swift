//
//  ViewController.swift
//  practiceNetworkRefactoring
//
//  Created by Bowon Han on 12/24/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setLayout()
    }
    
    private lazy var deleteButton : UIButton = {
        let button = UIButton()
        button.setTitle("delete", for: .normal)
        button.addTarget(self, action: #selector(deleteButtonClick), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.backgroundColor = UIColor.gray.cgColor
        
        return button
    }()

    private lazy var modifyButton : UIButton = {
        let button = UIButton()
        button.setTitle("modify", for: .normal)
        button.addTarget(self, action: #selector(modifyButtonClick), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.backgroundColor = UIColor.gray.cgColor
        
        return button
    }()
    
    private lazy var fetchButton : UIButton = {
        let button = UIButton()
        button.setTitle("fetch", for: .normal)
        button.addTarget(self, action: #selector(fetchButtonClick), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.backgroundColor = UIColor.gray.cgColor
        
        return button
    }()
    
    private lazy var createButton : UIButton = {
        let button = UIButton()
        button.setTitle("create", for: .normal)
        button.addTarget(self, action: #selector(createButtonClick), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.backgroundColor = UIColor.gray.cgColor
        
        return button
    }()
    
    private var fetchLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.text = "example"
        
        return label
    }()
    
    @objc private func deleteButtonClick(_:UIButton) {
        print("delete")
        Task {
            try await TodoAPI.deleteTodo(id: 80).performRequest()
        }
    }
    
    @objc private func modifyButtonClick(_:UIButton) {
        print("modify")

        let requestBody = RequestDTO(
            title: "todolist",
            description: "todolist",
            endDate: "2023-12-25"
        )
        
        Task {
            try await TodoAPI.modifyTodo(id: 80, requestBody).performRequest(with: requestBody)
        }
    }

    @objc private func fetchButtonClick(_:UIButton) {
        print("fetch")

        Task {
            do {
                try await TodoAPI.fetchTodo.performRequest()
                            
                let todoFirst = TodoManager.shared.todoDataSource.first?.title
                print(TodoManager.shared.todoDataSource)
                self.fetchLabel.text = todoFirst
            }
            catch{
                print("error: \(error)")
            }
            
        }
    }
    
    @objc private func createButtonClick(_:UIButton) {
        print("create")

        let requestBody = RequestDTO(
            title: "bowon",
            description: "bowon",
            endDate: "2023-12-25"
        )
        
        Task {
            try await TodoAPI.createTodo(requestBody).performRequest(with: requestBody)
        }
    }
    
    private func setLayout() {
        [deleteButton,
         modifyButton,
         fetchButton,
         createButton,
         fetchLabel].forEach{
            view.addSubview($0)
        }
        
        deleteButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
        
        modifyButton.snp.makeConstraints {
            $0.top.equalTo(deleteButton.snp.bottom).offset(40)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
        
        fetchButton.snp.makeConstraints {
            $0.top.equalTo(modifyButton.snp.bottom).offset(40)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
        
        createButton.snp.makeConstraints {
            $0.top.equalTo(fetchButton.snp.bottom).offset(40)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
        
        fetchLabel.snp.makeConstraints {
            $0.top.equalTo(createButton.snp.bottom).offset(40)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
    }
}

