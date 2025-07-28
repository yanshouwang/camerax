//
//  SizeF.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation

class SizeF: NSObject {
    let width: Double
    let height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    public override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? SizeF else { return false }
        return object.width == self.width && object.height == self.height
    }
    
    public override var hash: Int {
        var hasher = Hasher()
        hasher.combine(width)
        hasher.combine(height)
        return hasher.finalize()
    }
}

extension SizeF {
    var cgSize: CGSize {
        return CGSize(width: width, height: height)
    }
}

extension CGSize {
    var cxSizeF: SizeF {
        return SizeF(width: width, height: height)
    }
}
