//
//  ViewController.swift
//  tableViewPrac
//
//  Created by Bowon Han on 10/3/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        let safeArea = view.safeAreaLayoutGuide
//        tableView.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor).isActive = true
//        tableView.bottomAnchor.constraint(equalTo:  safeArea.bottomAnchor).isActive = true
//        tableView.trailingAnchor.constraint(equalTo:  safeArea.trailingAnchor).isActive = true
//        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        
        NSLayoutConstraint.activate([
                    tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
                    tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
                    tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
                    tableView.topAnchor.constraint(equalTo: safeArea.topAnchor)
                ])

        return tableView

    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: customCell.identifier)

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.title.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customCell.identifier,for: indexPath) as? customCell ?? customCell()
//        cell.textLabel?.text=items[(indexPath as NSIndexPath).row]
//        cell.imageView?.image=UIImage(named:itemsImageFile[(indexPath as NSIndexPath).row])
//
        cell.cellLabel.text = dataModel.title[indexPath.row]
        cell.cellImgView.image = UIImage(named: dataModel.img[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}



// MARK: - for canvas
import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable{
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        
    }
}

@available(iOS 13.0.0, *)
struct ViewPreview: PreviewProvider{
    static var previews: some View{
        ViewControllerRepresentable()
    }
}

