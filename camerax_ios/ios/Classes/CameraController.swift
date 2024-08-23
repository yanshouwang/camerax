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
    private var audioDeviceInput: AVCaptureDeviceInput?
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
    private var subjectAreaDidChangeObserver: Any?
    private let capturePhotoOutput: AVCapturePhotoOutput
    private let capturePhotoSettings: AVCapturePhotoSettings
    private var capturePhotoCaptureDelegate: AVCapturePhotoCaptureDelegate?
    @objc public var imageCaptureFlashMode: FlashMode {
        get { capturePhotoSettings.flashMode.ffiValue }
        set { capturePhotoSettings.flashMode = newValue.swiftValue }
    }
    private let captureMovieFileOutput: AVCaptureMovieFileOutput
    private var captureFileOutputRecordingDelegate: AVCaptureFileOutputRecordingDelegate?
    private let captureVideoDataOutput: AVCaptureVideoDataOutput
    private var captureVideoDataOutputSampleBufferDelegate: AVCaptureVideoDataOutputSampleBufferDelegate?
    private let captureVideoDataOutputQueue: DispatchQueue
    private let rotationProvider: RotationProvider
    private var rotation: Int
    
    lazy var rotationListener = RotationListener() { rotation in
        if rotation == self.rotation {
            return
        }
        self.rotation = rotation
    }
    
    @objc public override init() {
        session = AVCaptureSession()
        tapToFocusEnabled = true
        pinchToZoomEnabled = true
        capturePhotoOutput = AVCapturePhotoOutput()
        capturePhotoSettings = AVCapturePhotoSettings()
        captureMovieFileOutput = AVCaptureMovieFileOutput()
        captureVideoDataOutput = AVCaptureVideoDataOutput()
        captureVideoDataOutputQueue = DispatchQueue(label: "dev.hebei.camerax.CaptureVideoDataOutputQueue")
        rotationProvider = RotationProvider()
        rotation = 0
        super.init()
        try? addVideoDeviceInput(cameraSelector: .back)
        try? addAudioDeviceInput()
        try? addCapturePhotoOutput()
        try? addCaptureMovieFileOutput()
        try? addCaptureVideoDataOutput()
        session.sessionPreset = .high
        captureVideoDataOutput.alwaysDiscardsLateVideoFrames = true
        let videoDataOutputFormatKey = kCVPixelBufferPixelFormatTypeKey as String
        let videoDataOutputFormatValue = Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)
        captureVideoDataOutput.videoSettings = [videoDataOutputFormatKey: videoDataOutputFormatValue]
    }
    
    @objc public func checkAuthorization(type: AuthorizationType) -> Bool {
        switch type {
        case .video:
            return AVCaptureDevice.authorizationStatus(for: .video) == .authorized
        case .audio:
            return AVCaptureDevice.authorizationStatus(for: .audio) == .authorized
        case .album:
            if #available(iOS 14, *) {
                return PHPhotoLibrary.authorizationStatus(for: .readWrite) == .authorized
            } else {
                return PHPhotoLibrary.authorizationStatus() == .authorized
            }
        }
    }
    
    @objc public func requestAuthorization(type: AuthorizationType, completionHandler handler: @escaping (Bool) -> Void) {
        switch type {
        case .video:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: handler)
        case .audio:
            AVCaptureDevice.requestAccess(for: .audio, completionHandler: handler)
        case .album:
            if #available(iOS 14, *) {
                PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in handler(status == .authorized || status == .limited) }
            } else {
                PHPhotoLibrary.requestAuthorization() { status in handler(status == .authorized) }
            }
        }
    }
    
    @objc public func bind() {
        session.startRunning()
        rotationProvider.addListener(rotationListener)
    }
    
    @objc public func unbind() {
        session.stopRunning()
        rotationProvider.removeListener(rotationListener)
    }
    
    @objc public func hasCamera(cameraSelector: CameraSelector) -> Bool {
        if let videoDeviceType = getVideoDeviceType(cameraSelector: cameraSelector),
           let _ = AVCaptureDevice.default(videoDeviceType, for: .video, position: cameraSelector.lensFacing.swiftValue) {
            return true
        } else {
            return false
        }
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
            throw CameraError.observationNil
        }
        observation.invalidate()
    }
    
    @objc public func setZoomRatio(_ zoomRatio: Double) throws {
        guard let videoDeviceInput = self.videoDeviceInput else {
            throw CameraError.deviceNil
        }
        let videoDevice = videoDeviceInput.device
        try videoDevice.lockForConfiguration()
        defer { videoDevice.unlockForConfiguration() }
        videoDevice.zoomRatio = zoomRatio
    }
    
    @objc public func setLinearZoom(_ linearZoom: Double) throws {
        guard let videoDeviceInput = self.videoDeviceInput else {
            throw CameraError.deviceNil
        }
        let videoDevice = videoDeviceInput.device
        try videoDevice.lockForConfiguration()
        defer { videoDevice.unlockForConfiguration() }
        videoDevice.zoomRatio = videoDevice.minZoomRatio + linearZoom * (videoDevice.maxZoomRatio - videoDevice.minZoomRatio)
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
    
    @objc public func enableTorch(_ enabled: Bool) throws {
        guard let videoDeviceInput = self.videoDeviceInput else {
            throw CameraError.deviceNil
        }
        let videoDevice = videoDeviceInput.device
        try videoDevice.lockForConfiguration()
        defer { videoDevice.unlockForConfiguration() }
        let torchMode = enabled ? AVCaptureDevice.TorchMode.on : .off
        guard videoDevice.isTorchModeSupported(torchMode) else {
            throw CameraError.unsupported
        }
        videoDevice.torchMode = torchMode
    }
    
    @objc public func takePicture(url: URL, completionHandler handler: @escaping ((any Error)?) -> Void) {
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
        let delegate = CapturePhotoCaptureDelegate(url: url, completionHandler: handler)
        capturePhotoCaptureDelegate = delegate
        capturePhotoOutput.capturePhoto(with: settings, delegate: delegate)
    }
    
    @objc public func isRecording() -> Bool {
        return captureMovieFileOutput.isRecording
    }
    
    @objc public func startRecording(url: URL, enableAudio: Bool, listener: @escaping (VideoRecordEvent) -> Void) -> Recording {
        if let audioConnection = captureMovieFileOutput.connection(with: .audio) {
            audioConnection.isEnabled = enableAudio
        }
        let delegate = CaptureFileOutputRecordingDelegate(listener: listener)
        captureFileOutputRecordingDelegate = delegate
        captureMovieFileOutput.startRecording(to: url, recordingDelegate: delegate)
        return Recording(output: captureMovieFileOutput)
    }
    
    @objc public func getImageAnalysisOutputImageFormat() -> ImageFormat {
        let key = kCVPixelBufferPixelFormatTypeKey as String
        guard let outputImageFormat = captureVideoDataOutput.videoSettings[key] as? Int else {
            return .yuv_420_888
        }
        return outputImageFormat.ffiImageFormat
    }
    
    @objc public func setImageAnalysisOutputImageFormat(_ outputImageFormat: ImageFormat) {
        let key = kCVPixelBufferPixelFormatTypeKey as String
        captureVideoDataOutput.videoSettings = [key: outputImageFormat.swiftValue]
    }
    
    @objc public func setImageAnalysisAnalyzer(_ analyzer: Analyzer) {
        let delegate = CaptureVideoDataOutputSampleBufferDelegate(analyzer: analyzer) { return self.rotation }
        captureVideoDataOutputSampleBufferDelegate = delegate
        captureVideoDataOutput.setSampleBufferDelegate(delegate, queue: captureVideoDataOutputQueue)
    }
    
    @objc public func clearImageAnalysisAnalyzer() {
        captureVideoDataOutput.setSampleBufferDelegate(nil, queue: captureVideoDataOutputQueue)
    }
    
    private func removeVideoDeviceInput() {
        guard let videoDeviceInput = self.videoDeviceInput else {
            return
        }
        session.removeInput(videoDeviceInput)
        self.videoDeviceInput = nil
    }
    
    private func addVideoDeviceInput(cameraSelector: CameraSelector) throws {
        guard let videoDeviceType = getVideoDeviceType(cameraSelector: cameraSelector),
              let videoDevice = AVCaptureDevice.default(videoDeviceType, for: .video, position: cameraSelector.lensFacing.swiftValue),
              let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice),
              session.canAddInput(videoDeviceInput) else {
            throw CameraError.deviceNil
        }
        guard session.canAddInput(videoDeviceInput) else {
            throw CameraError.cannotAddInput
        }
        session.addInput(videoDeviceInput)
        self.videoDeviceInput = videoDeviceInput
        try? setZoomRatio(1.0)
        minAvailableVideoZoomFactorObservation = videoDevice.observe(\.minAvailableVideoZoomFactor, options: .new) { [self] _,_ in onZoomStateChanged() }
        maxAvailableVideoZoomFactorObservation = videoDevice.observe(\.maxAvailableVideoZoomFactor, options: .new) { [self] _,_ in onZoomStateChanged() }
        videoZoomFactorObservation = videoDevice.observe(\.videoZoomFactor, options: [.initial, .new]) { [self] _,_ in onZoomStateChanged() }
        isTorchActiveObservation = videoDevice.observe(\.isTorchActive, options: [.initial, .new]) { [self] _,_ in onTorchStateChanged() }
        if let subjectAreaDidChangeObserver {
            NotificationCenter.default.removeObserver(subjectAreaDidChangeObserver)
        }
        subjectAreaDidChangeObserver = NotificationCenter.default.addObserver(forName: .AVCaptureDeviceSubjectAreaDidChange, object: videoDevice, queue: .current) { [self] _ in
            let devicePoint = CGPoint(x: 0.5, y: 0.5)
            try? focusAndExpose(devicePoint: devicePoint, continuous: true)
        }
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
    
    func addAudioDeviceInput() throws {
        guard let audioDevice = AVCaptureDevice.default(for: .audio),
              let audioDeviceInput = try? AVCaptureDeviceInput(device: audioDevice) else {
            throw CameraError.deviceNil
        }
        guard session.canAddInput(audioDeviceInput) else {
            throw CameraError.cannotAddInput
        }
        session.addInput(audioDeviceInput)
        self.audioDeviceInput = audioDeviceInput
    }
    
    func focusAndExpose(devicePoint: CGPoint, continuous: Bool) throws {
        guard let videoDeviceInput = self.videoDeviceInput else {
            return
        }
        let videoDevice = videoDeviceInput.device
        try videoDevice.lockForConfiguration()
        defer { videoDevice.unlockForConfiguration() }
        let focusMode = continuous ? AVCaptureDevice.FocusMode.continuousAutoFocus : .autoFocus
        if videoDevice.isFocusPointOfInterestSupported && videoDevice.isFocusModeSupported(focusMode) {
            videoDevice.focusPointOfInterest = devicePoint
            videoDevice.focusMode = focusMode
        }
        let exposureMode = continuous ? AVCaptureDevice.ExposureMode.continuousAutoExposure : .autoExpose
        if videoDevice.isExposurePointOfInterestSupported && videoDevice.isExposureModeSupported(exposureMode) {
            videoDevice.exposurePointOfInterest = devicePoint
            videoDevice.exposureMode = exposureMode
        }
        videoDevice.isSubjectAreaChangeMonitoringEnabled = !continuous
    }
    
    private func addCapturePhotoOutput() throws {
        guard session.canAddOutput(capturePhotoOutput) else {
            throw CameraError.cannotAddOutput
        }
        session.addOutput(capturePhotoOutput)
    }
    
    private func addCaptureMovieFileOutput() throws {
        guard session.canAddOutput(captureMovieFileOutput) else {
            throw CameraError.cannotAddOutput
        }
        session.addOutput(captureMovieFileOutput)
    }
    
    func addCaptureVideoDataOutput() throws {
        guard session.canAddOutput(captureVideoDataOutput) else {
            throw CameraError.cannotAddOutput
        }
        session.addOutput(captureVideoDataOutput)
    }
    
    private func onZoomStateChanged() {
        guard let videoDeviceInput = self.videoDeviceInput else {
            zoomState = nil
            return
        }
        let videoDevice = videoDeviceInput.device
        zoomState = videoDevice.zoomState
    }
    
    private func onTorchStateChanged() {
        guard let videoDeviceInput = self.videoDeviceInput else {
            torchState = nil
            return
        }
        let videoDevice = videoDeviceInput.device
        torchState = TorchState(value: videoDevice.isTorchActive)
    }
}

extension AVCaptureDevice {
    var minZoomRatio: Double {
        if #available(iOS 13.0, *), let factor = virtualDeviceSwitchOverVideoZoomFactors.first {
            return minAvailableVideoZoomFactor / factor.doubleValue
        } else {
            return minAvailableVideoZoomFactor
        }
    }
    
    var maxZoomRatio: Double {
        if #available(iOS 13.0, *),
           let minX = virtualDeviceSwitchOverVideoZoomFactors.first,
           let maxX = virtualDeviceSwitchOverVideoZoomFactors.last {
            // 5x digital zoom factor
            return min(maxAvailableVideoZoomFactor / minX.doubleValue, maxX.doubleValue / minX.doubleValue * 5.0)
        } else {
            return min(maxAvailableVideoZoomFactor, 10.0)
        }
    }
    
    var zoomRatio: Double {
        get {
            if #available(iOS 13.0, *), let factor = virtualDeviceSwitchOverVideoZoomFactors.first {
                return videoZoomFactor / factor.doubleValue
            } else {
                return videoZoomFactor
            }
        }
        set {
            if newValue < minZoomRatio || newValue > maxZoomRatio {
                return
            }
            if #available(iOS 13.0, *), let factor = virtualDeviceSwitchOverVideoZoomFactors.first {
                videoZoomFactor = newValue * factor.doubleValue
            } else {
                videoZoomFactor = newValue
            }
        }
    }
    
    var zoomState: ZoomState {
        return ZoomState(minZoomRatio: minZoomRatio, maxZoomRatio: maxZoomRatio, zoomRatio: zoomRatio)
    }
}
