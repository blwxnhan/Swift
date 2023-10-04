//
//  ViewController.swift
//  TableView
//
//  Created by Bowon Han on 10/2/23.
//

import UIKit
import SnapKit

class TableViewController: UIViewController {
    static func instance() -> TableViewController? {
            return TableViewController()
        }

        private let tableView: UITableView = {
            let tableView = UITableView(frame: .zero, style: .grouped)
            tableView.register(PracticeChatTableViewCell.self, forCellReuseIdentifier: PracticeChatTableViewCell.identifier)
            tableView.separatorStyle = .none
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 150
            return tableView
        }()

        override func viewDidLoad() {
            super.viewDidLoad()
            initViews()
        }

        func initViews() {
            self.initViews()

            self.view.addSubview(self.tableView)
            self.tableView.make { (make) in
                make.edges.equalToSuperview()
            }

            self.tableView.delegate = self
            self.tableView.dataSource = self
        }
    }

    extension TableViewController: UITableViewDelegate, UITableViewDataSource {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: PracticeChatTableViewCell.identifier, for: indexPath)
            return cell
        }

    
}




// MARK: - for canvas
//import SwiftUI
//
//struct TableViewControllerRepresentable: UIViewControllerRepresentable{
//    typealias UIViewControllerType = TableViewController
//    func makeUIViewController(context: Context) -> TableViewController {
//        return TableViewController()
//    }
//    func updateUIViewController(_ uiViewController: TableViewController, context: Context) {
//    }
//}
//
//@available(iOS 13.0.0, *)
//struct TableViewPreview: PreviewProvider{
//    static var previews: some View{
//        TableViewControllerRepresentable()
//    }
//}
//
