//
//  Observer.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

typealias Observer<T> = ObserverBase & ObserverProtocol

class ObserverBase: NSObject {
    internal var observations: [NSObject: NSKeyValueObservation]
    
    override init() {
        self.observations = [:]
    }
}

protocol ObserverProtocol: NSObjectProtocol {
    associatedtype T
    
    func onChanged(_ value: T) -> Void
}
