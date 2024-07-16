//
//  CameraController.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/12.
//

import Foundation
import AVFoundation
import Photos

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
    private var capturePhotoDelegates: [AVCapturePhotoCaptureDelegate]
    @objc public var imageCaptureFlashMode: FlashMode {
        get { capturePhotoSettings.flashMode.xValue }
        set { capturePhotoSettings.flashMode = newValue.avfValue }
    }
    
    @objc public override init() {
        session = AVCaptureSession()
        tapToFocusEnabled = true                            
        pinchToZoomEnabled = true
        capturePhotoOutput = AVCapturePhotoOutput()
        capturePhotoSettings = AVCapturePhotoSettings()
        capturePhotoDelegates = []
        super.init()
        session.sessionPreset = .photo
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
    
    func focusAndExposure(devicePoint: CGPoint) throws {
        guard let videoDeviceInput = self.videoDeviceInput else {
            return
        }
        let videoDevice = videoDeviceInput.device
        try videoDevice.lockForConfiguration()
        defer { videoDevice.unlockForConfiguration() }
        if videoDevice.isFocusPointOfInterestSupported {
            videoDevice.focusPointOfInterest = devicePoint
            if videoDevice.isFocusModeSupported(.continuousAutoFocus) {
                videoDevice.focusMode = .continuousAutoFocus
            } else if videoDevice.isFocusModeSupported(.autoFocus) {
                videoDevice.focusMode = .autoFocus
            }
        }
        if videoDevice.isExposurePointOfInterestSupported {
            videoDevice.exposurePointOfInterest = devicePoint
            if videoDevice.isExposureModeSupported(.continuousAutoExposure) {
                videoDevice.exposureMode = .continuousAutoExposure
            } else if videoDevice.isExposureModeSupported(.autoExpose) {
                videoDevice.exposureMode = .autoExpose
            }
        }
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
            throw CameraError.observationNil
        }
        observation.invalidate()
    }
    
    @objc public func setZoomRatio(_ zoomRatio: Double) throws {
        guard let videoDeviceInput = self.videoDeviceInput else {
            throw CameraError.videoDeviceInputNil
        }
        let videoDevice = videoDeviceInput.device
        try videoDevice.lockForConfiguration()
        defer { videoDevice.unlockForConfiguration() }
        videoDevice.videoZoomFactor = zoomRatio
    }
    
    @objc public func setLinearZoom(_ linearZoom: Double) throws {
        guard let videoDeviceInput = self.videoDeviceInput else {
            throw CameraError.videoDeviceInputNil
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
            throw CameraError.observationNil
        }
        observation.invalidate()
    }
    
    @objc public func enableTorch(_ torchEnabled: Bool) throws {
        guard let videoDeviceInput = self.videoDeviceInput else {
            throw CameraError.videoDeviceInputNil
        }
        let videoDevice = videoDeviceInput.device
        try videoDevice.lockForConfiguration()
        defer { videoDevice.unlockForConfiguration() }
        let torchMode = torchEnabled ? AVCaptureDevice.TorchMode.on : .off
        guard videoDevice.isTorchModeSupported(torchMode) else {
            throw CameraError.unsupported
        }
        videoDevice.torchMode = torchMode
    }
    
    @objc public func setImageAnalyzer(_ analyzer: @escaping (ImageProxy) -> Void) {
        
    }
    
    @objc public func clearImageAnalyzer() {
        
    }
    
    @objc public func takePictureToMemory(completionHandler handler: @escaping (Data?, (any Error)?) -> Void) {
        let settings = AVCapturePhotoSettings(from: capturePhotoSettings)
        let delegate = CameraCapturePhotoCaptureDelegate() { photo, error in
            if let error {
                handler(nil, error)
            } else if let data = photo.fileDataRepresentation() {
                handler(data, nil)
            } else {
                handler(nil, CameraError.saveDataNil)
            }
        }
        capturePhotoOutput.capturePhoto(with: settings, delegate: delegate)
    }
    
    @objc public func takePictureToAlbum(name: String?, completionHandler handler: @escaping (String?, (any Error)?) -> Void) {
        requestPhotoLibraryAuthorization() { [self] status in
            if status == .authorized {
                let settings = AVCapturePhotoSettings(from: capturePhotoSettings)
                //        let settings = capturePhotoOutput.availablePhotoCodecTypes.contains(.hevc) ? AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.hevc]) : AVCapturePhotoSettings()
                //        if let previewPhotoFormat = settings.availablePreviewPhotoPixelFormatTypes.first {
                //            settings.previewPhotoFormat = [kCVPixelBufferPixelFormatTypeKey as String: previewPhotoFormat]
                //        }
                //        if #available(iOS 16.0, *) {
                //            settings.maxPhotoDimensions = capturePhotoOutput.maxPhotoDimensions
                //        }
                //        settings.flashMode = capturePhotoSettings.flashMode
                //        if #available(iOS 13.0, *) {
                //            settings.photoQualityPrioritization = capturePhotoOutput.maxPhotoQualityPrioritization
                //        }
                let delegate = CameraCapturePhotoCaptureDelegate() { [self] photo, error in
                    if let error {
                        handler(nil, error)
                    } else {
                        savePhoto(photo, name: name, completionHandler: handler)
                    }
                }
                capturePhotoDelegates.append(delegate)
                capturePhotoOutput.capturePhoto(with: settings, delegate: delegate)
            } else {
                handler(nil, CameraError.unauthorized)
            }
        }
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
            throw CameraError.videoDeviceInputNil
        }
        guard session.canAddInput(videoDeviceInput) else {
            throw CameraError.cannotAddInput
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
            throw CameraError.cannotAddOutput
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
    
    private func onTorchStateChanged() {
        guard let videoDeviceInput = self.videoDeviceInput else {
            torchState = nil
            return
        }
        let videoDevice = videoDeviceInput.device
        torchState = TorchState(value: videoDevice.isTorchActive)
    }
    
    private func requestPhotoLibraryAuthorization(handler: @escaping (PHAuthorizationStatus) -> Void) {
        if #available(iOS 14, *) {
            let status = PHPhotoLibrary.authorizationStatus(for: .addOnly)
            if status == .notDetermined {
                PHPhotoLibrary.requestAuthorization(for: .addOnly) { status in handler(status) }
            } else {
                handler(status)
            }
        } else {
            let status = PHPhotoLibrary.authorizationStatus()
            if status == .notDetermined {
                PHPhotoLibrary.requestAuthorization() { status in handler(status) }
            } else {
                handler(status)
            }
        }
    }
    
    private func savePhoto(_ photo: AVCapturePhoto, name: String?, completionHandler handler: @escaping (String?, (any Error)?) -> Void) {
        if let data = photo.fileDataRepresentation() {
            var localIdentifiers = [String]()
            PHPhotoLibrary.shared().performChanges() {
                let creationRequest = PHAssetCreationRequest.forAsset()
                let options = PHAssetResourceCreationOptions()
                options.originalFilename = name
                creationRequest.addResource(with: .photo, data: data, options: options)
                guard let localIdentifier = creationRequest.placeholderForCreatedAsset?.localIdentifier else {
                    return
                }
                localIdentifiers.append(localIdentifier)
            } completionHandler: { success, error in
                if let error {
                    handler(nil, error)
                } else if let savedAsset = PHAsset.fetchAssets(withLocalIdentifiers: localIdentifiers, options: nil).firstObject {
                    savedAsset.requestContentEditingInput(with: nil) { input,_ in
                        if let input, let url = input.fullSizeImageURL {
                            debugPrint("saved url \(url.path)")
                            handler(url.path, nil)
                        } else {
                            handler(nil, CameraError.saveUrlNil)
                        }
                    }
                } else {
                    handler(nil, CameraError.saveAssetNil)
                }
            }
        } else {
            handler(nil, CameraError.saveDataNil)
        }
    }
}
