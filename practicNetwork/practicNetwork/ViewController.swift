//
//  ViewController.swift
//  practicNetwork
//
//  Created by Bowon Han on 11/4/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var musicInfo : [Music] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setLayout()
    }
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "pencil")
        
        return imageView
    }()
    
    private lazy var imageButton : UIButton = {
        let button = UIButton()
        button.setTitle("click", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        return button
    }()
    
    private let textField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    func setLayout(){
        view.addSubview(imageView)
        view.addSubview(imageButton)
        view.addSubview(textField)
        
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.width.equalTo(150)
        }
        
        imageButton.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.leading.equalTo(textField).offset(100)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)

        }
        
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(imageButton).offset(50)
            make.trailing.leading.equalToSuperview().inset(100)
            make.height.equalTo(200)
        }
        
        
    }
    
    @objc private func didTapButton() {
        let search = textField.text
//        print(search)
        fetchImage(for: textField.text ?? "")
    }
    
    func fetchImage(for id: String){
        guard let url = URL(string: "https://itunes.apple.com/search?media=music&term=\(id)") else { return }
        
        Task {
            guard
                let imageURL = try? await self.requestImageURL(requestURL: url),
                let url = URL(string: imageURL),
                let data = try? Data(contentsOf: url)
            else { return }
            self.imageView.image = UIImage(data: data)
        }
    }
    
    func requestImageURL(requestURL: URL) async throws -> String {
        let (data, _) = try await URLSession.shared.data(from: requestURL)
        return try JSONDecoder().decode(MusicService.self, from: data).results.first?.imageName ?? ""
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


