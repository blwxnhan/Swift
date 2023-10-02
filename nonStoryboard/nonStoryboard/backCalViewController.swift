//
//  backCalViewController.swift
//  nonStoryboard
//
//  Created by Bowon Han on 2023/09/26.
//

import UIKit

class backCalViewController: ViewController{
    
    var height:String! = ""
    var weight:String! = ""
    var bmiResultStore:Float! = 0
    
    override func viewDidLoad() {
        
        view.backgroundColor = .white // 배경색
        
        BMIBackCalButton()
        ResultGuideLabel()
        
        let floatHeight:Float! = (height as NSString).floatValue
        let floatWeight:Float! = (weight as NSString).floatValue
        bmiResultStore = floatWeight / ((floatHeight*0.01)*(floatHeight*0.01))

//        if bmiResultStore >= 25 {
//            lbCondition.text = "비만"
//        }
//
//        else if (23 <= bmiResultStore) || (bmiResultStore >= 24.99) {
//            lbCondition.text = "과체중"
//
//        }
//
//        else if (18.5 <= bmiResultStore) || (bmiResultStore >= 22.99) {
//            lbCondition.text = "정상"
//
//        }
//
//        else {
//            lbCondition.text = "저체중"
//
//        }
//
//        self.BMIResult.text = String(format:"%.2f",bmiResultStore)

    }
    
    
    func BMIBackCalButton(){
        let backCalButton = UIButton()

        backCalButton.setTitle("다시 계산하기", for: .normal)
        backCalButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backCalButton.backgroundColor = .systemBlue
        //뷰의 자동크기 및 위치조정을 비활성화 또는 활성화하는 속성
        //-> 프로그래밍 방식으로 제약조건 추가시 사용
        //해당 뷰에 대한 auto layout 제약조건을 수동으로 추가할 수 있음
        backCalButton.translatesAutoresizingMaskIntoConstraints = false
        //뷰에 추가
        view.addSubview(backCalButton)
        
        let safeArea = view.safeAreaLayoutGuide
        
        backCalButton.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor,constant: 20).isActive = true
        backCalButton.bottomAnchor.constraint(equalTo:  safeArea.bottomAnchor,constant: -20).isActive = true
        backCalButton.trailingAnchor.constraint(equalTo:  safeArea.trailingAnchor, constant: -20).isActive = true
        
        
    }
    
    @objc func goBack(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    
    func ResultGuideLabel(){
        let guideResultLabel = UILabel()
        let lbBMIResult = UILabel()
        let lbCondition = UILabel()


        guideResultLabel.text = "BMI 결과값"
        guideResultLabel.translatesAutoresizingMaskIntoConstraints = false
        guideResultLabel.textAlignment = .center
        guideResultLabel.adjustsFontSizeToFitWidth = true
        guideResultLabel.font = UIFont.systemFont(ofSize: 23)
        
        lbBMIResult.text = "결과값"
        lbBMIResult.translatesAutoresizingMaskIntoConstraints = false
        lbBMIResult.textAlignment = .center
        lbBMIResult.backgroundColor = .brown
        lbBMIResult.adjustsFontSizeToFitWidth = true

        
        lbCondition.text = "권장"
        lbCondition.translatesAutoresizingMaskIntoConstraints = false
        lbCondition.textAlignment = .center
        lbCondition.adjustsFontSizeToFitWidth = true
        
        //뷰에 추가
        view.addSubview(guideResultLabel)
        view.addSubview(lbBMIResult)
        view.addSubview(lbCondition)

        let safeArea = view.safeAreaLayoutGuide

        guideResultLabel.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor).isActive = true
        guideResultLabel.trailingAnchor.constraint(equalTo:  safeArea.trailingAnchor).isActive = true
        guideResultLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 80).isActive = true
        
        // height 위치
        lbBMIResult.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor,constant: 60).isActive = true
        lbBMIResult.trailingAnchor.constraint(equalTo:  safeArea.trailingAnchor,constant: -60).isActive = true
        lbBMIResult.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 150).isActive = true
        
        // weight 위치
        lbCondition.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor).isActive = true
        lbCondition.trailingAnchor.constraint(equalTo:  safeArea.trailingAnchor).isActive = true
        lbCondition.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 210).isActive = true
        
    }
    
    
    
}


// MARK: - for canvas
import SwiftUI

struct backCalViewControllerRepresentable: UIViewControllerRepresentable{
    typealias UIViewControllerType = backCalViewController
    
    func makeUIViewController(context: Context) -> backCalViewController {
        return backCalViewController()
    }
    
    func updateUIViewController(_ uiViewController: backCalViewController, context: Context) {
        
    }
    
    
}

@available(iOS 13.0.0, *)
struct backCalViewPreview: PreviewProvider{
    static var previews: some View{
        backCalViewControllerRepresentable()
    }
}


