//
//  MeteringPointFactoryDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

class MeteringPointFactoryDelegate: PigeonApiDelegateMeteringPointFactoryProxyApi {
    func getDefaultPointSize(pigeonApi: PigeonApiMeteringPointFactoryProxyApi) throws -> Double {
        return MeteringPointFactoryBase.getDefaultPointSize()
    }
    
    func createPoint1(pigeonApi: PigeonApiMeteringPointFactoryProxyApi, pigeonInstance: any MeteringPointFactory, x: Double, y: Double) throws -> MeteringPoint {
        return pigeonInstance.createPoint(x, y)
    }
    
    func createPoint2(pigeonApi: PigeonApiMeteringPointFactoryProxyApi, pigeonInstance: any MeteringPointFactory, x: Double, y: Double, size: Double) throws -> MeteringPoint {
        return pigeonInstance.createPoint(x, y, size)
    }
}
