//
//  ViewController.swift
//  Alert
//
//  Created by 한보원 on 8/1/23.
//

import UIKit

class ViewController: UIViewController {
    
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    
    var isLampOn = true
    
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = imgOn
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn==true){
            let lampOnAlert = UIAlertController(title: "경고",message: "현재 On 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네 알겠습니다.", style: UIAlertAction.Style.default,handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert,animated: true,completion: nil)
        }
        else{
            imageView.image=imgOn
            isLampOn=true
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if(isLampOn==false){
            let lampOffAlert = UIAlertController(title: "경고",message: "현재 Off 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네 알겠습니다.", style: UIAlertAction.Style.default,handler: nil)
            lampOffAlert.addAction(offAction)
            present(lampOffAlert,animated: true,completion: nil)
        }
        else{
            
            let lampOffAlertS = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let offActionS = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {
                ACTION in self.imageView.image=self.imgOff
                self.isLampOn=false
            })
            
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            lampOffAlertS.addAction(offActionS)
            lampOffAlertS.addAction(cancelAction)
            
            present(lampOffAlertS, animated: true,completion: nil)
            

        }
    }
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        
        if (imageView.image==imgRemove){
            let lampRemoveAlert = UIAlertController(title: "경고",message: "현재 제거된 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let removeAction = UIAlertAction(title: "네 알겠습니다.", style: UIAlertAction.Style.default,handler: nil)
            lampRemoveAlert.addAction(removeAction)
            present(lampRemoveAlert,animated: true,completion: nil)
        }
        
        let lampRemoveAlert = UIAlertController(title: "램프제거", message: "램프를 제거하시겠습니까?",preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title: "아니오, 끌게요.",style: UIAlertAction.Style.default,handler: {
            ACTION in self.imageView.image = self.imgOff
            self.isLampOn=false
        })
        
        let onAction = UIAlertAction(title: "아니오, 켤게요.", style: UIAlertAction.Style.default, handler: {
            ACTION in self.imageView.image = self.imgOn
            self.isLampOn=true
        })
        
        let removeAction = UIAlertAction(title: "네, 제거할게요", style: UIAlertAction.Style.default, handler: {
            ACTION in self.imageView.image = self.imgRemove
            self.isLampOn=false
        })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        present(lampRemoveAlert,animated: true, completion: nil)
        
    }
    
    
}

