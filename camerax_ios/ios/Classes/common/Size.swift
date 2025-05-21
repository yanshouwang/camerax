//
//  IntSize.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/20.
//

import Foundation

public class Size<T: Numeric>: NSObject {
    public let width: T
    public let height: T
    
    init(width: T, height: T) {
        self.width = width
        self.height = height
    }
}
