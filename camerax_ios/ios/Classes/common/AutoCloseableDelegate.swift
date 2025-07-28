//
//  AutoCloseableDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

class AutoCloseableDelegate: PigeonApiDelegateAutoCloseableApi {
    func close(pigeonApi: PigeonApiAutoCloseableApi, pigeonInstance: any AutoCloseable) throws {
        pigeonInstance.close()
    }
}
