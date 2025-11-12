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
        return pigeonInstance.getScaleType().api
    }
    
    func setScaleType(pigeonApi: PigeonApiPreviewViewProxyApi, pigeonInstance: PreviewView, scaleType: PreviewViewScaleTypeApi) throws {
        pigeonInstance.setScaleType(scaleType.delegate)
    }
}

extension PreviewView.ScaleType {
    var api: PreviewViewScaleTypeApi {
        switch self {
        case .fillCenter:
            return .fillCenter
        case .fillEnd:
            return .fillEnd
        case .fillStart:
            return .fillStart
        case .fitCenter:
            return .fitCenter
        case .fitEnd:
            return .fitEnd
        case .fitStart:
            return .fitStart
        }
    }
}

extension PreviewViewScaleTypeApi {
    var delegate: PreviewView.ScaleType {
        switch self {
        case .fillCenter:
            return .fillCenter
        case .fillEnd:
            return .fillEnd
        case .fillStart:
            return .fillStart
        case .fitCenter:
            return .fitCenter
        case .fitEnd:
            return .fitEnd
        case .fitStart:
            return .fitStart
        }
    }
}
