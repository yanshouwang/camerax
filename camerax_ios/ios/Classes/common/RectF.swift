//
//  RectF.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation

class RectF: NSObject {
    let left: Double
    let top: Double
    let right: Double
    let bottom: Double
    
    init(left: Double, top: Double, right: Double, bottom: Double) {
        self.left = left
        self.top = top
        self.right = right
        self.bottom = bottom
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? RectF else { return false }
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

extension RectF {
    var width: Double {
        return right - left
    }
    
    var height: Double {
        return bottom - top
    }
    
    var cgRect: CGRect {
        return CGRect(x: left, y: top, width: width, height: height)
    }
}

extension CGRect {
    var cxRectF: RectF {
        return RectF(left: minX, top: minY, right: maxX, bottom: maxY)
    }
}
