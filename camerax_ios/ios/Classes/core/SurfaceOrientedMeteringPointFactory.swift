//
//  SurfaceOrientedMeteringPointFactory.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/21.
//

import Foundation

public class SurfaceOrientedMeteringPointFactory: MeteringPointFactory {
    private let width: CGFloat
    private let height: CGFloat
    
    init(_ width: CGFloat, _ height: CGFloat) {
        self.width = width
        self.height = height
    }
    
    public func convertPoint(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: y)
    }
}
