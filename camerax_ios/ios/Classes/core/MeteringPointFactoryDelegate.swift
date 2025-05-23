//
//  MeteringPointFactoryDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

class MeteringPointFactoryDelegate: PigeonApiDelegateMeteringPointFactoryApi {
    func createPoint(pigeonApi: PigeonApiMeteringPointFactoryApi, pigeonInstance: any MeteringPointFactory, x: Double, y: Double, size: Double?) throws -> MeteringPoint {
        if let size = size { return pigeonInstance.createPoint(x, y, size) }
        return pigeonInstance.createPoint(x, y)
    }
}
