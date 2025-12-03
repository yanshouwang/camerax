//
//  CameraController.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/12.
//

import Foundation
import AVFoundation

public class CameraController: NSObject {
    public class ListenerImpl: NSObject, RotationProvider.Listener {
        fileprivate let callback: (Surface.Rotation) -> Void
        
        init(callback: @escaping (Surface.Rotation) -> Void) {
            self.callback = callback
        }
        
        public func onRotationChanged(_ rotation: Surface.Rotation) {
            self.callback(rotation)
        }
    }
    
    private let torchControl: TorchControl
    private let zoomControl: ZoomControl
    private let focusMeteringControl: FocusMeteringControl
    private let cameraInfo: CameraInfo
    private let cameraControl: CameraControl
    private var _isTapToFocusEnabled: Bool
    private var _isPinchToZoomEnabled: Bool
    private var imageAnalysisResolutionSelector: ResolutionSelector?
    
    let session: AVCaptureSession
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    private var videoDeviceInput: AVCaptureDeviceInput?
    private var audioDeviceInput: AVCaptureDeviceInput?
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
    private lazy var rotationListener = ListenerImpl { self.updateVideoOrientation($0) }
    
    public override init() {
        let torchControl = TorchControl()
        let zoomControl = ZoomControl()
        let focusMeteringControl = FocusMeteringControl()
        self.torchControl = torchControl
        self.zoomControl = zoomControl
        self.focusMeteringControl = focusMeteringControl
        self.cameraInfo = CameraInfo(cameraSelector: .back, torchControl: torchControl, zoomControl: zoomControl)
        self.cameraControl = CameraControl(torchControl: torchControl, zoomControl: zoomControl, focusMeteringControl: focusMeteringControl)
        self._isTapToFocusEnabled = true
        self._isPinchToZoomEnabled = true
        self.session = AVCaptureSession()
        self.capturePhotoOutput = AVCapturePhotoOutput()
        self.capturePhotoSettings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
        self.captureMovieFileOutput = AVCaptureMovieFileOutput()
        self.captureVideoDataOutput = AVCaptureVideoDataOutput()
        self.captureMetadataOutput = AVCaptureMetadataOutput()
        self.imageAnalysisQueue = DispatchQueue(label: "dev.zeekr.camerax.imageAnalysisQueue")
        self.rotationProvider = RotationProvider()
        super.init()
        self.configureSession()
    }
    
    deinit {
        self.session.beginConfiguration()
        defer { self.session.commitConfiguration() }
        self.removeVideoDeviceInput()
        self.removeAudioDeviceInput()
        self.removeCapturePhotoOutput()
        self.removeCaptureMovieFileOutput()
        self.removeCaptureVideoDataOutput()
        self.removeCaptureMetadataOutput()
        self.rotationProvider.removeListener(self.rotationListener)
        self.rotationProvider.disable()
    }
    
    public func bind() throws {
        // [AVCaptureSession startRunning] should be called from background thread. Calling it on the main thread can lead to UI unresponsiveness
        DispatchSerialQueue.global(qos: .background).async { self.session.startRunning() }
    }
    
    public func unbind() {
        // DispatchSerialQueue.global(qos: .background).async { self.session.stopRunning() }
        self.session.stopRunning()
    }
    
    public func hasCamera(cameraSelector: CameraSelector) -> Bool {
        guard self.getVideoDevice(cameraSelector) != nil else { return false }
        return true
    }
    
    public func getCameraSelector() -> CameraSelector {
        return self.cameraInfo.getCameraSelector()
    }
    
    public func setCameraSelector(_ cameraSelector: CameraSelector) throws {
        self.cameraInfo.setCameraSelector(cameraSelector)
        self.session.beginConfiguration()
        defer { self.session.commitConfiguration() }
        self.removeVideoDeviceInput()
        try self.addVideoDeviceInput()
    }
    
    public func getCameraInfo() -> CameraInfo {
        return self.cameraInfo
    }
    
    public func getCameraControl() -> CameraControl {
        return self.cameraControl
    }
    
    public func getTorchState() -> LiveData<TorchState> {
        return self.cameraInfo.getTorchState()
    }
    
    public func enableTorch(_ torchEnabled: Bool) throws {
        try self.cameraControl.enableTorch(torchEnabled)
    }
    
    public func getZoomState() -> LiveData<ZoomState> {
        return self.cameraInfo.getZoomState()
    }
    
    public func setZoomRatio(_ zoomRatio: CGFloat) throws {
        try self.cameraControl.setZoomRatio(zoomRatio)
    }
    
    public func setLinearZoom(_ linearZoom: CGFloat) throws {
        try self.cameraControl.setLinearZoom(linearZoom)
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
        //        settings.photoQualityPrioritization = capturePhotoOutput.maxPhotoQualityPrioritization
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
    
    public func getImageAnalysisOutputImageFormat() -> ImageAnalysis.OutputImageFormat {
        guard let format = self.captureVideoDataOutput.videoSettings[kCVPixelBufferPixelFormatTypeKey as String] as? Int else { return .yuv420_888 }
        return format.imageAnalysisOutputImageFormat
    }
    
    public func setImageAnalysisOutputImageFormat(_ format: ImageAnalysis.OutputImageFormat) {
        self.captureVideoDataOutput.videoSettings[kCVPixelBufferPixelFormatTypeKey as String] = format.cvPixelFormat
    }
    
    public func setImageAnalysisAnalyzer(_ analyzer: ImageAnalysis.Analyzer) throws {
        if self.captureMetadataOutputObjectsDelegate != nil {
            self.captureMetadataOutput.setMetadataObjectsDelegate(nil, queue: nil)
            self.captureMetadataOutputObjectsDelegate = nil
        }
        if self.captureVideoDataOutputSampleBufferDelegate != nil {
            self.captureVideoDataOutput.setSampleBufferDelegate(nil, queue: nil)
            self.captureVideoDataOutputSampleBufferDelegate = nil
        }
        if let analyzer = analyzer as? AVAnalyzer {
            let types = analyzer.types?.filter { self.captureMetadataOutput.availableMetadataObjectTypes.contains($0) }
            self.captureMetadataOutput.metadataObjectTypes = types
            let delegate = CaptureMetadataOutputObjectsDelegate(analyzer: analyzer, controller: self)
            self.captureMetadataOutput.setMetadataObjectsDelegate(delegate, queue: self.imageAnalysisQueue)
            self.captureMetadataOutputObjectsDelegate = delegate
        } else {
            let delegate = CaptureVideoDataOutputSampleBufferDelegate(analyzer: analyzer, rotationProvider: self.rotationProvider)
            self.captureVideoDataOutput.setSampleBufferDelegate(delegate, queue: self.imageAnalysisQueue)
            self.captureVideoDataOutputSampleBufferDelegate = delegate
        }
    }
    
    public func clearImageAnalysisAnalyzer() {
        self.captureVideoDataOutput.setSampleBufferDelegate(nil, queue: nil)
        self.captureVideoDataOutputSampleBufferDelegate = nil
    }
    
    private func configureSession() {
        self.captureVideoDataOutput.alwaysDiscardsLateVideoFrames = true
        self.captureVideoDataOutput.automaticallyConfiguresOutputBufferDimensions = false
        self.captureVideoDataOutput.deliversPreviewSizedOutputBuffers = false
        var videoSettings = self.captureVideoDataOutput.videoSettings ?? [:]
        videoSettings[kCVPixelBufferPixelFormatTypeKey as String] = Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)
        self.captureVideoDataOutput.videoSettings = videoSettings
        
        self.session.beginConfiguration()
        defer { self.session.commitConfiguration() }
        self.session.sessionPreset = .photo
        try? self.addVideoDeviceInput()
        try? self.addAudioDeviceInput()
        try? self.addCapturePhotoOutput()
        try? self.addCaptureMovieFileOutput()
        try? self.addCaptureVideoDataOutput()
        try? self.addCaptureMetadataOutput()
        self.updateVideoOrientation()
        let _ = self.rotationProvider.addListener(self.rotationListener)
        self.rotationProvider.enable()
    }
    
    private func updateVideoOrientation() {
        guard let rotation = try? self.rotationProvider.getRotation() else { return }
        self.updateVideoOrientation(rotation)
    }
    
    private func updateVideoOrientation(_ rotation: Surface.Rotation) {
        let videoOrientation = CameraOrientationUtil.getVideoOrientation(rotation)
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
            if let device = AVCaptureDevice.default(.builtInTripleCamera, for: .video, position: .back) { return device }
            else if let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back) { return device }
            else { return AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) }
        case .external:
            if #available(iOS 17.0, *) { return AVCaptureDevice.default(.external, for: .video, position: .unspecified) }
            else { return nil }
        }
    }
    
    private func addVideoDeviceInput() throws {
        let cameraSelector = self.getCameraSelector()
        guard let device = getVideoDevice(cameraSelector),
              let input = try? AVCaptureDeviceInput(device: device) else {
            throw CameraXError(code: "nil-error", message: "video device input is nil", details: nil)
        }
        try self.addInput(input)
        self.videoDeviceInput = input
        // Do not addDevice before addInput, addInput will cause zoom ratio change to the minimum, but we have change zoom ratio to 1.0 when addDevice.
        self.torchControl.addDevice(device)
        self.zoomControl.addDevice(device)
        self.focusMeteringControl.addDevice(device)
        NotificationCenter.default.addObserver(self, selector: .handleSubjectAreaDidChangeNotification, name: AVCaptureDevice.subjectAreaDidChangeNotification, object: device)
    }
    
    private func removeVideoDeviceInput() {
        guard let input = self.videoDeviceInput else { return }
        let device = input.device
        self.removeInput(input)
        self.videoDeviceInput = nil
        self.torchControl.removeDevice()
        self.zoomControl.removeDevice()
        self.focusMeteringControl.removeDevice()
        NotificationCenter.default.removeObserver(self, name: AVCaptureDevice.subjectAreaDidChangeNotification, object: device)
    }
    
    private func getAudioDevice() -> AVCaptureDevice? {
        return AVCaptureDevice.default(for: .audio)
    }
    
    @objc fileprivate func handleSubjectAreaDidChangeNotification(_ notification: Notification) {
        debugPrint("subject area did change: \(notification)")
        let devicePoint = CGPoint(x: 0.5, y: 0.5)
        try? self.cameraControl.startFocusAndMetering(devicePoint, true)
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
