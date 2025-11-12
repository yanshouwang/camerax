//
//  MeteringPointDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

class MeteringPointDelegate: PigeonApiDelegateMeteringPointProxyApi {
    func size(pigeonApi: PigeonApiMeteringPointProxyApi, pigeonInstance: MeteringPoint) throws -> Double {
        return pigeonInstance.size
    }
}
