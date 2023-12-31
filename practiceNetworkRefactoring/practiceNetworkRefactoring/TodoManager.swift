//
//  TodoManager.swift
//  practiceNetworkRefactoring
//
//  Created by Bowon Han on 12/24/23.
//

import Foundation

class TodoManager{
    static let shared = TodoManager()
    
    var todoDataSource : [Todo] = []
    
    private init() {}
    
    func invokeAPI() {}
}
