//
//  ViewController.swift
//  ImageView
//
//  Created by 한보원 on 7/27/23.
//

import UIKit

class ImageViewController: UIViewController {
    var isZoom = false //zoom 여부 확인하는 bool타입 변수
    var imgOn: UIImage? //on사진 할당받은 uiimage타입 변수
    var imgOff: UIImage? //off사진 할당받은 uiimage타입 변수
    
    //아울렛변수
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    //뷰가 불러진 후 실행하고자하는 기능을 입력
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn
    }

    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat=2.0 //확대할 배율값
        var newWidth: CGFloat, newHeight: CGFloat //확대할 크기의 계산값을 보관할 변수
        //xcode에서 float를 재정의해놓은것  float라고 생각하면됨
        
        //현재 zoom되어있을경우
        if(isZoom){ //true
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            btnResize.setTitle("확대", for: .normal)
            
        }
        //현재 축소되어있을경우
        else{ //false
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
            
        }
        //이미지의 크기를 수정된 너비와 높이로 변환
        imgView.frame.size=CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        //on으로 되어있을 경우 on 이미지
        if sender.isOn {
            imgView.image = imgOn
        }
        //off로 되어있을경우 off 이미지
        else{
            imgView.image = imgOff
        }
    }
}

