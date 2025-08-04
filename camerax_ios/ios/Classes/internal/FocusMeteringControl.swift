//
//  FocusMeteringControl.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/8/4.
//

import Foundation
import AVFoundation

class FocusMeteringControl: NSObject {
    private var device: AVCaptureDevice?
    
    func addDevice(_ device: AVCaptureDevice) {
        self.device = device
    }
    
    func removeDevice() {
        self.device = nil
    }
    
    private func retrieveDevice() throws -> AVCaptureDevice {
        guard let device = self.device else { throw CameraXError(code: "nil-error", message: "device is nil", details: nil) }
        return device
    }
    
    func startFocusAndMetering(_ devicePoint: CGPoint, _ continuous: Bool) throws {
        let device = try retrieveDevice()
        try device.lockForConfiguration()
        defer { device.unlockForConfiguration() }
        // AF
        let focusMode: AVCaptureDevice.FocusMode = continuous ? .continuousAutoFocus : .autoFocus
        if device.isFocusPointOfInterestSupported, device.isFocusModeSupported(focusMode) {
            device.focusPointOfInterest = devicePoint
            device.focusMode = focusMode
        }
        // AE
        let exposureMode: AVCaptureDevice.ExposureMode = continuous ? .continuousAutoExposure : .autoExpose
        if device.isExposurePointOfInterestSupported, device.isExposureModeSupported(exposureMode) {
            device.exposurePointOfInterest = devicePoint
            device.exposureMode = exposureMode
        }
        // AWB
        let whiteBalanceMode: AVCaptureDevice.WhiteBalanceMode = continuous ? .continuousAutoWhiteBalance : .autoWhiteBalance
        if device.isWhiteBalanceModeSupported(whiteBalanceMode) {
            device.whiteBalanceMode = whiteBalanceMode
        }
        device.isSubjectAreaChangeMonitoringEnabled = !continuous
    }
    
    public func startFocusAndMetering(_ action: FocusMeteringAction) throws -> FocusMeteringResult {
        let device = try retrieveDevice()
        try device.lockForConfiguration()
        defer { device.unlockForConfiguration() }
        // AF
        if let meteringPoint = action.meteringPointsAf.first {
            guard device.isFocusPointOfInterestSupported, let focusMode = device.highestAvailableAutoFocusMode else {
                throw CameraXError(code: "unsupported-error", message: "AF is not supported", details: nil)
            }
            device.focusPointOfInterest = meteringPoint.cgPoint
            device.focusMode = focusMode
        }
        // AE
        if let meteringPoint = action.meteringPointsAe.first {
            guard device.isExposurePointOfInterestSupported, let exposureMode = device.highestAvailableAutoExposureMode else {
                throw CameraXError(code: "unsupported-error", message: "AE is not supported", details: nil)
            }
            device.exposurePointOfInterest = meteringPoint.cgPoint
            device.exposureMode = exposureMode
        }
        // AWB
        if let _ = action.meteringPointsAwb.first {
            guard let whiteBalanceMode = device.highestAvailableAutoWhiteBalanceMode else {
                throw CameraXError(code: "unsupported-error", message: "AWB is not supported", details: nil)
            }
            device.whiteBalanceMode = whiteBalanceMode
        }
        device.isSubjectAreaChangeMonitoringEnabled = false
        return FocusMeteringResult(true)
    }
    
    public func cancelFocusAndMeteriing() throws {
        let device = try retrieveDevice()
        try device.lockForConfiguration()
        defer { device.unlockForConfiguration() }
        device.isSubjectAreaChangeMonitoringEnabled = true
    }
}

fileprivate extension AVCaptureDevice {
    var highestAvailableAutoFocusMode: AVCaptureDevice.FocusMode? {
        return if self.isFocusModeSupported(.continuousAutoFocus) { .continuousAutoFocus }
        else if self.isFocusModeSupported(.autoFocus) { .autoFocus }
        else { nil }
    }
    
    var highestAvailableAutoExposureMode: AVCaptureDevice.ExposureMode? {
        return if self.isExposureModeSupported(.continuousAutoExposure) { .continuousAutoExposure }
        else if self.isExposureModeSupported(.autoExpose) { .autoExpose }
        else { nil }
    }
    
    var highestAvailableAutoWhiteBalanceMode: AVCaptureDevice.WhiteBalanceMode? {
        return if self.isWhiteBalanceModeSupported(.continuousAutoWhiteBalance) { .continuousAutoWhiteBalance }
        else if self.isWhiteBalanceModeSupported(.autoWhiteBalance) { .autoWhiteBalance }
        else { nil }
    }
}
