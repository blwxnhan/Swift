//
//  PracticeChatTableViewCell.swift
//  TableView
//
//  Created by Bowon Han on 10/3/23.
//

import UIKit
import SnapKit

class PracticeChatTableViewCell: UITableViewCell {
    static let identifier = "PracticeChatCell"

    private let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .red
        return containerView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.contentView.addSubview(self.containerView)
        self.containerView.make { (make) in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("")
    }
}
