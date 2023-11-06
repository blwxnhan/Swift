//
//  ViewController.swift
//  tableViewProject
//
//  Created by Bowon Han on 10/3/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    let movieTitle = ["배트맨", "블랙팬서", "캡틴 아메리카","닥터스트레인지","가디언즈 오브 갤럭시","헐크","아이언맨","스파이더맨","스파이더맨2","토르"]
    let movieImg = ["batman.png","blackpanther.png","captain.png","doctorstrange.png","guardians.png","hulk.png","ironman.png","spiderman.png","spiderman2.png","thor.png"]
    
    lazy var myTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        myTableView.register(ListViewCell.self, forCellReuseIdentifier: ListViewCell.identifier)

        return tableView
    }()
    
    lazy var dataList : [Section] = {
        var datalist = [Section]()
        for (movieImg,movieTitle) in zip(movieImg,movieTitle){
            let list = Section()
            list.movieImg = movieImg
            list.movieTitle = movieTitle
            
            datalist.append(list)
        }
        
        return datalist
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .white
        
        myTableView.delegate = self
        myTableView.dataSource = self
        setConstraint()
        myTableView.frame = view.bounds

    }
    
    private func setConstraint() {
        self.view.addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            myTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            myTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.dataList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ListViewCell.identifier) as! ListViewCell
        cell.movieTitle.text=row.movieTitle
        cell.movieImg.image=UIImage(named:row.movieImg!)
        
        return cell
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

