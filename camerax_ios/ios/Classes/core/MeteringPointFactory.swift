//
//  MeteringPointFactory.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/21.
//

import Foundation

public typealias MeteringPointFactory = MeteringPointFactoryBase & MeteringPointFactoryProtocol

public class MeteringPointFactoryBase: NSObject {
    static func getDefaultPointSize() -> CGFloat {
        return 0.15
    }
}

public protocol MeteringPointFactoryProtocol: NSObjectProtocol {
    func convertPoint(_ x: CGFloat, _ y: CGFloat) -> CGPoint
}

public extension MeteringPointFactoryProtocol {
    func createPoint(_ x: CGFloat, _ y: CGFloat) -> MeteringPoint {
        let size = MeteringPointFactoryBase.getDefaultPointSize()
        return createPoint(x, y, size)
    }
    
    func createPoint(_ x: CGFloat, _ y: CGFloat, _ size: CGFloat) -> MeteringPoint {
        let convertedPoint = convertPoint(x, y)
        return MeteringPoint(x: convertedPoint.x, y: convertedPoint.y, size: size)
    }
}
