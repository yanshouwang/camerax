//
//  MeteringPoint.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/21.
//

import Foundation

public class MeteringPoint: NSObject {
    let x: CGFloat
    let y: CGFloat
    public let size: CGFloat
    
    init(x: CGFloat, y: CGFloat, size: CGFloat) {
        self.x = x
        self.y = y
        self.size = size
    }
}

extension MeteringPoint {
    var impl: CGPoint {
        return CGPoint(x: x, y: y)
    }
}
