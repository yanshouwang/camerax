//
//  FocusMeteringResult.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/21.
//

import Foundation

public class FocusMeteringResult: NSObject {
    public let isFocusSuccessful: Bool
    
    init(_ isFocusSuccessful: Bool) {
        self.isFocusSuccessful = isFocusSuccessful
    }
}
