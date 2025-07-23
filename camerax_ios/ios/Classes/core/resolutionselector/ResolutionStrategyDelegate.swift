//
//  ResolutionStrategyDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/20.
//

import Foundation

class ResolutionStrategyDelegate: PigeonApiDelegateResolutionStrategyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiResolutionStrategyApi, boundSize: Size?, fallbackRule: ResolutionFallbackRuleApi) throws -> ResolutionStrategy {
        guard let boundSize = boundSize else { return ResolutionStrategy.highestAvailableStrategy }
        return ResolutionStrategy(boundSize: boundSize.cgSize, fallbackRule: fallbackRule.delegate)
    }
    
    func boundSize(pigeonApi: PigeonApiResolutionStrategyApi, pigeonInstance: ResolutionStrategy) throws -> Size? {
        return pigeonInstance.boundSize?.cxSize
    }
    
    func fallbackRule(pigeonApi: PigeonApiResolutionStrategyApi, pigeonInstance: ResolutionStrategy) throws -> ResolutionFallbackRuleApi {
        return pigeonInstance.fallbackRule.api
    }
}

extension ResolutionStrategy.FallbackRule {
    var api: ResolutionFallbackRuleApi {
        switch self {
        case .none:
            return .none
        case .closestHigherThenLower:
            return .closestHigherThenLower
        case .closestHigher:
            return .closestHigher
        case .closestLowerThenHigher:
            return .closestLowerThenHigher
        case .closestLower:
            return .closestLower
        }
    }
}

extension ResolutionFallbackRuleApi {
    var delegate: ResolutionStrategy.FallbackRule {
        switch self {
        case .none:
            return .none
        case .closestHigherThenLower:
            return .closestHigherThenLower
        case .closestHigher:
            return .closestHigher
        case .closestLowerThenHigher:
            return .closestLowerThenHigher
        case .closestLower:
            return .closestLower
        }
    }
}
