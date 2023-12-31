//
//  ViewController.swift
//  practiceDifferableDataSource
//
//  Created by Bowon Han on 11/22/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var dataSource: UITableViewDiffableDataSource<Int, UUID>!
    var colors: [UIColor] = [.blue, .green, .gray, .brown, .cyan, .lightGray, .purple]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        configureTableView()
        
    }
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    private lazy var button : UIButton = {
        let button = UIButton()
        button.setTitle("눌러요", for: .normal)
        button.addTarget(self, action: #selector(didTapInsertButton), for: .touchUpInside)
        
        return button
    }()
    
    private func setLayout() {
        self.view.addSubview(tableView)
        self.view.addSubview(button)
        
        tableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-60)
        }
        
        button.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc func didTapInsertButton(_ :UIButton) {
        var snapshot = dataSource.snapshot()

        if let first = snapshot.itemIdentifiers.first {
            snapshot.insertItems([UUID()], afterItem: first)
        }
        dataSource.apply(snapshot)
    }
    
    private func configureTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")

        dataSource = UITableViewDiffableDataSource<Int, UUID>(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
                cell.backgroundColor = self.colors[indexPath.row % self.colors.count]

                return cell
        })
        tableView.dataSource = dataSource
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, UUID>()
        snapshot.appendSections([0]) // 주의: section하나를 안넣어주면 에러
        snapshot.appendItems([UUID(), UUID(), UUID()])
        dataSource.apply(snapshot)
    }
}
