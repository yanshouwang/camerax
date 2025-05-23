//
//  CameraController.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/12.
//

import Foundation
import AVFoundation

public class CameraController: NSObject, CameraInfo, CameraControl {
    private var cameraSelector: CameraSelector
    @objc private dynamic var zoomState: ZoomState?
    @objc private dynamic var torchState: TorchState
    private var _isTapToFocusEnabled: Bool
    private var _isPinchToZoomEnabled: Bool
    private var imageAnalysisResolutionSelector: ResolutionSelector?
    
    let session: AVCaptureSession
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
        torchState = .off
        _isTapToFocusEnabled = true
        _isPinchToZoomEnabled = true
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
        guard getVideoDevice(cameraSelector) != nil else { return false }
        return true
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
    
    public func getTorchState() -> TorchState? {
        return torchState
    }
    
    public func observeTorchState(_ onChanged: @escaping (TorchState) -> Void) -> NSKeyValueObservation {
        return observe(\.torchState, options: .new) { _, change in
            guard let newValue = change.newValue else { return }
            onChanged(newValue)
        }
    }
    
    public func getZoomState() -> ZoomState? {
        return zoomState
    }
    
    public func observeZoomState(_ onChanged: @escaping (ZoomState) -> Void) -> NSKeyValueObservation {
        return observe(\.zoomState, options: .new) { _, change in
            guard let newValue = change.newValue, let zoomState = newValue else { return }
            onChanged(zoomState)
        }
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
            throw CameraXError(code: "unsupported-error", message: "\(torchMode) is not supported", details: nil)
        }
        device.torchMode = torchMode
    }
    
    public func isPinchToZoomEnabled() -> Bool {
        return _isPinchToZoomEnabled;
    }
    
    public func setPinchToZoomEnabled(_ enabled: Bool) -> Void {
        _isPinchToZoomEnabled = enabled
    }
    
    public func isTapToFocusEnabled() -> Bool {
        return _isTapToFocusEnabled
    }
    
    public func setTapToFocusEnabled(_ enabled: Bool) -> Void {
        _isTapToFocusEnabled = enabled
    }
    
    public func setZoomRatio(_ zoomRatio: CGFloat) throws {
        guard let input = self.videoDeviceInput else {
            throw CameraXError(code: "nil-error", message: "videoDeviceInput is nil", details: nil)
        }
        let device = input.device
        try device.lockForConfiguration()
        defer { device.unlockForConfiguration() }
        device.zoomRatio = zoomRatio
    }
    
    public func setLinearZoom(_ linearZoom: CGFloat) throws {
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
    
    public func startFocusAndMetering(_ action: FocusMeteringAction) throws -> FocusMeteringResult {
        guard let input = self.videoDeviceInput else {
            throw CameraXError(code: "nil-error", message: "videoDeviceInput is nil", details: nil)
        }
        let device = input.device
        try device.lockForConfiguration()
        defer { device.unlockForConfiguration() }
        // AF
        if let meteringPoint = action.meteringPointsAf.first {
            guard device.isFocusPointOfInterestSupported, let focusMode = device.highestAvailableAutoFocusMode else {
                throw CameraXError(code: "unsupported-error", message: "AF is not supported", details: nil)
            }
            device.focusPointOfInterest = meteringPoint.impl
            device.focusMode = focusMode
        }
        // AE
        if let meteringPoint = action.meteringPointsAe.first {
            guard device.isExposurePointOfInterestSupported, let exposureMode = device.highestAvailableAutoExposureMode else {
                throw CameraXError(code: "unsupported-error", message: "AE is not supported", details: nil)
            }
            device.exposurePointOfInterest = meteringPoint.impl
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
        guard let input = self.videoDeviceInput else {
            throw CameraXError(code: "nil-error", message: "videoDeviceInput is nil", details: nil)
        }
        let device = input.device
        try device.lockForConfiguration()
        defer { device.unlockForConfiguration() }
        device.isSubjectAreaChangeMonitoringEnabled = true
    }
    
    func startFocusAndMetering(_ devicePoint: CGPoint, _ continuous: Bool) throws -> Void {
        guard let input = self.videoDeviceInput else {
            throw CameraXError(code: "nil-error", message: "videoDeviceInput is nil", details: nil)
        }
        let device = input.device
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
    
    public func setExposureCompensationIndex(_ value: Int) throws -> Int {
        throw CameraXError(code: "unimplemented-error", message: "setExposureCompensationIndex is not implemented", details: nil)
    }
    
    public func getImageCaptureFlashMode() -> ImageCapture.FlashMode {
        return capturePhotoSettings.flashMode.api
    }
    
    public func setImageCaptureFlashMode(_ flashMode: ImageCapture.FlashMode) -> Void {
        capturePhotoSettings.flashMode = flashMode.impl
    }
    
    public func takePicture(_ capturedCallback: ImageCapture.OnImageCapturedCallback) throws -> Void {
        throw CameraXError(code: "unimplemented-error", message: "takePicture is not implemented", details: nil)
    }
    
    public func takePicture(_ outputFileOptions: ImageCapture.OutputFileOptions, _ savedCallback: ImageCapture.OnImageSavedCallback) throws -> Void {
        let settings = AVCapturePhotoSettings(from: capturePhotoSettings)
        //        let settings = capturePhotoOutput.availablePhotoCodecTypes.contains(.hevc) ? AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.hevc]) : AVCapturePhotoSettings()
        //        if let previewPhotoFormat = settings.availablePreviewPhotoPixelFormatTypes.first {
        //            settings.previewPhotoFormat = [kCVPixelBufferPixelFormatTypeKey as String: previewPhotoFormat]
        //        }
        //        if #available(iOS 16.0, *) {
        //            settings.maxPhotoDimensions = capturePhotoOutput.maxPhotoDimensions
        //        }
        //        settings.flashMode = capturePhotoSettings.flashMode
        //        settings.photoQualityPrioritization = capturePhotoOutput.maxPhotoQualityPrioritization
        let delegate = CapturePhotoCaptureDelegate(outputFileOptions, savedCallback)
        capturePhotoCaptureDelegate = delegate
        capturePhotoOutput.capturePhoto(with: settings, delegate: delegate)
    }
    
    public func isRecording() -> Bool {
        return captureMovieFileOutput.isRecording
    }
    
    public func startRecording(_ outputOptions: FileOutputOptions, _ audioConfig: AudioConfig, listener: any Consumer<VideoRecordEvent>) throws -> Recording {
        guard let connection = captureMovieFileOutput.connection(with: .audio) else {
            throw CameraXError(code: "nil-error", message: "connection is nil", details: nil)
        }
        connection.isEnabled = audioConfig.audioEnabled
        let delegate = CaptureFileOutputRecordingDelegate(listener: listener)
        captureFileOutputRecordingDelegate = delegate
        captureMovieFileOutput.startRecording(to: outputOptions.url, recordingDelegate: delegate)
        return Recording(captureMovieFileOutput)
    }
    
    public func getImageAnalysisResolutionSelector() -> ResolutionSelector? {
        return imageAnalysisResolutionSelector
    }
    
    func setImageAnalysisResolutionSelector(_ selector: ResolutionSelector?) throws {
        guard let input = videoDeviceInput else {
            throw CameraXError(code: "nil-error", message: "videoDeviceInput is nil", details: nil)
        }
        guard var videoSettings = captureVideoDataOutput.videoSettings else {
            throw CameraXError(code: "nil-error", message: "videoSettings is nil", details: nil)
        }
        let device = input.device
        let activeFormat = device.activeFormat
        let formatDescription = activeFormat.formatDescription
        let dimensions = CMVideoFormatDescriptionGetDimensions(formatDescription)
        let deviceRatio = CGFloat(dimensions.width) / CGFloat(dimensions.height)
        if let selector = selector, let resolutionStrategy = selector.resolutionStrategy, let boundSize = resolutionStrategy.boundSize {
            if #available(iOS 16.0, *) {
                let fallbackRule = resolutionStrategy.fallbackRule
                let ratio = CGFloat(boundSize.width) / CGFloat(boundSize.height)
                let width: Int, height: Int
                switch fallbackRule {
                case .none:
                    if ratio != deviceRatio {
                        throw CameraXError(code: "unsupported-error", message: "Video settings dimensions must maintain the source device activeFormat's aspect ratio", details: nil)
                    }
                    width = boundSize.width
                    height = boundSize.height
                case .closestHigherThenLower:
                    fallthrough
                case .closestHigher:
                    if ratio > deviceRatio {
                        width = boundSize.width
                        height = (CGFloat(boundSize.width) / deviceRatio).roundToEvenInt()
                    } else {
                        width = (CGFloat(boundSize.height) * deviceRatio).roundToEvenInt()
                        height = boundSize.height
                    }
                case .closestLowerThenHigher:
                    fallthrough
                case .closestLower:
                    let ratio = CGFloat(boundSize.width) / CGFloat(boundSize.height)
                    if ratio > deviceRatio {
                        width = (CGFloat(boundSize.height) * deviceRatio).roundToEvenInt()
                        height = boundSize.height
                    } else {
                        width = boundSize.width
                        height = (CGFloat(boundSize.width) / deviceRatio).roundToEvenInt()
                    }
                }
                videoSettings[kCVPixelBufferWidthKey as String] = width
                videoSettings[kCVPixelBufferHeightKey as String] = height
                captureVideoDataOutput.videoSettings = videoSettings
            } else {
                throw CameraXError(code: "unsupported-error", message: "setImageAnalysisResolutionSelector is not supported before iOS 16.0", details: nil)
            }
        } else {
            videoSettings.removeValue(forKey: kCVPixelBufferWidthKey as String)
            videoSettings.removeValue(forKey: kCVPixelBufferHeightKey as String)
        }
        imageAnalysisResolutionSelector = selector
    }
    
    public func getImageAnalysisOutputImageFormat() -> ImageFormat {
        let key = kCVPixelBufferPixelFormatTypeKey as String
        guard let outputImageFormat = captureVideoDataOutput.videoSettings[key] as? Int else { return .yuv420888 }
        return outputImageFormat.imageFormatApi
    }
    
    public func setImageAnalysisOutputImageFormat(_ format: ImageFormat) {
        captureVideoDataOutput.videoSettings[kCVPixelBufferPixelFormatTypeKey as String] = format.impl
    }
    
    public func setImageAnalysisAnalyzer(_ analyzer: ImageAnalysis.Analyzer) {
        let delegate = CaptureVideoDataOutputSampleBufferDelegate(analyzer: analyzer) { return self.rotation }
        captureVideoDataOutputSampleBufferDelegate = delegate
        captureVideoDataOutput.setSampleBufferDelegate(delegate, queue: captureVideoDataOutputQueue)
    }
    
    public func clearImageAnalysisAnalyzer() {
        captureVideoDataOutput.setSampleBufferDelegate(nil, queue: captureVideoDataOutputQueue)
    }
    
    private func getVideoDeviceType(_ cameraSelector: CameraSelector) -> AVCaptureDevice.DeviceType? {
        switch cameraSelector.lensFacing {
        case .unknown:
            return nil
        case .front:
            return .builtInWideAngleCamera
        case .back:
            return .builtInTripleCamera
        case .external:
            if #available(iOS 17.0, *) { return .external }
            else { return nil }
        }
    }
    
    private func getVideoDevice(_ cameraSelector: CameraSelector) -> AVCaptureDevice? {
        guard let deviceType = getVideoDeviceType(cameraSelector) else { return nil }
        let position = cameraSelector.lensFacing.impl
        return AVCaptureDevice.default(deviceType, for: .video, position: position)
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
        videoZoomFactorObservation = device.observe(\.videoZoomFactor, options: [.initial, .new]) { device, change in
            guard change.newValue != nil else { return }
            self.zoomState = device.zoomState
        }
        isTorchActiveObservation = device.observe(\.isTorchActive, options: [.initial, .new]) { _, change in
            guard let newValue = change.newValue else { return }
            self.torchState = newValue ? .on : .off
        }
        if let subjectAreaDidChangeObserver {
            NotificationCenter.default.removeObserver(subjectAreaDidChangeObserver)
        }
        subjectAreaDidChangeObserver = NotificationCenter.default.addObserver(forName: .AVCaptureDeviceSubjectAreaDidChange, object: device, queue: .current) { _ in
            let devicePoint = CGPoint(x: 0.5, y: 0.5)
            _ = try? self.startFocusAndMetering(devicePoint, true)
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
    
    private func addCaptureVideoDataOutput() throws {
        guard session.canAddOutput(captureVideoDataOutput) else {
            throw CameraXError(code: "add-output-error", message: "Can not add output", details: nil)
        }
        session.addOutput(captureVideoDataOutput)
    }
}

extension AVCaptureDevice {
    var highestAvailableAutoFocusMode: AVCaptureDevice.FocusMode? {
        return if isFocusModeSupported(.continuousAutoFocus) { .continuousAutoFocus }
        else if isFocusModeSupported(.autoFocus) { .autoFocus }
        else { nil }
    }
    
    var highestAvailableAutoExposureMode: AVCaptureDevice.ExposureMode? {
        return if isExposureModeSupported(.continuousAutoExposure) { .continuousAutoExposure }
        else if isExposureModeSupported(.autoExpose) { .autoExpose }
        else { nil }
    }
    
    var highestAvailableAutoWhiteBalanceMode: AVCaptureDevice.WhiteBalanceMode? {
        return if isWhiteBalanceModeSupported(.continuousAutoWhiteBalance) { .continuousAutoWhiteBalance }
        else if isWhiteBalanceModeSupported(.autoWhiteBalance) { .autoWhiteBalance }
        else { nil }
    }
    
    var minZoomRatio: Double {
        if let firstSwitchOverVideoZoomFactor = virtualDeviceSwitchOverVideoZoomFactors.first {
            return minAvailableVideoZoomFactor / CGFloat(truncating: firstSwitchOverVideoZoomFactor)
        } else {
            return minAvailableVideoZoomFactor
        }
    }
    
    var maxZoomRatio: Double {
        if let firstSwitchOverVideoZoomFactor = virtualDeviceSwitchOverVideoZoomFactors.first,
           let lastSwitchOverVideoZoomFactor = virtualDeviceSwitchOverVideoZoomFactors.last {
            // 5x digital zoom factor
            return CGFloat(truncating: lastSwitchOverVideoZoomFactor) / CGFloat(truncating: firstSwitchOverVideoZoomFactor) * 5.0
        } else {
            return maxAvailableVideoZoomFactor
        }
    }
    
    var zoomRatio: Double {
        get {
            if let firstSwitchOverVideoZoomFactor = virtualDeviceSwitchOverVideoZoomFactors.first {
                return videoZoomFactor / CGFloat(truncating: firstSwitchOverVideoZoomFactor)
            } else {
                return videoZoomFactor
            }
        }
        set {
            if newValue < minZoomRatio || newValue > maxZoomRatio {
                return
            }
            if let firstSwitchOverVideoZoomFactor = virtualDeviceSwitchOverVideoZoomFactors.first {
                videoZoomFactor = newValue * CGFloat(truncating: firstSwitchOverVideoZoomFactor)
            } else {
                videoZoomFactor = newValue
            }
        }
    }
    
    var zoomState: ZoomState {
        return ZoomState(minZoomRatio: minZoomRatio, maxZoomRatio: maxZoomRatio, zoomRatio: zoomRatio)
    }
}

extension CGFloat {
    func roundToEvenInt() -> Int {
        let rounded = rounded(.toNearestOrEven)
        let value = Int(rounded)
        if value % 2 == 0 {
            return value
        }
        let evenMinus = value - 1
        let evenPlus = value + 1
        let diffMinus = self - CGFloat(evenMinus)
        let diffPlus = self - CGFloat(evenPlus)
        if abs(diffMinus) < abs(diffPlus) {
            return evenMinus
        }
        return evenPlus
    }
}
