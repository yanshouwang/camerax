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
    var cvPixelFormat: Int {
        switch self {
        case .yuv420_888:
            return Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)
        case .rgba8888:
            return Int(kCVPixelFormatType_32BGRA)
        default:
            fatalError()
        }
    }
}

extension Int {
    var imageAnalysisOutputImageFormat: ImageAnalysis.OutputImageFormat {
        switch self {
        case Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange):
            return .yuv420_888
        case Int(kCVPixelFormatType_32BGRA):
            return .rgba8888
        default:
            fatalError()
        }
    }
}
