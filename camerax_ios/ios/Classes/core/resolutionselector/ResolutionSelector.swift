//
//  ResolutionSelector.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/20.
//

import Foundation

public class ResolutionSelector: NSObject {
    public let resolutionStrategy: ResolutionStrategy?
    
    init(resolutionStrategy: ResolutionStrategy?) {
        self.resolutionStrategy = resolutionStrategy
    }
}
