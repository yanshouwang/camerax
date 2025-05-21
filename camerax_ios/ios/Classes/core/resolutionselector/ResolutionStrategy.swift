//
//  ResolutionStrategy.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/20.
//

import Foundation

public class ResolutionStrategy: NSObject {
    static let highestAvailableStrategy = ResolutionStrategy()
    
    public let boundSize: Size<Int>?
    public let fallbackRule: FallbackRule
    
    public override init() {
        self.boundSize = nil
        self.fallbackRule = .none
    }
    
    init(boundSize: Size<Int>, fallbackRule: FallbackRule) {
        self.boundSize = boundSize
        self.fallbackRule = fallbackRule
    }
    
    public enum FallbackRule {
        case none, closestHigherThenLower, closestHigher, closestLowerThenHigher, closestLower
    }
}
