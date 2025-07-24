//
//  Rect.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/23.
//

import Foundation

class Rect: NSObject {
    let left: Int64
    let top: Int64
    let right: Int64
    let bottom: Int64
    
    init(left: Int64, top: Int64, right: Int64, bottom: Int64) {
        self.left = left
        self.top = top
        self.right = right
        self.bottom = bottom
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? Rect else { return false }
        return object.left == self.left && object.top == self.top && object.right == self.right && object.bottom == self.bottom
    }
    
    override var hash: Int {
        var hasher = Hasher()
        hasher.combine(left)
        hasher.combine(top)
        hasher.combine(right)
        hasher.combine(bottom)
        return hasher.finalize()
    }
}

extension Rect {
    var width: Int64 {
        return right - left
    }
    
    var height: Int64 {
        return bottom - top
    }
    
    var cgRect: CGRect {
        return CGRect(x: Int(left), y: Int(top), width: Int(width), height: Int(height))
    }
}

extension CGRect {
    var cxRect: Rect {
        return Rect(left: Int64(minX), top: Int64(minY), right: Int64(maxX), bottom: Int64(maxY))
    }
}
