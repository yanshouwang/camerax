//
//  ResolutionSelectorDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/20.
//

import Foundation

class ResolutionSelectorDelegate: PigeonApiDelegateResolutionSelectorProxyApi {
    class BuilderDelegate: PigeonApiDelegateResolutionSelectorBuilderProxyApi {
        func pigeonDefaultConstructor(pigeonApi: PigeonApiResolutionSelectorBuilderProxyApi) throws -> ResolutionSelector.Builder {
            return ResolutionSelector.Builder()
        }
        
        func setResolutionStrategy(pigeonApi: PigeonApiResolutionSelectorBuilderProxyApi, pigeonInstance: ResolutionSelector.Builder, resolutionStrategy: ResolutionStrategy) throws -> ResolutionSelector.Builder {
            return pigeonInstance.setResolutionStrategy(resolutionStrategy)
        }
        
        func build(pigeonApi: PigeonApiResolutionSelectorBuilderProxyApi, pigeonInstance: ResolutionSelector.Builder) throws -> ResolutionSelector {
            return pigeonInstance.build()
        }
    }
    
    func getResolutionStrategy(pigeonApi: PigeonApiResolutionSelectorProxyApi, pigeonInstance: ResolutionSelector) throws -> ResolutionStrategy? {
        return pigeonInstance.resolutionStrategy
    }
}
