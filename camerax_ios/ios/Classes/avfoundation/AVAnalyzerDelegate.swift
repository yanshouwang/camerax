//
//  AVAnalyzerDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation

class AVAnalyzerDelegate: PigeonApiDelegateAVAnalyzerApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiAVAnalyzerApi, types: [AVMetadataObjectTypeApi], consumer: AVMetadataObjectsConsumer) throws -> AVAnalyzer {
        return AVAnalyzer(types: types.compactMap { $0.impl }, consumer: consumer)
    }
}
