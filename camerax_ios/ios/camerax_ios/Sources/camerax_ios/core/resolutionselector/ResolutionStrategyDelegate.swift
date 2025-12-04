//
//  ResolutionStrategyDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/20.
//

import Foundation

class ResolutionStrategyDelegate: PigeonApiDelegateResolutionStrategyProxyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiResolutionStrategyProxyApi, boundSize: Size, fallbackRule: ResolutionStrategyFallbackRuleApi) throws -> ResolutionStrategy {
        return ResolutionStrategy(boundSize: boundSize.cgSize, fallbackRule: fallbackRule.delegate)
    }
    
    func highestAvailableStrategy(pigeonApi: PigeonApiResolutionStrategyProxyApi) throws -> ResolutionStrategy {
        return ResolutionStrategy.highestAvailableStrategy
    }
    
    func getBoundSize(pigeonApi: PigeonApiResolutionStrategyProxyApi, pigeonInstance: ResolutionStrategy) throws -> Size? {
        return pigeonInstance.boundSize?.cxSize
    }
    
    func getFallbackRule(pigeonApi: PigeonApiResolutionStrategyProxyApi, pigeonInstance: ResolutionStrategy) throws -> ResolutionStrategyFallbackRuleApi {
        return pigeonInstance.fallbackRule.api
    }
}

extension ResolutionStrategy.FallbackRule {
    var api: ResolutionStrategyFallbackRuleApi {
        return switch self {
        case .none: .none
        case .closestHigherThenLower: .closestHigherThenLower
        case .closestHigher: .closestHigher
        case .closestLowerThenHigher: .closestLowerThenHigher
        case .closestLower: .closestLower
        }
    }
}

extension ResolutionStrategyFallbackRuleApi {
    var delegate: ResolutionStrategy.FallbackRule {
        return switch self {
        case .none: .none
        case .closestHigherThenLower: .closestHigherThenLower
        case .closestHigher: .closestHigher
        case .closestLowerThenHigher: .closestLowerThenHigher
        case .closestLower: .closestLower
        }
    }
}
