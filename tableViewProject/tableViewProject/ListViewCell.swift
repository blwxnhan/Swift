//
//  ListViewCell.swift
//  tableViewProject
//
//  Created by Bowon Han on 10/4/23.
//

import UIKit

class ListViewCell: UITableViewCell{
    static let identifier = "ListViewCell"
    
    private let imgContainer : UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    
    let movieImg : UIImageView = {
        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let movieTitle : UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(movieTitle)
        contentView.addSubview(imgContainer)
        imgContainer.addSubview(movieImg)
        contentView.clipsToBounds = true
//        accessoryType = .disclosureIndicator

    }
    
    required init?(coder: NSCoder) {
            fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size : CGFloat = contentView.frame.size.height - 12
        imgContainer.frame = CGRect(x: 15, y: 15, width: size, height: size)
            
        let imageSize : CGFloat = size / 1.5
        movieImg.frame = CGRect(x: (size - imageSize)/2, y: (size - imageSize)/2, width: imageSize, height: imageSize)
            
        
        movieTitle.frame = CGRect(x: 25 + imgContainer.frame.size.width, y: 0, width: contentView.frame.size.width - 20 - imgContainer.frame.size.width, height: contentView.frame.size.height)
        }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        movieImg.image = nil
        movieTitle.text = nil
        imgContainer.backgroundColor = nil
    }
    
//    public func configure(with model : Section) {
//        movieTitle.text = model.movieTitle
//        movieImg.text = model.movieImg
//    }
}
