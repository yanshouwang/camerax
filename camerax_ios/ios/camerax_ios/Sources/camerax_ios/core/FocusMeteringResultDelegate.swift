//
//  FocusMeteringResultDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

class FocusMeteringResultDelegate: PigeonApiDelegateFocusMeteringResultProxyApi {
    func isFocusSuccessful(pigeonApi: PigeonApiFocusMeteringResultProxyApi, pigeonInstance: FocusMeteringResult) throws -> Bool {
        return pigeonInstance.isFocusSuccessful
    }
}
