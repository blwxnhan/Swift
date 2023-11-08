//
//  ViewController.swift
//  PracticeUIScorllView
//
//  Created by Bowon Han on 11/6/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private var toggle = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        view.backgroundColor = .white
        
        scrollView.checkButton.addTarget(self, action: #selector(clickFinishButton), for: .touchUpInside)

    }
    
    private let scrollView: ScrollView = {
        let view = ScrollView()

        return view
    }()
    
    private func setLayout() {
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints{
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc func clickFinishButton(_:UIButton){
        if toggle {
            scrollView.checkButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
    
            scrollView.todoListLabel.textColor = .lightGray
            scrollView.todoListLabel.strikethroughAndChangeLineColor(from: scrollView.todoListLabel.text, at: scrollView.todoListLabel.text)
    
            toggle = false
        }
    
        else {
            scrollView.checkButton.setImage(UIImage(systemName: "circle"), for: .normal)
    
            scrollView.todoListLabel.textColor = .black
            scrollView.todoListLabel.unsetStrikethrough(from: scrollView.todoListLabel.text, at: scrollView.todoListLabel.text)
    
            toggle = true
        }
    }

}
// MARK: - extension

extension UILabel {
    func strikethroughAndChangeLineColor(from text: String?, at range: String?) {
        guard let text = text,
              let range = range else { return }

        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttributes([
            NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.strikethroughColor: UIColor.lightGray
        ], range: NSString(string: text).range(of: range))
        self.attributedText = attributedString
    }

    func unsetStrikethrough(from text: String?, at range: String?) {
        guard let text = text, let range = range else { return }

        // 기존 텍스트의 NSAttributedString 생성
        let attributedString = NSMutableAttributedString(string: text)

        // 취소선 제거
        attributedString.removeAttribute(NSAttributedString.Key.strikethroughStyle,
                                         range: NSString(string: text).range(of: range))

        // UILabel의 attributedText 설정
        self.attributedText = attributedString
    }
}


// MARK: - for canvas
//import SwiftUI
//
//struct ViewControllerRepresentable: UIViewControllerRepresentable{
//    typealias UIViewControllerType = ViewController
//
//    func makeUIViewController(context: Context) -> ViewController {
//        return ViewController()
//    }
//
//    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
//
//    }
//}
//
//@available(iOS 13.0.0, *)
//struct ViewPreview: PreviewProvider{
//    static var previews: some View{
//        ViewControllerRepresentable()
//    }
//}

