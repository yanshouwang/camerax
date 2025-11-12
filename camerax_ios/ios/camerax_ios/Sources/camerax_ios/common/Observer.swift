//
//  Observer.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

public protocol Observer<T>: NSObjectProtocol {
    associatedtype T
    
    func onChanged(_ value: T) -> Void
}
