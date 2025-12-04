//
//  PreviewViewDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

class PreviewViewDelegate: PigeonApiDelegatePreviewViewProxyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiPreviewViewProxyApi) throws -> PreviewView {
        return PreviewView()
    }
    
    func getController(pigeonApi: PigeonApiPreviewViewProxyApi, pigeonInstance: PreviewView) throws -> CameraController? {
        return pigeonInstance.getController()
    }
    
    func setController(pigeonApi: PigeonApiPreviewViewProxyApi, pigeonInstance: PreviewView, controller: CameraController?) throws {
        pigeonInstance.setController(controller)
    }
    
    func getScaleType(pigeonApi: PigeonApiPreviewViewProxyApi, pigeonInstance: PreviewView) throws -> PreviewViewScaleTypeApi {
        return try pigeonInstance.getScaleType().api
    }
    
    func setScaleType(pigeonApi: PigeonApiPreviewViewProxyApi, pigeonInstance: PreviewView, scaleType: PreviewViewScaleTypeApi) throws {
        try pigeonInstance.setScaleType(scaleType.delegate)
    }
}

extension PreviewView.ScaleType {
    var api: PreviewViewScaleTypeApi {
        return switch self {
        case .fillCenter: .fillCenter
        case .fillEnd: .fillEnd
        case .fillStart: .fillStart
        case .fitCenter: .fitCenter
        case .fitEnd: .fitEnd
        case .fitStart: .fitStart
        }
    }
}

extension PreviewViewScaleTypeApi {
    var delegate: PreviewView.ScaleType {
        return switch self {
        case .fillCenter: .fillCenter
        case .fillEnd: .fillEnd
        case .fillStart: .fillStart
        case .fitCenter: .fitCenter
        case .fitEnd: .fitEnd
        case .fitStart: .fitStart
        }
    }
}
