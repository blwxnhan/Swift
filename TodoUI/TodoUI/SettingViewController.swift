//
//  SettingViewController.swift
//  TodoUI
//
//  Created by Bowon Han on 11/5/23.
//

import UIKit

class SettingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray6
    }
    
    private lazy var settingTableView : UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
}

extension SettingViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}
