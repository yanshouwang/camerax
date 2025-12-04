//
//  AVAnalyzerDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation
import AVFoundation

class AVAnalyzerDelegate: PigeonApiDelegateAVAnalyzerProxyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiAVAnalyzerProxyApi, types: [AVMetadataObjectTypeApi]?, consumer: AVAnalyzerResultConsumer) throws -> AVAnalyzer {
        return AVAnalyzer(types: types?.compactMap { $0.delegateOrNil }, consumer: consumer)
    }
    
    class ResultDelegate: PigeonApiDelegateAVAnalyzerResultProxyApi {
        func getObjects(pigeonApi: PigeonApiAVAnalyzerResultProxyApi, pigeonInstance: AVAnalyzer.Result) throws -> [AVMetadataObject] {
            return pigeonInstance.objects
        }
    }
}
