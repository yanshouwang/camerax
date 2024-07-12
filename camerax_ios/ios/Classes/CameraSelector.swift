//
//  CameraSelector.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/12.
//

import Foundation

class CameraSelector: NSObject {
    let lensFacing: LensFacing
    
    init(lensFacing: LensFacing) {
        self.lensFacing = lensFacing
    }
    
    static var front: CameraSelector {
        CameraSelector(lensFacing: .front)
    }
    
//    static var back: CameraSelector {
//        CameraSelector(lensFacing: .back)
//    }
    
    static let back = CameraSelector(lensFacing: .back)
    
    static var external: CameraSelector {
        CameraSelector(lensFacing: .external)
    }
}
