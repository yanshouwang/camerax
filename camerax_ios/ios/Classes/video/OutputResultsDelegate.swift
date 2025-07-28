//
//  OutputResultsDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/19.
//

import Foundation

class OutputResultsDelegate: PigeonApiDelegateOutputResultsApi {
    func outputUri(pigeonApi: PigeonApiOutputResultsApi, pigeonInstance: OutputResults) throws -> String? {
        return pigeonInstance.outputUri?.absoluteString
    }
}
