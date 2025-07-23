//
//  Rect.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/23.
//

import Foundation

class Rect: NSObject {
    let left: Int
    let top: Int
    let right: Int
    let bottom: Int
    
    init(left: Int, top: Int, right: Int, bottom: Int) {
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
    var width: Int {
        return right - left
    }
    
    var height: Int {
        return bottom - top
    }
    
    var cgRect: CGRect {
        return CGRect(x: left, y: top, width: width, height: height)
    }
}

extension CGRect {
    var cxRect: Rect {
        return Rect(left: Int(minX), top: Int(minY), right: Int(maxX), bottom: Int(maxY))
    }
}
