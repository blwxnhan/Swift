//
//  TodoListViewController.swift
//  TodoUI
//
//  Created by Bowon Han on 11/5/23.
//

import UIKit
import SnapKit

class TodoListViewController: UIViewController {
    var dataSource : [SettingSection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setLayout()
        configure()
        setUp()
    }
        
    private lazy var tableView : UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
    
        return tableView
    }()
    
    private lazy var registerView: RegisterView = {
        let view = RegisterView()
        view.delegate = self

        return view
    }()
    
    private func setUp() {
        let todayModels = [
            TodoListModel(todoNameLabel: "study"),
        ]
        let todaySection = SettingSection.init(list: todayModels, sectionName: "Today")
        
        let upcomingModels = [
            TodoListModel(todoNameLabel: "exercise"),
            TodoListModel(todoNameLabel: "work"),
        ]
        let upcomingSection = SettingSection.init(list: upcomingModels, sectionName: "Upcoming")
        
        self.dataSource = [todaySection,upcomingSection]
        self.tableView.reloadData()
    }
        
// MARK: - layout
    private func setLayout() {
        view.addSubview(tableView)
        view.addSubview(registerView)

//        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(70)
            $0.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(5)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-5)
        }
        
        registerView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(70)
        }
    }
    
    private func configure() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: TodoTableViewCell.identifier)
        tableView.register(TodoTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: TodoTableViewHeaderView.identifier)
    }
}

// MARK: - UITableView extension
extension TodoListViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionData = dataSource[indexPath.section]
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TodoTableViewCell.identifier,
            for: indexPath
        ) as! TodoTableViewCell
        
        let todayModel = sectionData.list[indexPath.row]
        cell.prepare(
            todoListLabel:todayModel.todoNameLabel
        )
        cell.delegate = self
        cell.selectionStyle = .none
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionData = dataSource[section]
        
        return sectionData.list.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var section = dataSource[indexPath.section]
            
            section.list.remove(at: indexPath.row)
            
            dataSource[indexPath.section] = section

            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionData = dataSource[section]

        guard let todoTableViewHeaderView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: TodoTableViewHeaderView.identifier)
            as? TodoTableViewHeaderView else {
                    return UIView()
            }
        
        todoTableViewHeaderView.delegate = self
        todoTableViewHeaderView.sectionNameLabel.text = sectionData.sectionName
        
        return todoTableViewHeaderView
    }
}

// MARK: - ButtonTappedDelegate extension
extension TodoListViewController : ButtonTappedDelegate {
    func tapFinishButton(forCell cell: TodoTableViewCell) {
        if cell.checkButton.currentImage == UIImage(systemName: "checkmark.circle.fill") {
            cell.checkButton.setImage(UIImage(systemName: "circle"), for: .normal)
            
            cell.todoListLabel.textColor = .black
            cell.todoListLabel.unsetStrikethrough(from: cell.todoListLabel.text, at: cell.todoListLabel.text)
            
            cell.deleteButton.setImage(nil, for: .normal)
            
        } else {
            cell.checkButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            
            cell.todoListLabel.textColor = .lightGray
            cell.todoListLabel.strikethroughAndChangeLineColor(from: cell.todoListLabel.text, at: cell.todoListLabel.text)
            
            cell.deleteButton.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
        }
    }
    
    func tapDeleteButton(forCell cell: TodoTableViewCell) {
        if let indexPath = tableView.indexPath(for: cell),
            indexPath.section < dataSource.count {
            var section = dataSource[indexPath.section]
            
            if indexPath.row < section.list.count {
                section.list.remove(at: indexPath.row)

                dataSource[indexPath.section] = section

                tableView.deleteRows(at: [indexPath], with: .fade)
                
                cell.checkButton.setImage(UIImage(systemName: "circle"), for: .normal)
                cell.todoListLabel.textColor = .black
                cell.todoListLabel.unsetStrikethrough(from: cell.todoListLabel.text, at: cell.todoListLabel.text)
                
                cell.deleteButton.setImage(nil, for: .normal)
            }
        }
    }
}

// MARK: - PlusListButtonDelegate extension
extension TodoListViewController : PlusListButtonDelegate {
    func tabAddTodoButton(forView view: RegisterView) {
        if let text = view.registerTextField.text, !text.isEmpty {
            let newTodo = TodoListModel(todoNameLabel: text)
       
            if dataSource.isEmpty {
                let newSection = SettingSection(list: [newTodo], sectionName: "Today")
                dataSource.append(newSection)
            }
            else {
                if let sectionName = view.addTodoButton.title(for: .normal) {
                    if let sectionIndex = dataSource.firstIndex(where: { $0.sectionName == sectionName }) {
                        dataSource[sectionIndex].list.append(newTodo)
                        
                        let newIndexPath = IndexPath(row: dataSource[sectionIndex].list.count - 1, section: sectionIndex)
                        tableView.insertRows(at: [newIndexPath], with: .none)
                    }
                }
            }
            view.registerTextField.text = ""
        }
    }
    
    func tabAddSectionButton(forView view: RegisterView) {
        if let text = view.registerTextField.text, !text.isEmpty {
            let newSection = SettingSection(list: [], sectionName: text)
            dataSource.append(newSection)
        
            let sectionIndex = dataSource.count - 1
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .none)
        
            view.registerTextField.text = ""
        }
    }
}

// MARK: - SelectSectionButtonDelegate extension
extension TodoListViewController : SelectSectionButtonDelegate {
    func selectSectionButtonTapped(forView view: TodoTableViewHeaderView) {
        if let sectionName = view.sectionNameLabel.text {
            registerView.addTodoButton.setTitle(sectionName, for: .normal)
        }
    }
}
