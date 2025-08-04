//
//  TorchControl.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/8/4.
//

import Foundation
import AVFoundation

class TorchControl: NSObject {
    private let torchState: LiveData<TorchState>
    
    private var device: AVCaptureDevice?
    private var isTorchActiveObservation: NSKeyValueObservation?
    
    override init() {
        self.torchState = LiveData()
    }
    
    func addDevice(_ device: AVCaptureDevice) {
        self.device = device
        self.isTorchActiveObservation = device.observe(\.isTorchActive, options: [.initial, .new]) { device, change in
            guard let newValue = change.newValue else { return }
            self.torchState.setValue(newValue.cxTorchState)
        }
    }
    
    func removeDevice() {
        self.isTorchActiveObservation?.invalidate()
        self.device = nil
    }
    
    private func retrieveDevice() throws -> AVCaptureDevice {
        guard let device = self.device else { throw CameraXError(code: "nil-error", message: "device is nil", details: nil) }
        return device
    }
    
    public func getTorchState() -> LiveData<TorchState> {
        return self.torchState
    }
    
    public func enableTorch(_ torch: Bool) throws {
        let device = try retrieveDevice()
        try device.lockForConfiguration()
        defer { device.unlockForConfiguration() }
        let torchMode = torch.avTorchState
        guard device.isTorchModeSupported(torchMode) else {
            throw CameraXError(code: "unsupported-error", message: "\(torchMode) is not supported", details: nil)
        }
        device.torchMode = torchMode
    }
}
