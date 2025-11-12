//
//  OutputOptionsDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/23.
//

import Foundation
import CoreLocation

class OutputOptionsDelegate: PigeonApiDelegateOutputOptionsProxyApi {
    func getDurationLimitMillis(pigeonApi: PigeonApiOutputOptionsProxyApi, pigeonInstance: OutputOptions) throws -> Int64 {
        return pigeonInstance.durationLimitMillis
    }
    
    func getFileSizeLimit(pigeonApi: PigeonApiOutputOptionsProxyApi, pigeonInstance: OutputOptions) throws -> Int64 {
        return pigeonInstance.fileSizeLimit
    }
    
    func getLocation(pigeonApi: PigeonApiOutputOptionsProxyApi, pigeonInstance: OutputOptions) throws -> CLLocation? {
        return pigeonInstance.location
    }
}
