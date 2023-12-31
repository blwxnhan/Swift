//
//  Todo.swift
//  practiceNetworkRefactoring
//
//  Created by Bowon Han on 12/24/23.
//

import Foundation

struct Todo : Codable {
    let id : Int
    var title : String
    var description : String?
    var endDate : Date?
    var isFinished : Bool?
}
