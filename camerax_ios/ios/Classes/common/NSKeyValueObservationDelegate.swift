//
//  NSKeyValueObservationDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/19.
//

import Foundation

class NSKeyValueObservationDelegate: PigeonApiDelegateNSKeyValueObservationApi {
    func invalidate(pigeonApi: PigeonApiNSKeyValueObservationApi, pigeonInstance: NSKeyValueObservation) throws {
        pigeonInstance.invalidate()
    }
}
