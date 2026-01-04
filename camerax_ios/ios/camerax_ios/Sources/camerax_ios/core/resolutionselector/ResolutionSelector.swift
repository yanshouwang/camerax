//
//  ResolutionSelector.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/20.
//

import Foundation

public class ResolutionSelector: NSObject {
    public class Builder: NSObject {
        private var resolutionStrategy: ResolutionStrategy?
        
        func setResolutionStrategy(_ resolutionStrategy: ResolutionStrategy) -> Builder {
            self.resolutionStrategy = resolutionStrategy
            return self
        }
        
        func build() -> ResolutionSelector {
            return ResolutionSelector(resolutionStrategy: resolutionStrategy)
        }
    }
    
    public let resolutionStrategy: ResolutionStrategy?
    
    private init(resolutionStrategy: ResolutionStrategy?) {
        self.resolutionStrategy = resolutionStrategy
    }
}
