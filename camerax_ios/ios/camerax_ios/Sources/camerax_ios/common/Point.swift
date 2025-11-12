//
//  Point.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/23.
//

import Foundation

class Point: NSObject {
    let x: Int64
    let y: Int64
    
    init(x: Int64, y: Int64) {
        self.x = x
        self.y = y
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? Point else { return false }
        return object.x == self.x && object.y == self.y
    }
    
    override var hash: Int {
        var hasher = Hasher()
        hasher.combine(x)
        hasher.combine(y)
        return hasher.finalize()
    }
}

extension Point {
    var cgPoint: CGPoint {
        return CGPoint(x: Int(x), y: Int(x))
    }
}

extension CGPoint {
    var cxPoint: Point {
        return Point(x: Int64(x), y: Int64(y))
    }
}
