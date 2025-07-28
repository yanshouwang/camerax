//
//  AVAnalyzerDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation
import AVFoundation

class AVAnalyzerDelegate: PigeonApiDelegateAVAnalyzerApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiAVAnalyzerApi, types: [AVMetadataObjectTypeApi]?, consumer: AVAnalyzerResultConsumer) throws -> AVAnalyzer {
        return AVAnalyzer(types: types?.compactMap { $0.impl }, consumer: consumer)
    }
    
    class ResultDelegate: PigeonApiDelegateAVAnalyzerResultApi {
        func objects(pigeonApi: PigeonApiAVAnalyzerResultApi, pigeonInstance: AVAnalyzer.Result) throws -> [AVMetadataObject] {
            return pigeonInstance.objects
        }
    }
}
