//
//  Consumer.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

public protocol Consumer<T>: NSObjectProtocol {
    associatedtype T
    
    func accept(_ value: T) -> Void
}
