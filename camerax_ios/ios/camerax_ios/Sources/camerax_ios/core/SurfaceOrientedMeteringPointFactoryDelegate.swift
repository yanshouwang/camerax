//
//  SurfaceOrientedMeteringPointFactoryDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

class SurfaceOrientedMeteringPointFactoryDelegate: PigeonApiDelegateSurfaceOrientedMeteringPointFactoryProxyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiSurfaceOrientedMeteringPointFactoryProxyApi, width: Double, height: Double) throws -> SurfaceOrientedMeteringPointFactory {
        return SurfaceOrientedMeteringPointFactory(width, height)
    }
}
