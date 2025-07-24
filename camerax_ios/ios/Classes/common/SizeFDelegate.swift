//
//  SizeFDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation

class SizeFDelegate: PigeonApiDelegateSizeFApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiSizeFApi, width: Double, height: Double) throws -> SizeF {
        return SizeF(width: width, height: height)
    }
    
    func width(pigeonApi: PigeonApiSizeFApi, pigeonInstance: SizeF) throws -> Double {
        return pigeonInstance.width
    }
    
    func height(pigeonApi: PigeonApiSizeFApi, pigeonInstance: SizeF) throws -> Double {
        return pigeonInstance.height
    }
    
}
