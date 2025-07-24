//
//  AVAnalyzer.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation
import AVFoundation

public class AVAnalyzer: ImageAnalysis.Analyzer {
    let types: [AVMetadataObject.ObjectType]
    let consumer: any Consumer<[AVMetadataObject]>
    
    init(types: [AVMetadataObject.ObjectType], consumer: any Consumer<[AVMetadataObject]>) {
        self.types = types
        self.consumer = consumer
    }
}
