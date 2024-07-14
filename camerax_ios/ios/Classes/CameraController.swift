//
//  CameraController.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/12.
//

import Foundation
import AVFoundation

@objc public class CameraController: NSObject {
    let session: AVCaptureSession
    private var videoDeviceInput: AVCaptureDeviceInput?
    private var tapToFocusEnabled: Bool
    private var pinchToZoomEnabled: Bool
    @objc private dynamic var zoomState: ZoomState?
    private var minAvailableVideoZoomFactorObservation: NSKeyValueObservation?
    private var maxAvailableVideoZoomFactorObservation: NSKeyValueObservation?
    private var videoZoomFactorObservation: NSKeyValueObservation?
    private var zoomStateObservation: NSKeyValueObservation?
    @objc private dynamic var torchState: TorchState?
    private var isTorchActiveObservation: NSKeyValueObservation?
    private var torchStateObservation: NSKeyValueObservation?
    private let capturePhotoOutput: AVCapturePhotoOutput
    private let capturePhotoSettings: AVCapturePhotoSettings
    @objc public var imageCaptureFlashMode: FlashMode {
        get { capturePhotoSettings.flashMode.xValue }
        set { capturePhotoSettings.flashMode = newValue.avfValue }
    }
    
    @objc public override init() {
        session = AVCaptureSession()
        tapToFocusEnabled = false
        pinchToZoomEnabled = false
        capturePhotoOutput = AVCapturePhotoOutput()
        capturePhotoSettings = AVCapturePhotoSettings()
        super.init()
        try? addVideoDeviceInput(cameraSelector: .back)
        try? addCapturePhotoOutput()
    }
    
    @objc public func requestPermissions(enableAudio: Bool, completionHandler handler: @escaping (Bool) -> Void) {
        AVCaptureDevice.requestAccess(for: .video) { videoGranted in
            if enableAudio {
                AVCaptureDevice.requestAccess(for: .audio) { audioGranted in
                    handler(videoGranted && audioGranted)
                }
            } else {
                handler(videoGranted)
            }
        }
    }
    
    @objc public func bindToLifecycle() {
        session.startRunning()
    }
    
    @objc public func unbind() {
        session.stopRunning()
    }
    
    @objc public func hasCamera(cameraSelector: CameraSelector) -> Bool {
        guard let deviceType = getVideoDeviceType(cameraSelector: cameraSelector) else {
            return false
        }
        let position = cameraSelector.lensFacing.avfValue
        return AVCaptureDevice.default(deviceType, for: .video, position: position) != nil
    }
    
    @objc public func setCameraSelector(_ cameraSelector: CameraSelector) throws {
        session.beginConfiguration()
        defer { session.commitConfiguration() }
        removeVideoDeviceInput()
        try addVideoDeviceInput(cameraSelector: cameraSelector)
    }
    
    @objc public func isTapToFocusEnabled() -> Bool {
        return tapToFocusEnabled
    }
    
    @objc public func setTapToFocusEnabled(_ enabled: Bool) {
        tapToFocusEnabled = enabled
    }
    
    @objc public func isPinchToZoomEnabled() -> Bool {
        return pinchToZoomEnabled
    }
    
    @objc public func setPinchToZoomEnabled(_ enabled: Bool) {
        pinchToZoomEnabled = enabled
    }
    
    @objc public func getZoomState() -> ZoomState? {
        return zoomState
    }
    
    @objc public func addZoomStateObserver(callback: @escaping (ZoomState?) -> Void) {
        zoomStateObservation = observe(\.zoomState, options: .new) { _, change in
            guard let zoomState = change.newValue else {
                return
            }
            callback(zoomState)
        }
    }
    
    @objc public func removeZoomStateObserver() throws {
        guard let observation = zoomStateObservation else {
            throw CameraXError.observationNil
        }
        observation.invalidate()
    }
    
    @objc public func setZoomRatio(_ zoomRatio: Double) throws {
        guard let videoDeviceInput = self.videoDeviceInput else {
            throw CameraXError.videoDeviceInputNil
        }
        let videoDevice = videoDeviceInput.device
        try videoDevice.lockForConfiguration()
        defer { videoDevice.unlockForConfiguration() }
        videoDevice.videoZoomFactor = zoomRatio
    }
    
    @objc public func setLinearZoom(_ linearZoom: Double) throws {
        guard let videoDeviceInput = self.videoDeviceInput else {
            throw CameraXError.videoDeviceInputNil
        }
        let videoDevice = videoDeviceInput.device
        try videoDevice.lockForConfiguration()
        defer { videoDevice.unlockForConfiguration() }
        videoDevice.videoZoomFactor = videoDevice.minAvailableVideoZoomFactor + linearZoom * (videoDevice.maxAvailableVideoZoomFactor - videoDevice.minAvailableVideoZoomFactor)
    }
    
    @objc public func getTorchState() -> TorchState? {
        return torchState
    }
    
    @objc public func addTorchStateObserver(callback: @escaping (TorchState?) -> Void) {
        torchStateObservation = observe(\.torchState, options: .new) { _, change in
            guard let torchState = change.newValue else {
                return
            }
            callback(torchState)
        }
    }
    
    @objc public func removeTorchStateObserver() throws {
        guard let observation = torchStateObservation else {
            throw CameraXError.observationNil
        }
        observation.invalidate()
    }
    
    @objc public func enableTorch(_ torchEnabled: Bool) throws {
        guard let videoDeviceInput = self.videoDeviceInput else {
            throw CameraXError.videoDeviceInputNil
        }
        let videoDevice = videoDeviceInput.device
        try videoDevice.lockForConfiguration()
        defer { videoDevice.unlockForConfiguration() }
        let torchMode = torchEnabled ? AVCaptureDevice.TorchMode.on : .off
        guard videoDevice.isTorchModeSupported(torchMode) else {
            throw CameraXError.unsupported
        }
        videoDevice.torchMode = torchMode
    }
    
    @objc public func setImageAnalyzer(_ analyzer: @escaping (ImageProxy) -> Void) {
        
    }
    
    @objc public func clearImageAnalyzer() {
        
    }
    
    @objc public func takePictureToMemory(completionHandler handler: @escaping (Data?, (any Error)?) -> Void) {
        let settings = AVCapturePhotoSettings(from: capturePhotoSettings)
        let delegate = CapturePhotoToMemoryDelegate(completionHandler: handler)
        capturePhotoOutput.capturePhoto(with: settings, delegate: delegate)
    }
    
    @objc public func takePictureToAlbum(name: String?, completionHandler handler: @escaping (String?, (any Error)?) -> Void) {
        let settings = AVCapturePhotoSettings(from: capturePhotoSettings)
        let delegate = CapturePhotoToAlbumDelegate(name: name, completionHandler: handler)
        capturePhotoOutput.capturePhoto(with: settings, delegate: delegate)
    }
    
    private func removeVideoDeviceInput() {
        guard let videoDeviceInput = self.videoDeviceInput else {
            return
        }
        session.removeInput(videoDeviceInput)
        self.videoDeviceInput = nil
    }
    
    private func addVideoDeviceInput(cameraSelector: CameraSelector) throws {
        guard let deviceType = getVideoDeviceType(cameraSelector: cameraSelector),
              let videoDevice = AVCaptureDevice.default(deviceType, for: .video, position: cameraSelector.lensFacing.avfValue),
              let videoDeviceInput = try? AVCaptureDeviceInput.init(device: videoDevice) else {
            throw CameraXError.videoDeviceInputNil
        }
        guard session.canAddInput(videoDeviceInput) else {
            throw CameraXError.cannotAddInput
        }
        session.addInput(videoDeviceInput)
        self.videoDeviceInput = videoDeviceInput
        minAvailableVideoZoomFactorObservation = videoDevice.observe(\.minAvailableVideoZoomFactor, options: .new) { [self] _,_ in onZoomStateChanged() }
        maxAvailableVideoZoomFactorObservation = videoDevice.observe(\.maxAvailableVideoZoomFactor, options: .new) { [self] _,_ in onZoomStateChanged() }
        videoZoomFactorObservation = videoDevice.observe(\.videoZoomFactor, options: [.initial, .new]) { [self] _,_ in onZoomStateChanged() }
        isTorchActiveObservation = videoDevice.observe(\.isTorchActive, options: [.initial, .new]) { [self] _,_ in onTorchStateChanged() }
    }
    
    private func getVideoDeviceType(cameraSelector: CameraSelector) -> AVCaptureDevice.DeviceType? {
        switch cameraSelector.lensFacing {
        case .front:
            return .builtInWideAngleCamera
        case .back:
            if #available(iOS 13.0, *) { return .builtInTripleCamera }
            else { return .builtInDualCamera }
        case .external:
            if #available(iOS 17.0, *) { return .external }
            else { return nil }
        }
    }
    
    private func addCapturePhotoOutput() throws {
        guard session.canAddOutput(capturePhotoOutput) else {
            throw CameraXError.cannotAddOutput
        }
        session.addOutput(capturePhotoOutput)
    }
    
    private func onZoomStateChanged() {
        guard let videoDeviceInput = self.videoDeviceInput else {
            zoomState = nil
            return
        }
        let videoDevice = videoDeviceInput.device
        zoomState = ZoomState(minZoomRatio: videoDevice.minAvailableVideoZoomFactor, maxZoomRatio: videoDevice.maxAvailableVideoZoomFactor, zoomRatio: videoDevice.videoZoomFactor)
    }
    
    func onTorchStateChanged() {
        guard let videoDeviceInput = self.videoDeviceInput else {
            torchState = nil
            return
        }
        let videoDevice = videoDeviceInput.device
        torchState = TorchState(value: videoDevice.isTorchActive)
    }
}
