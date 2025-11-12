//
//  RotationProviderDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/11/3.
//

import Foundation

class RotationProviderDelegate: PigeonApiDelegateRotationProviderProxyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiRotationProviderProxyApi) throws -> RotationProvider {
        return RotationProvider()
    }
    
    func addListener(pigeonApi: PigeonApiRotationProviderProxyApi, pigeonInstance: RotationProvider, listener: RotationProvider.Listener) throws -> Bool {
        return pigeonInstance.addListener(listener)
    }
    
    func removeListener(pigeonApi: PigeonApiRotationProviderProxyApi, pigeonInstance: RotationProvider, listener: RotationProvider.Listener) throws {
        pigeonInstance.removeListener(listener)
    }
    
    class ListenerDelegate: PigeonApiDelegateRotationProviderListenerProxyApi {
        func pigeonDefaultConstructor(pigeonApi: PigeonApiRotationProviderListenerProxyApi) throws -> RotationProvider.Listener {
            return ListenerImpl(pigeonApi)
        }
    }
    
    class ListenerImpl: NSObject, RotationProvider.Listener {
        private let api: PigeonApiRotationProviderListenerProxyApi
        
        init(_ api: PigeonApiRotationProviderListenerProxyApi) {
            self.api = api
        }
        
        func onRotationChanged(_ rotation: Surface.Rotation) {
            self.api.onRotationChanged(pigeonInstance: self, rotation: rotation.api) { _ in }
        }
    }
}
