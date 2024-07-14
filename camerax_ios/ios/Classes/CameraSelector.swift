//
//  CameraSelector.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/12.
//

import Foundation

@objc public class CameraSelector: NSObject {
    @objc public let lensFacing: LensFacing
    
    @objc public init(lensFacing: LensFacing) {
        self.lensFacing = lensFacing
    }
    
    @objc public static let front = CameraSelector(lensFacing: .front)
    @objc public static let back = CameraSelector(lensFacing: .back)
    @objc public static let external = CameraSelector(lensFacing: .external)
}
