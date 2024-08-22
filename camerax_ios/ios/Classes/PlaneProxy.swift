//
//  PlaneProxy.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/22.
//

import Foundation

@objc public class PlaneProxy: NSObject {
    @objc public let rowStride: Int
    @objc public let pixelStride: Int
    @objc public let value: Data
    
    init(rowStride: Int, pixelStride: Int, value: Data) {
        self.rowStride = rowStride
        self.pixelStride = pixelStride
        self.value = value
    }
}
