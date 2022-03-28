//
//  Observer.swift
//  FirestoreExample
//
//  Created by admin on 15/03/22.
//

import Foundation
class ObserverObject <T> {
    var value: T?
    private var listener: ((T?) -> Void)?
    init(_ value: T?) {
        self.value = value
    }
    func bind(_ listener: @escaping(T?) -> Void){
        listener(value)
        self.listener = listener
    }
    
}
