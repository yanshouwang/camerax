//
//  ImageAnalyzerDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

class ImageAnalysisDelegate {
    class AnalyzerDelegate: PigeonApiDelegateImageAnalysisAnalyzerProxyApi {
        func analyze(pigeonApi: PigeonApiImageAnalysisAnalyzerProxyApi, pigeonInstance: ImageAnalysis.Analyzer, image: ImageProxy) throws {
            pigeonInstance.analyze(image)
        }
    }
    
    class AnalyzerImplDelegate: PigeonApiDelegateImageAnalysisAnalyzerImplProxyApi {
        func pigeonDefaultConstructor(pigeonApi: PigeonApiImageAnalysisAnalyzerImplProxyApi, consumer: ImageProxyConsumer) throws -> ImageAnalysis.Analyzer {
            return ImageAnalysis.AnalyzerImpl(consumer: consumer)
        }
    }
}

extension ImageAnalysisOutputImageFormatApi {
    var delegate: ImageAnalysis.OutputImageFormat {
        return switch self {
        case .yuv420888: .yuv420_888
        case .rgba8888: .rgba8888
        case .nv21: .nv21
        }
    }
}

extension ImageAnalysis.OutputImageFormat {
    var api: ImageAnalysisOutputImageFormatApi {
        return switch self {
        case .yuv420_888: .yuv420888
        case .rgba8888: .rgba8888
        case .nv21: .nv21
        }
    }
}
