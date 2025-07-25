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
    private let torchState: LiveData<TorchState>
    private let zoomState: LiveData<ZoomState>
    private var _isTapToFocusEnabled: Bool
    private var _isPinchToZoomEnabled: Bool
    private var imageAnalysisResolutionSelector: ResolutionSelector?
    
    let session: AVCaptureSession
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    private var videoDeviceInput: AVCaptureDeviceInput?
    private var audioDeviceInput: AVCaptureDeviceInput?
    private var isTorchActiveObservation: NSKeyValueObservation?
    private var videoZoomFactorObservation: NSKeyValueObservation?
    private let capturePhotoOutput: AVCapturePhotoOutput
    private let capturePhotoSettings: AVCapturePhotoSettings
    private var capturePhotoCaptureDelegate: AVCapturePhotoCaptureDelegate?
    private let captureMovieFileOutput: AVCaptureMovieFileOutput
    private var captureFileOutputRecordingDelegate: AVCaptureFileOutputRecordingDelegate?
    private let captureVideoDataOutput: AVCaptureVideoDataOutput
    private var captureVideoDataOutputSampleBufferDelegate: AVCaptureVideoDataOutputSampleBufferDelegate?
    private let captureMetadataOutput: AVCaptureMetadataOutput
    private var captureMetadataOutputObjectsDelegate: AVCaptureMetadataOutputObjectsDelegate?
    private let imageAnalysisQueue: DispatchQueue
    private let rotationProvider: RotationProvider
    private lazy var rotationListener = RotationProvider.Listener { self.updateVideoOrientation($0) }
    
    public override init() {
        self.cameraSelector = .back
        self.torchState = LiveData()
        self.zoomState = LiveData()
        self._isTapToFocusEnabled = true
        self._isPinchToZoomEnabled = true
        self.session = AVCaptureSession()
        self.capturePhotoOutput = AVCapturePhotoOutput()
        self.capturePhotoSettings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
        self.captureMovieFileOutput = AVCaptureMovieFileOutput()
        self.captureVideoDataOutput = AVCaptureVideoDataOutput()
        self.captureMetadataOutput = AVCaptureMetadataOutput()
        self.imageAnalysisQueue = DispatchQueue(label: "dev.hebei.camerax.imageAnalysisQueue")
        self.rotationProvider = RotationProvider()
        super.init()
        
        self.session.sessionPreset = .photo
        self.captureVideoDataOutput.alwaysDiscardsLateVideoFrames = true
        var videoSettings = self.captureVideoDataOutput.videoSettings ?? [:]
        videoSettings[kCVPixelBufferPixelFormatTypeKey as String] = Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)
        self.captureVideoDataOutput.videoSettings = videoSettings
    }
    
    public func bind() throws {
        try self.addVideoDeviceInput()
        try self.addAudioDeviceInput()
        try self.addCapturePhotoOutput()
        try self.addCaptureMovieFileOutput()
        self.updateVideoOrientation()
        self.rotationProvider.addListener(self.rotationListener)
        self.rotationProvider.enable()
        DispatchQueue.global(qos: .background).async { self.session.startRunning() }
    }
    
    public func unbind() {
        self.session.stopRunning()
        self.removeVideoDeviceInput()
        self.removeAudioDeviceInput()
        self.removeCapturePhotoOutput()
        self.removeCaptureMovieFileOutput()
        self.rotationProvider.removeListener(self.rotationListener)
        self.rotationProvider.disable()
    }
    
    public func hasCamera(cameraSelector: CameraSelector) -> Bool {
        guard self.getVideoDevice(cameraSelector) != nil else { return false }
        return true
    }
    
    public func getCameraSelector() -> CameraSelector {
        return self.cameraSelector
    }
    
    public func setCameraSelector(_ cameraSelector: CameraSelector) throws {
        self.cameraSelector = cameraSelector
        guard self.session.isRunning else { return }
        self.session.beginConfiguration()
        defer { self.session.commitConfiguration() }
        self.removeVideoDeviceInput()
        try self.addVideoDeviceInput()
        self.updateVideoOrientation()
    }
    
    public func getTorchState() -> LiveData<TorchState> {
        return self.torchState
    }
    
    public func getZoomState() -> LiveData<ZoomState> {
        return self.zoomState
    }
    
    public func enableTorch(_ torchEnabled: Bool) throws {
        guard let input = self.videoDeviceInput else {
            throw CameraXError(code: "nil-error", message: "videoDeviceInput is nil", details: nil)
        }
        let device = input.device
        try device.lockForConfiguration()
        defer { device.unlockForConfiguration() }
        let torchMode = torchEnabled.avTorchState
        guard device.isTorchModeSupported(torchMode) else {
            throw CameraXError(code: "unsupported-error", message: "\(torchMode) is not supported", details: nil)
        }
        device.torchMode = torchMode
    }
    
    public func isPinchToZoomEnabled() -> Bool {
        return self._isPinchToZoomEnabled;
    }
    
    public func setPinchToZoomEnabled(_ enabled: Bool) -> Void {
        self._isPinchToZoomEnabled = enabled
    }
    
    public func isTapToFocusEnabled() -> Bool {
        return self._isTapToFocusEnabled
    }
    
    public func setTapToFocusEnabled(_ enabled: Bool) -> Void {
        self._isTapToFocusEnabled = enabled
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
        return self.capturePhotoSettings.flashMode.cxFlashMode
    }
    
    public func setImageCaptureFlashMode(_ flashMode: ImageCapture.FlashMode) -> Void {
        self.capturePhotoSettings.flashMode = flashMode.avFlashMode
    }
    
    public func takePicture(_ capturedCallback: ImageCapture.OnImageCapturedCallback) throws -> Void {
        let settings = AVCapturePhotoSettings(from: self.capturePhotoSettings)
        if #available(iOS 16.0, *) {
            settings.maxPhotoDimensions = self.capturePhotoOutput.maxPhotoDimensions
        } else {
            self.capturePhotoOutput.isHighResolutionCaptureEnabled = true
        }
//        if #available(iOS 13.0, *) {
//            settings.photoQualityPrioritization = capturePhotoOutput.maxPhotoQualityPrioritization
//        }
//        let settings = capturePhotoOutput.availablePhotoCodecTypes.contains(.hevc) ? AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.hevc]) : AVCapturePhotoSettings()
//        if let previewPhotoFormat = settings.availablePreviewPhotoPixelFormatTypes.first {
//            settings.previewPhotoFormat = [kCVPixelBufferPixelFormatTypeKey as String: previewPhotoFormat]
//        }
//        settings.flashMode = capturePhotoSettings.flashMode
        let delegate = CapturePhotoCaptureDelegate(capturedCallback)
        self.capturePhotoOutput.capturePhoto(with: settings, delegate: delegate)
        self.capturePhotoCaptureDelegate = delegate
    }
    
    public func isRecording() -> Bool {
        return self.captureMovieFileOutput.isRecording
    }
    
    public func startRecording(_ outputOptions: FileOutputOptions, _ audioConfig: AudioConfig, listener: any Consumer<VideoRecordEvent>) throws -> Recording {
        guard let connection = self.captureMovieFileOutput.connection(with: .audio) else {
            throw CameraXError(code: "nil-error", message: "connection is nil", details: nil)
        }
        connection.isEnabled = audioConfig.audioEnabled
        let delegate = CaptureFileOutputRecordingDelegate(listener: listener)
        self.captureMovieFileOutput.startRecording(to: outputOptions.url, recordingDelegate: delegate)
        self.captureFileOutputRecordingDelegate = delegate
        return Recording(self.captureMovieFileOutput)
    }
    
    public func getImageAnalysisResolutionSelector() -> ResolutionSelector? {
        return self.imageAnalysisResolutionSelector
    }
    
    public func setImageAnalysisResolutionSelector(_ selector: ResolutionSelector?) throws {
        guard let input = self.videoDeviceInput else {
            throw CameraXError(code: "nil-error", message: "videoDeviceInput is nil", details: nil)
        }
        guard var videoSettings = self.captureVideoDataOutput.videoSettings else {
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
                let ratio = boundSize.width / boundSize.height
                let width: Int, height: Int
                switch fallbackRule {
                case .none:
                    if ratio != deviceRatio {
                        throw CameraXError(code: "unsupported-error", message: "Video settings dimensions must maintain the source device activeFormat's aspect ratio", details: nil)
                    }
                    width = boundSize.width.roundToEvenInt()
                    height = boundSize.height.roundToEvenInt()
                case .closestHigherThenLower:
                    fallthrough
                case .closestHigher:
                    if ratio > deviceRatio {
                        width = boundSize.width.roundToEvenInt()
                        height = (boundSize.width / deviceRatio).roundToEvenInt()
                    } else {
                        width = (boundSize.height * deviceRatio).roundToEvenInt()
                        height = boundSize.height.roundToEvenInt()
                    }
                case .closestLowerThenHigher:
                    fallthrough
                case .closestLower:
                    if ratio > deviceRatio {
                        width = (boundSize.height * deviceRatio).roundToEvenInt()
                        height = boundSize.height.roundToEvenInt()
                    } else {
                        width = boundSize.width.roundToEvenInt()
                        height = (boundSize.width / deviceRatio).roundToEvenInt()
                    }
                }
                videoSettings[kCVPixelBufferWidthKey as String] = width
                videoSettings[kCVPixelBufferHeightKey as String] = height
                self.captureVideoDataOutput.videoSettings = videoSettings
            } else {
                throw CameraXError(code: "unsupported-error", message: "setImageAnalysisResolutionSelector is not supported before iOS 16.0", details: nil)
            }
        } else {
            videoSettings.removeValue(forKey: kCVPixelBufferWidthKey as String)
            videoSettings.removeValue(forKey: kCVPixelBufferHeightKey as String)
        }
        self.imageAnalysisResolutionSelector = selector
    }
    
    public func getImageAnalysisOutputImageFormat() -> ImageFormat {
        guard let outputImageFormat = self.captureVideoDataOutput.videoSettings[kCVPixelBufferPixelFormatTypeKey as String] as? Int else { return .yuv420888 }
        return outputImageFormat.cxImageFormat
    }
    
    public func setImageAnalysisOutputImageFormat(_ format: ImageFormat) {
        self.captureVideoDataOutput.videoSettings[kCVPixelBufferPixelFormatTypeKey as String] = format.cvPixelFormat
    }
    
    public func setImageAnalysisAnalyzer(_ analyzer: ImageAnalysis.Analyzer) throws {
        if self.captureMetadataOutputObjectsDelegate != nil {
            self.removeCaptureMetadataOutput()
            self.captureMetadataOutputObjectsDelegate = nil
        }
        if self.captureVideoDataOutputSampleBufferDelegate != nil {
            self.removeCaptureVideoDataOutput()
            self.captureVideoDataOutputSampleBufferDelegate = nil
        }
        guard let videoPreviewLayer = self.videoPreviewLayer else {
            throw CameraXError(code: "nil-error", message: "video preview layer is nil", details: nil)
        }
        if let analyzer = analyzer as? AVAnalyzer {
            try self.addCaptureMetadataOutput()
            // TODO: Why availableMetadataObjectTypes is nil
            let availableMetadataObjectTypes = self.captureMetadataOutput.availableMetadataObjectTypes
            debugPrint("availableMetadataObjectTypes: \(availableMetadataObjectTypes)")
            let types = analyzer.types?.filter { self.captureMetadataOutput.availableMetadataObjectTypes.contains($0) }
            self.captureMetadataOutput.metadataObjectTypes = types
            let delegate = CaptureMetadataOutputObjectsDelegate(analyzer: analyzer, videoPreviewLayer: videoPreviewLayer)
            self.captureMetadataOutput.setMetadataObjectsDelegate(delegate, queue: self.imageAnalysisQueue)
            self.captureMetadataOutputObjectsDelegate = delegate
        } else {
            try self.addCaptureVideoDataOutput()
            let delegate = CaptureVideoDataOutputSampleBufferDelegate(analyzer: analyzer, rotationProvider: self.rotationProvider)
            self.captureVideoDataOutput.setSampleBufferDelegate(delegate, queue: self.imageAnalysisQueue)
            self.captureVideoDataOutputSampleBufferDelegate = delegate
        }
    }
    
    public func clearImageAnalysisAnalyzer() {
        self.captureVideoDataOutput.setSampleBufferDelegate(nil, queue: nil)
        self.captureVideoDataOutputSampleBufferDelegate = nil
    }
    
    private func updateVideoOrientation() {
        let rotation = self.rotationProvider.getRotation()
        self.updateVideoOrientation(rotation)
    }
    
    private func updateVideoOrientation(_ rotation: Int) {
        guard let videoOrientation = CameraOrientationUtil.getVideoOrientation(rotation) else { return }
        debugPrint("update capture photo output and capture movice file output orientation: \(videoOrientation)")
        self.setVideoOrientation(for: capturePhotoOutput, videoOrientation: videoOrientation)
        self.setVideoOrientation(for: captureMovieFileOutput, videoOrientation: videoOrientation)
    }
    
    private func setVideoOrientation(for output: AVCaptureOutput, videoOrientation: AVCaptureVideoOrientation) {
        guard let connection = output.connection(with: .video) else {
            debugPrint("output connection is nil")
            return
        }
        connection.videoOrientation = videoOrientation
    }
    
    private func getVideoDevice(_ cameraSelector: CameraSelector) -> AVCaptureDevice? {
        switch cameraSelector.lensFacing {
        case .unknown:
            return nil
        case .front:
            return AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
        case .back:
            if #available(iOS 13.0, *), let device = AVCaptureDevice.default(.builtInTripleCamera, for: .video, position: .back) { return device }
            else if let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back) { return device }
            else { return AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) }
        case .external:
            if #available(iOS 17.0, *) { return AVCaptureDevice.default(.external, for: .video, position: .unspecified) }
            else { return nil }
        }
    }
    
    private func addVideoDeviceInput() throws {
        guard let device = getVideoDevice(self.cameraSelector),
              let input = try? AVCaptureDeviceInput(device: device) else {
            throw CameraXError(code: "nil-error", message: "video device input is nil", details: nil)
        }
        try self.addInput(input)
        self.videoDeviceInput = input
        try? setZoomRatio(1.0)
        self.isTorchActiveObservation = device.observe(\.isTorchActive, options: [.initial, .new]) { device, change in
            guard let newValue = change.newValue else { return }
            self.torchState.setValue(newValue.cxTorchState)
        }
        self.videoZoomFactorObservation = device.observe(\.videoZoomFactor, options: [.initial, .new]) { device, change in
            guard change.newValue != nil else { return }
            self.zoomState.setValue(device.zoomState)
        }
        NotificationCenter.default.addObserver(self, selector: .handleSubjectAreaDidChangeNotification, name: AVCaptureDevice.subjectAreaDidChangeNotification, object: input.device)
    }
    
    private func removeVideoDeviceInput() {
        guard let input = self.videoDeviceInput else { return }
        self.removeInput(input)
        self.videoDeviceInput = nil
        self.isTorchActiveObservation?.invalidate()
        self.videoZoomFactorObservation?.invalidate()
        NotificationCenter.default.removeObserver(self, name: AVCaptureDevice.subjectAreaDidChangeNotification, object: input.device)
    }
    
    private func getAudioDevice() -> AVCaptureDevice? {
        return AVCaptureDevice.default(for: .audio)
    }
    
    @objc fileprivate func handleSubjectAreaDidChangeNotification(_ notification: Notification) {
        debugPrint("subject area did change: \(notification)")
        let devicePoint = CGPoint(x: 0.5, y: 0.5)
        try? self.startFocusAndMetering(devicePoint, true)
    }
    
    private func addAudioDeviceInput() throws {
        guard let device = AVCaptureDevice.default(for: .audio),
              let input = try? AVCaptureDeviceInput(device: device) else {
            throw CameraXError(code: "nil-error", message: "videoDeviceInput is nil", details: nil)
        }
        try self.addInput(input)
        self.audioDeviceInput = input
    }
    
    private func removeAudioDeviceInput() {
        guard let input = self.audioDeviceInput else { return }
        self.removeInput(input)
        self.audioDeviceInput = nil
    }
    
    private func addCapturePhotoOutput() throws {
        try self.addOutput(self.capturePhotoOutput)
    }
    
    private func removeCapturePhotoOutput() {
        self.removeOutput(self.capturePhotoOutput)
    }
    
    private func addCaptureMovieFileOutput() throws {
        try self.addOutput(captureMovieFileOutput)
    }
    
    private func removeCaptureMovieFileOutput() {
        self.removeOutput(self.captureMovieFileOutput)
    }
    
    private func addCaptureVideoDataOutput() throws {
        try self.addOutput(self.captureVideoDataOutput)
    }
    
    private func removeCaptureVideoDataOutput() {
        self.removeOutput(self.captureVideoDataOutput)
    }
    
    private func addCaptureMetadataOutput() throws {
        try self.addOutput(self.captureMetadataOutput)
    }
    
    private func removeCaptureMetadataOutput() {
        self.removeOutput(self.captureMetadataOutput)
    }
    
    private func addInput(_ input: AVCaptureInput) throws {
        guard self.session.canAddInput(input) else {
            throw CameraXError(code: "add-input-error", message: "Can not add input", details: nil)
        }
        self.session.addInput(input)
    }
    
    private func removeInput(_ input: AVCaptureInput) {
        self.session.removeInput(input)
    }
    
    private func addOutput(_ output: AVCaptureOutput) throws {
        guard self.session.canAddOutput(output) else {
            throw CameraXError(code: "add-output-error", message: "Can not add output", details: nil)
        }
        self.session.addOutput(output)
    }
    
    private func removeOutput(_ output: AVCaptureOutput) {
        self.session.removeOutput(output)
    }
}

fileprivate extension Selector {
    static var handleSubjectAreaDidChangeNotification: Selector {
        return #selector(CameraController.handleSubjectAreaDidChangeNotification(_:))
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
    
    var minZoomRatio: Double {
        if #available(iOS 13.0, *), let firstSwitchOverVideoZoomFactor = self.virtualDeviceSwitchOverVideoZoomFactors.first {
            return self.minAvailableVideoZoomFactor / CGFloat(truncating: firstSwitchOverVideoZoomFactor)
        } else {
            return self.minAvailableVideoZoomFactor
        }
    }
    
    var maxZoomRatio: Double {
        if #available(iOS 13.0, *), let firstSwitchOverVideoZoomFactor = self.virtualDeviceSwitchOverVideoZoomFactors.first, let lastSwitchOverVideoZoomFactor = self.virtualDeviceSwitchOverVideoZoomFactors.last {
            // 5x digital zoom factor
            return CGFloat(truncating: lastSwitchOverVideoZoomFactor) / CGFloat(truncating: firstSwitchOverVideoZoomFactor) * 5.0
        } else {
            return self.maxAvailableVideoZoomFactor
        }
    }
    
    var zoomRatio: Double {
        get {
            if #available(iOS 13.0, *), let firstSwitchOverVideoZoomFactor = self.virtualDeviceSwitchOverVideoZoomFactors.first {
                return self.videoZoomFactor / CGFloat(truncating: firstSwitchOverVideoZoomFactor)
            } else {
                return self.videoZoomFactor
            }
        }
        set {
            guard newValue >= minZoomRatio && newValue <= maxZoomRatio else { return }
            if #available(iOS 13.0, *), let firstSwitchOverVideoZoomFactor = self.virtualDeviceSwitchOverVideoZoomFactors.first {
                self.videoZoomFactor = newValue * CGFloat(truncating: firstSwitchOverVideoZoomFactor)
            } else {
                self.videoZoomFactor = newValue
            }
        }
    }
    
    var zoomState: ZoomState {
        return ZoomState(minZoomRatio: minZoomRatio, maxZoomRatio: maxZoomRatio, zoomRatio: zoomRatio)
    }
}

fileprivate extension CGFloat {
    func roundToEvenInt() -> Int {
        let rounded = self.rounded(.toNearestOrEven)
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
