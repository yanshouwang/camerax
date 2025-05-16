//
//  OutputResults.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

public class OutputResults: NSObject {
    let outputUri: URL?
    
    init(outputUri: URL?) {
        self.outputUri = outputUri
    }
}
