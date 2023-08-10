//
//  ViewController.swift
//  PickerMission
//
//  Created by 한보원 on 8/1/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let MAX_ARRAY_NUM=10
    let PICKER_VIEW_COLUMN=2
    let PICKER_VIEW_HEIGHT:CGFloat=80
    var imageArray=[UIImage?]()
    var arrayImageFileName=["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"]
    
    @IBOutlet var pickerImageOne: UIPickerView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var lblImageFileName: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0 ..< MAX_ARRAY_NUM{
            let image = UIImage(named: arrayImageFileName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text=arrayImageFileName[0]
        imageView.image=imageArray[0]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayImageFileName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x:0, y:0, width: 100, height: 150)
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component==0){
            lblImageFileName.text=arrayImageFileName[row]
        }
        
        else{
            imageView.image=imageArray[row]
        }
//        lblImageFileName.text=arrayImageFileName[row]
//        ima₩geView.image=imageArray[row]

        
  }

}

