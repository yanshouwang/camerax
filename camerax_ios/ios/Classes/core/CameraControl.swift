//
//  CameraControl.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation
import AVFoundation

public class CameraControl: NSObject {
    private let torchControl: TorchControl
    private let zoomControl: ZoomControl
    private let focusMeteringControl: FocusMeteringControl
    
    init(torchControl: TorchControl, zoomControl: ZoomControl, focusMeteringControl: FocusMeteringControl) {
        self.torchControl = torchControl
        self.zoomControl = zoomControl
        self.focusMeteringControl = focusMeteringControl
    }
    
    public func enableTorch(_ torch: Bool) throws {
        try self.torchControl.enableTorch(torch)
    }
    
    public func setZoomRatio(_ ratio: CGFloat) throws {
        try self.zoomControl.setZoomRatio(ratio)
    }
    
    public func setLinearZoom(_ linearZoom: CGFloat) throws {
        try self.zoomControl.setLinearZoom(linearZoom)
    }
    
    func startFocusAndMetering(_ devicePoint: CGPoint, _ continuous: Bool) throws {
        try self.focusMeteringControl.startFocusAndMetering(devicePoint, continuous)
    }
    
    public func startFocusAndMetering(_ action: FocusMeteringAction) throws -> FocusMeteringResult {
        try self.focusMeteringControl.startFocusAndMetering(action)
    }
    
    public func cancelFocusAndMeteriing() throws {
        try self.focusMeteringControl.cancelFocusAndMeteriing()
    }
}
