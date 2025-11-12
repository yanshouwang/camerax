//
//  ResolutionSelectorDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/20.
//

import Foundation

class ResolutionSelectorDelegate: PigeonApiDelegateResolutionSelectorProxyApi {
    func build(pigeonApi: PigeonApiResolutionSelectorProxyApi, resolutionStrategy: ResolutionStrategy?) throws -> ResolutionSelector {
        return ResolutionSelector(resolutionStrategy: resolutionStrategy)
    }
    
    func getResolutionStrategy(pigeonApi: PigeonApiResolutionSelectorProxyApi, pigeonInstance: ResolutionSelector) throws -> ResolutionStrategy? {
        return pigeonInstance.resolutionStrategy
    }
}
