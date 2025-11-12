//
//  CameraSelector.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/12.
//

import Foundation

public class CameraSelector: NSObject {
    public enum LensFacing: Int {
        case unknown, front, back, external
    }

    public static let front = CameraSelector(lensFacing: .front)
    public static let back = CameraSelector(lensFacing: .back)
    public static let external = CameraSelector(lensFacing: .external)
    
    public let lensFacing: LensFacing
    
    public init(lensFacing: LensFacing?) {
        self.lensFacing = lensFacing ?? .back
    }
}
