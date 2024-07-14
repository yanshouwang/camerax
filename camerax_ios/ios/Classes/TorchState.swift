//
//  TorchState.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/14.
//

import Foundation

@objc public class TorchState: NSObject {
    @objc public let value: Bool
    
    init(value: Bool) {
        self.value = value
    }
}
