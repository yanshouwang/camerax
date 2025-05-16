//
//  PreviewViewImpl.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

class PreviewViewImpl: PigeonApiDelegatePreviewViewApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiPreviewViewApi) throws -> PreviewView {
        return PreviewView()
    }
    
    func getController(pigeonApi: PigeonApiPreviewViewApi, pigeonInstance: PreviewView) throws -> CameraController? {
        return pigeonInstance.controller
    }
    
    func setController(pigeonApi: PigeonApiPreviewViewApi, pigeonInstance: PreviewView, controller: CameraController?) throws {
        pigeonInstance.controller = controller
    }
    
    func getScaleType(pigeonApi: PigeonApiPreviewViewApi, pigeonInstance: PreviewView) throws -> ScaleTypeApi {
        return pigeonInstance.scaleType.api
    }
    
    func setScaleType(pigeonApi: PigeonApiPreviewViewApi, pigeonInstance: PreviewView, scaleType: ScaleTypeApi) throws {
        pigeonInstance.scaleType = scaleType.impl
    }
}

extension PreviewView.ScaleType {
    var api: ScaleTypeApi {
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

extension ScaleTypeApi {
    var impl: PreviewView.ScaleType {
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
