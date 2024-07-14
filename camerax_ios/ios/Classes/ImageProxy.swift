//
//  File.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/13.
//

import Foundation

@objc public class ImageProxy: NSObject {
    let width: Int
    let height: Int
    let data: Data
    
    init(width: Int, height: Int, data: Data) {
        self.width = width
        self.height = height
        self.data = data
    }
}
