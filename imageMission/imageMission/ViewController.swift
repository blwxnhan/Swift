//
//  ViewController.swift
//  imageMission
//
//  Created by 한보원 on 7/30/23.
//

import UIKit

class ViewController: UIViewController {
    var numImage = 1
    let maxImage = 3
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var numText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image=UIImage(named: "1.png")
        numText.text=String(numImage)

    }

    @IBAction func btnBeforeImage(_ sender: UIButton) {
        numImage = numImage - 1
        if(numImage<1){
            numImage=maxImage
        }
        let imageName = String(numImage) + ".png"
        numText.text=String(numImage)
        imgView.image=UIImage(named: imageName)
    }
    
    @IBAction func btnAfterImage(_ sender: UIButton) {
        numImage = numImage + 1
        if(numImage>maxImage){
            numImage=1
        }
        let imageName = String(numImage) + ".png"
        numText.text=String(numImage)
        imgView.image=UIImage(named: imageName)

    }
    
}

