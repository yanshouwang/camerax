//
//  TorchState.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/14.
//

import Foundation
import AVFoundation

public enum TorchState: Int {
    case off, on
}

extension Bool {
    var avTorchState: AVCaptureDevice.TorchMode {
        return self ? .on : .off
    }
    
    var cxTorchState: TorchState {
        return self ? .on : .off
    }
}
