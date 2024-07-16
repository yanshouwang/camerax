//
//  CameraXError.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/12.
//

import Foundation

enum CameraError: Error {
    case unsupported
    case unimplemented
    case unauthorized
    case videoDeviceInputNil
    case cannotAddInput
    case cannotAddOutput
    case observationNil
    case saveDataNil
    case saveUrlNil
    case saveAssetNil
}
