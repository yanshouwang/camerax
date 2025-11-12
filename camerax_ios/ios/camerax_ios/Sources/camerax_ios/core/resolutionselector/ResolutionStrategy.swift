//
//  ResolutionStrategy.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/20.
//

import Foundation

public class ResolutionStrategy: NSObject {
    public static let highestAvailableStrategy = ResolutionStrategy()
    
    public let boundSize: CGSize?
    public let fallbackRule: FallbackRule
    
    private override init() {
        self.boundSize = nil
        self.fallbackRule = .none
    }
    
    public init(boundSize: CGSize, fallbackRule: FallbackRule) {
        self.boundSize = boundSize
        self.fallbackRule = fallbackRule
    }
    
    public enum FallbackRule {
        case none, closestHigherThenLower, closestHigher, closestLowerThenHigher, closestLower
    }
}
