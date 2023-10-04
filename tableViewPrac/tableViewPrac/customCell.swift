//
//  customCell.swift
//  tableViewPrac
//
//  Created by Bowon Han on 10/3/23.
//

import UIKit

class customCell: UITableViewCell{
    
    static let identifier = "customCell"
    
//    lazy var stackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [cellImgView, cellLabel])
//        contentView.addSubview(stackView)
//        
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        let safeArea = contentView.safeAreaLayoutGuide
//        
////        stackView.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor).isActive = true
////        stackView.bottomAnchor.constraint(equalTo:  safeArea.bottomAnchor).isActive = true
////        stackView.trailingAnchor.constraint(equalTo:  safeArea.trailingAnchor).isActive = true
////        stackView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
//        NSLayoutConstraint.activate([
//                    stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//                    stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
//                    stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//                    stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
//                ])
//        
//        return stackView
//    }()
    
    lazy var cellLabel: UILabel = {
        let label = UILabel()
        label.text = "제목"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = contentView.safeAreaLayoutGuide
        
//        label.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor,constant: 50).isActive = true
//        label.bottomAnchor.constraint(equalTo:  safeArea.bottomAnchor,constant: -10).isActive = true
//        label.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: 10).isActive = true

        
        return label
    }()
    
    lazy var cellImgView: UIImageView = {
        let imgView = UIImageView()
        contentView.addSubview(imgView)
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = contentView.safeAreaLayoutGuide
        
//        imgView.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor,constant: 10).isActive = true
//        imgView.bottomAnchor.constraint(equalTo:  safeArea.bottomAnchor,constant: -10).isActive = true
//        imgView.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: 10).isActive = true
//
        NSLayoutConstraint.activate([
                    imgView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
                    imgView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -10),
                    imgView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
                    imgView.widthAnchor.constraint(equalToConstant: 80), // 이미지뷰의 너비 설정
                    imgView.heightAnchor.constraint(equalToConstant: 80) // 이미지뷰의 높이 설정
                ])
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCellLayout()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been impl")
    }
    
    func setupCellLayout() {
        let safeArea = contentView.safeAreaLayoutGuide

        cellLabel.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor,constant: 50).isActive = true
        cellLabel.bottomAnchor.constraint(equalTo:  safeArea.bottomAnchor,constant: -10).isActive = true
        cellLabel.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: 10).isActive = true
    }
    
}


