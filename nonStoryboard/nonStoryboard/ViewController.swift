//
//  ViewController.swift
//  nonStoryboard
//
//  Created by Bowon Han on 2023/09/26.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white // 배경색
        BMIGuideLabel()
        BMICalButton()
        TextField()
        
    }
    
    
    //BMI계산 버튼
    func BMICalButton(){
        let BMIButton = UIButton()

        BMIButton.setTitle("BMI 계산하기", for: .normal)
        BMIButton.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
        BMIButton.backgroundColor = .systemBlue
        //뷰의 자동크기 및 위치조정을 비활성화 또는 활성화하는 속성
        //-> 프로그래밍 방식으로 제약조건 추가시 사용
        //해당 뷰에 대한 auto layout 제약조건을 수동으로 추가할 수 있음
        BMIButton.translatesAutoresizingMaskIntoConstraints = false
        //뷰에 추가
        view.addSubview(BMIButton)

        let safeArea = view.safeAreaLayoutGuide

        BMIButton.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor,constant: 20).isActive = true
        BMIButton.bottomAnchor.constraint(equalTo:  safeArea.bottomAnchor,constant: -20).isActive = true
        BMIButton.trailingAnchor.constraint(equalTo:  safeArea.trailingAnchor, constant: -20).isActive = true

    }
    
    //버튼 클릭시 다음 화면으로 넘어가기
    @objc
    func onTapButton(_ sender: UIButton){
        let backCalVC = backCalViewController()
        backCalVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(backCalVC, animated: true, completion: nil)
        
//        backCalVC.height = tfHeight.text!
//        backCalVC.weight = tfWeight.text!

    }
    
   
    //UILabel
    func BMIGuideLabel(){
        let guideLabel = UILabel()
        let lbHeight = UILabel()
        let lbWeight = UILabel()


        guideLabel.text = "키와 몸무게를 입력하세요"
        guideLabel.translatesAutoresizingMaskIntoConstraints = false
        guideLabel.textAlignment = .center
        guideLabel.adjustsFontSizeToFitWidth = true
        guideLabel.font = UIFont.systemFont(ofSize: 23)
        
        lbHeight.text = "키"
        lbHeight.translatesAutoresizingMaskIntoConstraints = false
        lbHeight.adjustsFontSizeToFitWidth = true
        
        lbWeight.text = "몸무게"
        lbWeight.translatesAutoresizingMaskIntoConstraints = false
        lbWeight.adjustsFontSizeToFitWidth = true
        
        //뷰에 추가
        view.addSubview(guideLabel)
        view.addSubview(lbHeight)
        view.addSubview(lbWeight)

        let safeArea = view.safeAreaLayoutGuide

        guideLabel.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor).isActive = true
        guideLabel.trailingAnchor.constraint(equalTo:  safeArea.trailingAnchor).isActive = true
        guideLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 80).isActive = true
        
        // height 위치
        lbHeight.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor,constant: 60).isActive = true
        lbHeight.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 150).isActive = true
        
        // weight 위치
        lbWeight.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor,constant: 50).isActive = true
        lbWeight.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 210).isActive = true
        
    }
    
    
    func TextField(){
        let tfHeight = UITextField()
        let tfWeight = UITextField()

        tfHeight.borderStyle = .roundedRect
        tfHeight.translatesAutoresizingMaskIntoConstraints = false

        tfWeight.borderStyle = .roundedRect
        tfWeight.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tfHeight)
        view.addSubview(tfWeight)


        let safeArea = view.safeAreaLayoutGuide

        tfHeight.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor,constant: 120).isActive = true
        tfHeight.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 145).isActive = true
        tfHeight.widthAnchor.constraint(equalToConstant: 228).isActive = true


        tfWeight.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor,constant: 120).isActive = true
        tfWeight.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 205).isActive = true
        tfWeight.widthAnchor.constraint(equalToConstant: 228).isActive = true


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

