//
//  ImageAnalysis.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation
import CoreVideo

public class ImageAnalysis: NSObject {
    public enum OutputImageFormat {
        case yuv420_888, rgba8888, nv21
    }
    
    open class Analyzer: NSObject {
        func analyze(_ image: ImageProxy) {
            fatalError("analyze is not implemented")
        }
    }
    
    class AnalyzerImpl: ImageAnalysis.Analyzer {
        private let consumer: ImageProxyConsumer
        
        init(consumer: ImageProxyConsumer) {
            self.consumer = consumer
        }
        
        public override func analyze(_ image: ImageProxy) {
            consumer.accept(image)
        }
    }
}

extension ImageAnalysis.OutputImageFormat {
    var cvPixelFormatOrNil: Int? {
        return switch self {
        case .yuv420_888: Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)
        case .rgba8888: Int(kCVPixelFormatType_32BGRA)
        default: nil
        }
    }
}

extension Int {
    var imageAnalysisOutputImageFormatOrNil: ImageAnalysis.OutputImageFormat? {
        return switch self {
        case Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange): .yuv420_888
        case Int(kCVPixelFormatType_32BGRA): .rgba8888
        default: nil
        }
    }
}
