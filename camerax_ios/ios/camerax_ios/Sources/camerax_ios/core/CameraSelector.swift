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
    
    public class Builder: NSObject {
        private var lensFacing: LensFacing
        
        public override init() {
            self.lensFacing = .back
        }
        
        func requireLensFacing(_ lensFacing: LensFacing) throws -> Builder {
            guard lensFacing != .unknown else {
                throw CameraXError(code: "illegal-argument-error", message: "The specified lens facing is invalid", details: nil)
            }
            self.lensFacing = lensFacing
            return self
        }
        
        func build() -> CameraSelector {
            return CameraSelector(lensFacing: lensFacing)
        }
    }

    public static let front = CameraSelector(lensFacing: .front)
    public static let back = CameraSelector(lensFacing: .back)
    public static let external = CameraSelector(lensFacing: .external)
    
    public let lensFacing: LensFacing
    
    private init(lensFacing: LensFacing?) {
        self.lensFacing = lensFacing ?? .back
    }
}
