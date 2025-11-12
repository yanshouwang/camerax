//
//  ZoomControl.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/8/4.
//

import Foundation
import AVFoundation

class ZoomControl: NSObject {
    private let zoomState: LiveData<ZoomState>
    
    private var device: AVCaptureDevice?
    private var videoZoomFactorObservation: NSKeyValueObservation?
    
    override init() {
        self.zoomState = LiveData()
    }
    
    func addDevice(_ device: AVCaptureDevice) {
        self.device = device
        try? self.setZoomRatio(1.0)
        self.videoZoomFactorObservation = device.observe(\.videoZoomFactor, options: [.initial, .new]) { device, change in
            guard let videoZoomFactor = change.newValue else { return }
            let newValue = device.getZoomState(videoZoomFactor)
            debugPrint("videoZoomFactor: \(videoZoomFactor), \(newValue.zoomRatio)")
            self.zoomState.setValue(newValue)
        }
    }
    
    func removeDevice() {
        self.videoZoomFactorObservation?.invalidate()
        self.device = nil
    }
    
    private func retrieveDevice() throws -> AVCaptureDevice {
        guard let device = self.device else { throw CameraXError(code: "nil-error", message: "device is nil", details: nil) }
        return device
    }
    
    func getZoomState() -> LiveData<ZoomState> {
        return self.zoomState
    }
    
    public func setZoomRatio(_ ratio: CGFloat) throws {
        let device = try retrieveDevice()
        try device.lockForConfiguration()
        defer { device.unlockForConfiguration() }
        try device.setZoomRatio(ratio)
    }
    
    public func setLinearZoom(_ linearZoom: CGFloat) throws {
        let device = try retrieveDevice()
        try device.lockForConfiguration()
        defer { device.unlockForConfiguration() }
        let minZoomRatio = device.minZoomRatio
        let maxZoomRatio = device.maxZoomRatio
        let ratio = ZoomMath.getZoomRatioFromLinearZoom(linearZoom: linearZoom, minZoomRatio: minZoomRatio, maxZoomRatio: maxZoomRatio)
        try device.setZoomRatio(ratio)
    }
}

fileprivate extension AVCaptureDevice {
    var minZoomRatio: CGFloat {
        if #available(iOS 13.0, *), let firstSwitchOverVideoZoomFactor = self.virtualDeviceSwitchOverVideoZoomFactors.first {
            return self.minAvailableVideoZoomFactor / CGFloat(truncating: firstSwitchOverVideoZoomFactor)
        } else {
            return self.minAvailableVideoZoomFactor
        }
    }
    
    var maxZoomRatio: CGFloat {
        if #available(iOS 13.0, *), let firstSwitchOverVideoZoomFactor = self.virtualDeviceSwitchOverVideoZoomFactors.first, let lastSwitchOverVideoZoomFactor = self.virtualDeviceSwitchOverVideoZoomFactors.last {
            // 5x digital zoom factor
            return CGFloat(truncating: lastSwitchOverVideoZoomFactor) / CGFloat(truncating: firstSwitchOverVideoZoomFactor) * 5.0
        } else {
            return self.maxAvailableVideoZoomFactor
        }
    }
    
    func getZoomState(_ videoZoomFactor: CGFloat) -> ZoomState {
        let zoomRatio = getZoomRatio(videoZoomFactor);
        return ZoomState(minZoomRatio: minZoomRatio, maxZoomRatio: maxZoomRatio, zoomRatio: zoomRatio)
    }
    
    func getZoomRatio(_ videoZoomFactor: CGFloat) -> CGFloat {
        if #available(iOS 13.0, *), let firstSwitchOverVideoZoomFactor = self.virtualDeviceSwitchOverVideoZoomFactors.first {
            return videoZoomFactor / CGFloat(truncating: firstSwitchOverVideoZoomFactor)
        } else {
            return videoZoomFactor
        }
    }
    
    func setZoomRatio(_ ratio: CGFloat) throws {
        guard ratio >= self.minZoomRatio && ratio <= self.maxZoomRatio else { throw CameraXError(code: "argument-error", message: "ratio is out of range", details: nil) }
        if #available(iOS 13.0, *), let firstSwitchOverVideoZoomFactor = self.virtualDeviceSwitchOverVideoZoomFactors.first {
            self.videoZoomFactor = ratio * CGFloat(truncating: firstSwitchOverVideoZoomFactor)
        } else {
            self.videoZoomFactor = ratio
        }
    }
}
