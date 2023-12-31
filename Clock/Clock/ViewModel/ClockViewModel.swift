//
//  ClockViewModel.swift
//  Clock
//
//  Created by Bowon Han on 12/31/23.
//

import Foundation

class ClockViewModel {
// MARK: - closure
//    var didChangeTime : ((ClockViewModel)->Void)?
//    
//    var closureTime: String {
//        didSet {
//            didChangeTime?(self)
//        }
//    }
//    
//    // 생성시 현재시간을 담아줌
//    init() {
//        closureTime = Clock.currentTime()
//    }
//    
//    func checkTime() {
//        closureTime = Clock.currentTime()
//    }
    
// MARK: - observer
    var observableTime : Observable<String> = Observable("Observable")
    
    init() {
        observableTime.value = Clock.currentTime()
    }
    
    func checkTime() {
       observableTime.value = Clock.currentTime()
   }
}
