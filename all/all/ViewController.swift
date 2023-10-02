//
//  ViewController.swift
//  all
//
//  Created by Bowon Han on 2023/09/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIButton()
        btn.frame = CGRect(x:50,y:100,width: 150,height: 30)
        btn.setTitle("테스트 버튼", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(btn)
        
        let safeArea = view.safeAreaLayoutGuide
        btn.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor,constant: 20).isActive = true
        btn.bottomAnchor.constraint(equalTo:  safeArea.bottomAnchor,constant: -20).isActive = true
        btn.trailingAnchor.constraint(equalTo:  safeArea.trailingAnchor, constant: -20).isActive = true

        
        
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

