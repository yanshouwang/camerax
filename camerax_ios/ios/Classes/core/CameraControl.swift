//
//  CameraControl.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/22.
//

import Foundation

public protocol CameraControl: NSObjectProtocol {
    func enableTorch(_ torch: Bool) throws -> Void
    func setZoomRatio(_ ratio: CGFloat) throws -> Void
    func setLinearZoom(_ linearZoom: CGFloat) throws -> Void
    func startFocusAndMetering(_ action: FocusMeteringAction) throws -> FocusMeteringResult
    func cancelFocusAndMeteriing() throws -> Void
    func setExposureCompensationIndex(_ value: Int) throws -> Int
}
