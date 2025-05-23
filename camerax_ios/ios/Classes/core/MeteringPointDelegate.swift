//
//  MeteringPointDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

class MeteringPointDelegate: PigeonApiDelegateMeteringPointApi {
    func size(pigeonApi: PigeonApiMeteringPointApi, pigeonInstance: MeteringPoint) throws -> Double {
        return pigeonInstance.size
    }
}
