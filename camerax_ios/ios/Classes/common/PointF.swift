//
//  PointF.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation

class PointF: NSObject {
    let x: Double
    let y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? PointF else { return false }
        return object.x == self.x && object.y == self.y
    }
    
    override var hash: Int {
        var hasher = Hasher()
        hasher.combine(x)
        hasher.combine(y)
        return hasher.finalize()
    }
}

extension PointF {
    var cgPoint: CGPoint {
        return CGPoint(x: x, y: y)
    }
}

extension CGPoint {
    var cxPointF: PointF {
        return PointF(x: x, y: y)
    }
}
