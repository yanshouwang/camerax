//
//  FocusMeteringResultDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

class FocusMeteringResultDelegate: PigeonApiDelegateFocusMeteringResultApi {
    func isFocusSuccessful(pigeonApi: PigeonApiFocusMeteringResultApi, pigeonInstance: FocusMeteringResult) throws -> Bool {
        return pigeonInstance.isFocusSuccessful
    }
}
