//
//  ResolutionSelectorDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/20.
//

import Foundation

class ResolutionSelectorDelegate: PigeonApiDelegateResolutionSelectorApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiResolutionSelectorApi, resolutionStrategy: ResolutionStrategy?) throws -> ResolutionSelector {
        return ResolutionSelector(resolutionStrategy: resolutionStrategy)
    }
    
    func resolutionStrategy(pigeonApi: PigeonApiResolutionSelectorApi, pigeonInstance: ResolutionSelector) throws -> ResolutionStrategy? {
        return pigeonInstance.resolutionStrategy
    }
}
