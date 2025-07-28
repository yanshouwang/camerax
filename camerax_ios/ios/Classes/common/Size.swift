//
//  Size.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/23.
//

import Foundation

class Size: NSObject {
    let width: Int64
    let height: Int64
    
    init(width: Int64, height: Int64) {
        self.width = width
        self.height = height
    }
    
    public override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? Size else { return false }
        return object.width == self.width && object.height == self.height
    }
    
    public override var hash: Int {
        var hasher = Hasher()
        hasher.combine(width)
        hasher.combine(height)
        return hasher.finalize()
    }
}

extension Size {
    var cgSize: CGSize {
        return CGSize(width: Int(width), height: Int(height))
    }
}

extension CGSize {
    var cxSize: Size {
        return Size(width: Int64(width), height: Int64(height))
    }
}
