//
//  ViewController.swift
//  PickerView
//
//  Created by 한보원 on 8/1/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let MAX_ARRAY_NUM=10 // 이미지의 파일명을 저장할 수 있는 배열의 최대크기 지정
    let PICKER_VIEW_COLUMN=1 //피커뷰의 열의 개수 지정
    let PICKER_VIEW_HEIGHT:CGFloat=80
    var imageArray=[UIImage?]()
    var imageFileName=["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg",
                       "6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"]
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //image변수 선언 후 파일명으로 UIImage타입의 이미지 생성 -> image에 할당
        for i in 0 ..< MAX_ARRAY_NUM{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image) // 배열에 추가
        }
        
        lblImageFileName.text=imageFileName[0] //실행시 첫번째 파일명 출력
        imageView.image=imageArray[0] //이미지 뷰에 첫번째 이미지 나타남
    }
     
    //피커뷰에게 컴포넌트의 수를 정수값으로 넘겨주는 델리게이트 메서드(피커뷰의 컴포넌트 = 피커뷰에 표시되는 열의 개수)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    //numberOfRowsInComponent 인수를 가지는 델리게이트 메서드, 피커뷰에게 컴포넌트의 열의 개수를 정수값(피커뷰의 해당 열에서 선택할 수 있는 행의 개수)으로 넘겨줌
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    //titleForRow를 가지는 델리게이트 메서드, 피커뷰에게 각 열의 타이틀을 문자열로 전달(파일명 전달)
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame=CGRect(x:0, y:0, width: 100, height: 150)
        
        return imageView
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text=imageFileName[row] //`사용자가 선택한 row값을 사용하여 배열에서 row값에 해당하는 문자열 가져옴
        imageView.image=imageArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }

}

