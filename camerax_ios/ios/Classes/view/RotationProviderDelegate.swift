//
//  RotationProviderDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/11/3.
//

import Foundation

class RotationProviderDelegate: PigeonApiDelegateRotationProviderApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiRotationProviderApi) throws -> RotationProvider {
        return RotationProvider()
    }
    
    func addListener(pigeonApi: PigeonApiRotationProviderApi, pigeonInstance: RotationProvider, listener: RotationProvider.Listener) throws -> Bool {
        return pigeonInstance.addListener(listener)
    }
    
    func removeListener(pigeonApi: PigeonApiRotationProviderApi, pigeonInstance: RotationProvider, listener: RotationProvider.Listener) throws {
        pigeonInstance.removeListener(listener)
    }
    
    class ListenerDelegate: PigeonApiDelegateRotationProviderListenerApi {
        func pigeonDefaultConstructor(pigeonApi: PigeonApiRotationProviderListenerApi) throws -> RotationProvider.Listener {
            return RotationProviderListener(pigeonApi)
        }
    }
}

class RotationProviderListener: NSObject, RotationProvider.Listener {
    private let api: PigeonApiRotationProviderListenerApi
    
    init(_ api: PigeonApiRotationProviderListenerApi) {
        self.api = api
    }
    
    func onRotationChanged(_ rotation: Int) {
        self.api.onRotationChanged(pigeonInstance: self, rotation: Int64(rotation)) { _ in }
    }
}
