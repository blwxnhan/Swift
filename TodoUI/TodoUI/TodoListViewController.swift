//
//  TodoListViewController.swift
//  TodoUI
//
//  Created by Bowon Han on 11/5/23.
//

import UIKit
import SnapKit

class TodoListViewController: UIViewController {
    var todoList : [String] = ["공부하기", "밥먹기", "놀기"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setLayout()
        configure()
        setStackViewLayout()
    }
    
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.backgroundColor = .systemGray5
    
        return stackView
    }()

    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        
        return label
    }()
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
    
        return tableView
    }()
    
    private let registerTextField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        textField.clearButtonMode = .always
        textField.placeholder = "I want to ..."
        
        return textField
    }()
    
    private lazy var addTodoButton : UIButton = {
        let button = UIButton()
        button.setTitle("Today", for: .normal)
        button.tintColor = .white
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        button.addTarget(self, action: #selector(tabAddButton), for: .touchUpInside)

        return button
    }()
    
    private lazy var addSectionButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .lightGray
        
        return button
    }()
    
    @objc private func tabAddButton(_:UIButton){
        todoList.append(registerTextField.text ?? "")
        tableView.reloadData()
        registerTextField.text = ""
    }
    
// MARK: - layout
    private func setStackViewLayout(){
        stackView.addArrangedSubview(registerTextField)
        stackView.addArrangedSubview(addTodoButton)
        stackView.addArrangedSubview(addSectionButton)
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: .zero, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
    }
    
    private func setLayout() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        view.addSubview(stackView)

        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(20)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel).offset(53)
            make.bottom.trailing.leading.equalTo(view.safeAreaLayoutGuide)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
    }
    
    private func configure() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: TodoTableViewCell.identifier)
    }
}

// MARK: - extension
extension TodoListViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TodoTableViewCell.identifier,
            for: indexPath
            ) as? TodoTableViewCell else {
                return UITableViewCell()
            }
        cell.selectionStyle = .none
        cell.todoListLabel.text = todoList[indexPath.row]
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        else if editingStyle == .insert {
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = todoList[sourceIndexPath.row]

        todoList.remove(at: sourceIndexPath.row)
        todoList.insert(itemToMove, at: destinationIndexPath.row)
    }
}

// MARK: - for canvas
//import SwiftUI
//
//struct ViewControllerRepresentable: UIViewControllerRepresentable{
//    typealias UIViewControllerType = TodoListViewController
//    
//    func makeUIViewController(context: Context) -> TodoListViewController {
//        return TodoListViewController()
//    }
//    
//    func updateUIViewController(_ uiViewController: TodoListViewController, context: Context) {
//        
//    }
//}
//
//@available(iOS 13.0.0, *)
//struct ViewPreview: PreviewProvider{
//    static var previews: some View{
//        ViewControllerRepresentable()
//    }
//}
