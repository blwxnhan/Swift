//
//  Observable.swift
//  Clock
//
//  Created by Bowon Han on 12/31/23.
//

import Foundation

class Observable<T> {
    
    // value 변경 시 didset에 의해 변경 -> 이 값을 가지고 listener 동작을 함
    var value: T? {
        didSet {
            self.listener?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    // 동작을 담아줄 listener 변수 생성
    private var listener: ((T?) -> Void)?
    
    func bind (_ listener: @escaping (T?) -> Void) {
        listener(value)
        self.listener = listener
    }
}
