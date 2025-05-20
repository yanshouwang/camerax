//
//  CameraController.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/12.
//

import Foundation
import AVFoundation

public class CameraController: NSObject {
    public var isTapToFocusEnabled: Bool
    public var isPinchToZoomEnabled: Bool
    @objc public dynamic var zoomState: ZoomState?
    @objc public dynamic var torchState: TorchState?
    public var imageCaptureFlashMode: ImageCapture.FlashMode {
        get { capturePhotoSettings.flashMode.api }
        set { capturePhotoSettings.flashMode = newValue.impl }
    }
    var imageAnalysisOutputImageFormat: ImageFormat {
        get {
            let key = kCVPixelBufferPixelFormatTypeKey as String
            guard let outputImageFormat = captureVideoDataOutput.videoSettings[key] as? Int else {
                return .yuv420888
            }
            return outputImageFormat.imageFormatApi
        }
        set {
            captureVideoDataOutput.videoSettings[kCVPixelBufferPixelFormatTypeKey as String] = newValue.impl
        }
    }
    
    internal let session: AVCaptureSession
    
    private var cameraSelector: CameraSelector
    private var videoDeviceInput: AVCaptureDeviceInput?
    private var audioDeviceInput: AVCaptureDeviceInput?
    private var videoZoomFactorObservation: NSKeyValueObservation?
    private var isTorchActiveObservation: NSKeyValueObservation?
    private var subjectAreaDidChangeObserver: Any?
    private let capturePhotoOutput: AVCapturePhotoOutput
    private let capturePhotoSettings: AVCapturePhotoSettings
    private var capturePhotoCaptureDelegate: AVCapturePhotoCaptureDelegate?
    private let captureMovieFileOutput: AVCaptureMovieFileOutput
    private var captureFileOutputRecordingDelegate: AVCaptureFileOutputRecordingDelegate?
    private let captureVideoDataOutput: AVCaptureVideoDataOutput
    private var captureVideoDataOutputSampleBufferDelegate: AVCaptureVideoDataOutputSampleBufferDelegate?
    private let captureVideoDataOutputQueue: DispatchQueue
    private let rotationProvider: RotationProvider
    private var rotation: Int
    
    private lazy var rotationListener = RotationProvider.Listener() { rotation in
        if rotation == self.rotation {
            return
        }
        self.rotation = rotation
    }
    
    public override init() {
        cameraSelector = .back
        isTapToFocusEnabled = true
        isPinchToZoomEnabled = true
        session = AVCaptureSession()
        capturePhotoOutput = AVCapturePhotoOutput()
        capturePhotoSettings = AVCapturePhotoSettings()
        captureMovieFileOutput = AVCaptureMovieFileOutput()
        captureVideoDataOutput = AVCaptureVideoDataOutput()
        captureVideoDataOutputQueue = DispatchQueue(label: "dev.hebei.camerax.CaptureVideoDataOutputQueue")
        rotationProvider = RotationProvider()
        rotation = 0
        super.init()
        
        try? addVideoDeviceInput()
        try? addAudioDeviceInput()
        try? addCapturePhotoOutput()
        try? addCaptureMovieFileOutput()
        try? addCaptureVideoDataOutput()
        
        session.sessionPreset = .high
        captureVideoDataOutput.alwaysDiscardsLateVideoFrames = true
        captureVideoDataOutput.videoSettings[kCVPixelBufferPixelFormatTypeKey as String] = Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)
    }
    
    public func bind() {
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
        }
        rotationProvider.addListener(rotationListener)
    }
    
    public func unbind() {
        session.stopRunning()
        rotationProvider.removeListener(rotationListener)
    }
    
    public func hasCamera(cameraSelector: CameraSelector) -> Bool {
        if let device = getVideoDevice(cameraSelector) {
            return true
        } else {
            return false
        }
    }
    
    public func getCameraSelector() -> CameraSelector {
        return cameraSelector
    }
    
    public func setCameraSelector(_ cameraSelector: CameraSelector) throws {
        self.cameraSelector = cameraSelector
        session.beginConfiguration()
        defer { session.commitConfiguration() }
        removeVideoDeviceInput()
        try addVideoDeviceInput()
    }
    
    public func setZoomRatio(_ zoomRatio: Double) throws {
        guard let input = self.videoDeviceInput else {
            throw CameraXError(code: "nil-error", message: "videoDeviceInput is nil", details: nil)
        }
        let device = input.device
        try device.lockForConfiguration()
        defer { device.unlockForConfiguration() }
        device.zoomRatio = zoomRatio
    }
    
    public func setLinearZoom(_ linearZoom: Double) throws {
        guard let input = self.videoDeviceInput else {
            throw CameraXError(code: "nil-error", message: "videoDeviceInput is nil", details: nil)
        }
        let device = input.device
        try device.lockForConfiguration()
        defer { device.unlockForConfiguration() }
        let minZoomRatio = device.minZoomRatio
        let maxZoomRatio = device.maxZoomRatio
        let zoomRatio = ZoomMath.getZoomRatioFromLinearZoom(linearZoom: linearZoom, minZoomRatio: minZoomRatio, maxZoomRatio: maxZoomRatio)
        device.zoomRatio = zoomRatio
    }
    
    public func enableTorch(_ torchEnabled: Bool) throws {
        guard let input = self.videoDeviceInput else {
            throw CameraXError(code: "nil-error", message: "videoDeviceInput is nil", details: nil)
        }
        let device = input.device
        try device.lockForConfiguration()
        defer { device.unlockForConfiguration() }
        let torchMode = torchEnabled ? AVCaptureDevice.TorchMode.on : .off
        guard device.isTorchModeSupported(torchMode) else {
            throw CameraXError(code: "unsupported-error", message: "\(torchMode) is unsupported", details: nil)
        }
        device.torchMode = torchMode
    }
    
    public func takePicture(url: URL, completionHandler handler: @escaping ((any Error)?) -> Void) {
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
    
    public func isRecording() -> Bool {
        return captureMovieFileOutput.isRecording
    }
    
    public func startRecording(url: URL, enableAudio: Bool, listener: @escaping (VideoRecordEvent) -> Void) {
        if let audioConnection = captureMovieFileOutput.connection(with: .audio) {
            audioConnection.isEnabled = enableAudio
        }
        let delegate = CaptureFileOutputRecordingDelegate(listener: listener)
        captureFileOutputRecordingDelegate = delegate
        captureMovieFileOutput.startRecording(to: url, recordingDelegate: delegate)
    }
    
    public func stopRecording() {
        captureMovieFileOutput.stopRecording()
    }
    
    public func setImageAnalysisAnalyzer(_ analyzer: ImageAnalysis.Analyzer) {
        let delegate = CaptureVideoDataOutputSampleBufferDelegate(analyzer: analyzer) { return self.rotation }
        captureVideoDataOutputSampleBufferDelegate = delegate
        captureVideoDataOutput.setSampleBufferDelegate(delegate, queue: captureVideoDataOutputQueue)
    }
    
    public func clearImageAnalysisAnalyzer() {
        captureVideoDataOutput.setSampleBufferDelegate(nil, queue: captureVideoDataOutputQueue)
    }
    
    private func getVideoDevice(_ cameraSelector: CameraSelector) -> AVCaptureDevice? {
        guard let deviceType = getVideoDeviceType(cameraSelector) else { return nil }
        let position = cameraSelector.lensFacing.impl
        return AVCaptureDevice.default(deviceType, for: .video, position: position)
    }
    
    private func getVideoDeviceType(_ cameraSelector: CameraSelector) -> AVCaptureDevice.DeviceType? {
        switch cameraSelector.lensFacing {
        case .unknown:
            return nil
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
    
    private func removeVideoDeviceInput() {
        guard let input = self.videoDeviceInput else {
            return
        }
        videoZoomFactorObservation?.invalidate()
        isTorchActiveObservation?.invalidate()
        session.removeInput(input)
        self.videoDeviceInput = nil
    }
    
    private func addVideoDeviceInput() throws {
        guard let device = getVideoDevice(cameraSelector),
              let input = try? AVCaptureDeviceInput(device: device),
              session.canAddInput(input) else {
            throw CameraXError(code: "nil-error", message: "video device input is nil", details: nil)
        }
        guard session.canAddInput(input) else {
            throw CameraXError(code: "add-input-error", message: "Can not add input", details: nil)
        }
        session.addInput(input)
        self.videoDeviceInput = input
        try? setZoomRatio(1.0)
        videoZoomFactorObservation = device.observe(\.videoZoomFactor, options: [.initial, .new]) { [self] device, change in
            guard let videoZoomFactor = change.newValue else { return }
            zoomState = device.zoomState
        }
        isTorchActiveObservation = device.observe(\.isTorchActive, options: [.initial, .new]) { [self] _, change in
            guard let isTorchActive = change.newValue else { return }
            torchState = TorchState(isTorchActive)
        }
        if let subjectAreaDidChangeObserver {
            NotificationCenter.default.removeObserver(subjectAreaDidChangeObserver)
        }
        subjectAreaDidChangeObserver = NotificationCenter.default.addObserver(forName: .AVCaptureDeviceSubjectAreaDidChange, object: device, queue: .current) { [self] _ in
            let devicePoint = CGPoint(x: 0.5, y: 0.5)
            try? focusAndExpose(devicePoint: devicePoint, continuous: true)
        }
    }
    
    func getAudioDevice() -> AVCaptureDevice? {
        return AVCaptureDevice.default(for: .audio)
    }
    
    private func addAudioDeviceInput() throws {
        guard let device = AVCaptureDevice.default(for: .audio),
              let input = try? AVCaptureDeviceInput(device: device) else {
            throw CameraXError(code: "nil-error", message: "videoDeviceInput is nil", details: nil)
        }
        guard session.canAddInput(input) else {
            throw CameraXError(code: "add-input-error", message: "Can not add input", details: nil)
        }
        session.addInput(input)
        self.audioDeviceInput = input
    }
    
    internal func focusAndExpose(devicePoint: CGPoint, continuous: Bool) throws {
        guard let input = self.videoDeviceInput else {
            return
        }
        let device = input.device
        try device.lockForConfiguration()
        defer { device.unlockForConfiguration() }
        let focusMode = continuous ? AVCaptureDevice.FocusMode.continuousAutoFocus : .autoFocus
        if device.isFocusPointOfInterestSupported && device.isFocusModeSupported(focusMode) {
            device.focusPointOfInterest = devicePoint
            device.focusMode = focusMode
        }
        let exposureMode = continuous ? AVCaptureDevice.ExposureMode.continuousAutoExposure : .autoExpose
        if device.isExposurePointOfInterestSupported && device.isExposureModeSupported(exposureMode) {
            device.exposurePointOfInterest = devicePoint
            device.exposureMode = exposureMode
        }
        device.isSubjectAreaChangeMonitoringEnabled = !continuous
    }
    
    private func addCapturePhotoOutput() throws {
        guard session.canAddOutput(capturePhotoOutput) else {
            throw CameraXError(code: "add-output-error", message: "Can not add output", details: nil)
        }
        session.addOutput(capturePhotoOutput)
    }
    
    private func addCaptureMovieFileOutput() throws {
        guard session.canAddOutput(captureMovieFileOutput) else {
            throw CameraXError(code: "add-output-error", message: "Can not add output", details: nil)
        }
        session.addOutput(captureMovieFileOutput)
    }
    
    func addCaptureVideoDataOutput() throws {
        guard session.canAddOutput(captureVideoDataOutput) else {
            throw CameraXError(code: "add-output-error", message: "Can not add output", details: nil)
        }
        session.addOutput(captureVideoDataOutput)
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
