//
//  DataModel.swift
//  tableViewPrac
//
//  Created by Bowon Han on 10/3/23.
////
//
import UIKit

struct MyDataModel {
    let title: [String]
    let img: [String]
}

let movieTitle = ["배트맨", "블랙팬서", "캡틴 아메리카","닥터스트레인지","가디언즈 오브 갤럭시","헐크","아이언맨","스파이더맨","스파이더맨2","토르"]
let movieImg = ["batman.png","blackpanther.png","captain.png","doctorstrange.png","guardians.png","hulk.png","ironman.png","spiderman.png","spiderman2.png","thor.png"]

let dataModel = MyDataModel(title: movieTitle, img: movieImg)


