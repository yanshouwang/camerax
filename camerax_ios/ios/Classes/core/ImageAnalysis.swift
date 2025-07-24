//
//  ImageAnalysis.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

public class ImageAnalysis: NSObject {
    open class Analyzer: NSObject {
        func analyze(_ image: ImageProxy) {
            fatalError("analyze is not implemented")
        }
    }
}
