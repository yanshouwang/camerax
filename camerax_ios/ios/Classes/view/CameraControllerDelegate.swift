//
//  CameraControllerDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

class CameraControllerDelegate: PigeonApiDelegateCameraControllerApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiCameraControllerApi) throws -> CameraController {
        return CameraController()
    }
    
    func initialize(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws {
        throw CameraXError(code: "unimplemented-error", message: "initialize is not implemented", details: nil)
    }
    
    func bind(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws {
        pigeonInstance.bind()
    }
    
    func unbind(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws {
        pigeonInstance.unbind()
    }
    
    func hasCamera(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, cameraSelector: CameraSelector) throws -> Bool {
        return pigeonInstance.hasCamera(cameraSelector: cameraSelector)
    }
    
    func getCameraSelector(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> CameraSelector {
        return pigeonInstance.getCameraSelector()
    }
    
    func setCameraSelector(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, cameraSelector: CameraSelector) throws {
        try pigeonInstance.setCameraSelector(cameraSelector)
    }
    
    func getCameraInfo(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> (any CameraInfo)? {
        return pigeonInstance
    }
    
    func getCameraControl(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> (any CameraControl)? {
        return pigeonInstance
    }
    
    func getTorchState(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> TorchStateApi? {
        return pigeonInstance.getTorchState()?.api
    }
    
    func observeTorchState(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, observer: TorchStateObserver) throws -> NSKeyValueObservation {
        return pigeonInstance.observeTorchState(observer.onChanged)
    }
    
    func enableTorch(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, torchEnabled: Bool) throws {
        try pigeonInstance.enableTorch(torchEnabled)
    }
    
    func getZoomState(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> ZoomState? {
        return pigeonInstance.getZoomState()
    }
    
    func observeZoomState(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, observer: ZoomStateObserver) throws -> NSKeyValueObservation {
        return pigeonInstance.observeZoomState(observer.onChanged)
    }
    
    func setZoomRatio(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, zoomRatio: Double) throws {
        try pigeonInstance.setZoomRatio(zoomRatio)
    }
    
    func setLinearZoom(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, linearZoom: Double) throws {
        try pigeonInstance.setLinearZoom(linearZoom)
    }
    
    func isPinchToZoomEnabled(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> Bool {
        return pigeonInstance.isPinchToZoomEnabled()
    }
    
    func setPinchToZoomEnabled(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, enabled: Bool) throws {
        pigeonInstance.setPinchToZoomEnabled(enabled)
    }
    
    func isTapToFocusEnabled(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> Bool {
        return pigeonInstance.isTapToFocusEnabled()
    }
    
    func setTapToFocusEnabled(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, enabled: Bool) throws {
        pigeonInstance.setTapToFocusEnabled(enabled)
    }
    
    func isImageCaptureEnabled(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "isImageCaptureEnabled is not implemented", details: nil)
    }
    
    func isImageAnalysisEnabled(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "isImageAnalysisEnabled is not implemented", details: nil)
    }
    
    func isVideoCaptureEnabled(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "isVideoCaptureEnabled is not implemented", details: nil)
    }
    
    func setEnabledUseCases(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, enabledUseCases: [UseCaseApi]) throws {
        throw CameraXError(code: "unimplemented-error", message: "setEnabledUseCases is not implemented", details: nil)
    }
    
    func getImageCaptureMode(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> CaptureModeApi {
        throw CameraXError(code: "unimplemented-error", message: "getImageCaptureMode is not implemented", details: nil)
    }
    
    func setImageCaptureMode(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, captureMode: CaptureModeApi) throws {
        throw CameraXError(code: "unimplemented-error", message: "setImageCaptureMode is not implemented", details: nil)
    }
    
    func getImageCaptureFlashMode(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> FlashModeApi {
        return pigeonInstance.getImageCaptureFlashMode().api
    }
    
    func setImageCaptureFlashMode(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, flashMode: FlashModeApi) throws {
        pigeonInstance.setImageCaptureFlashMode(flashMode.delegate)
    }
    
    func takePictureToMemory(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, capturedCallback: any ImageCapture.OnImageCapturedCallback) throws {
        try pigeonInstance.takePicture(capturedCallback)
    }
    
    func takePictureToFile(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, outputFileOptions: ImageCapture.OutputFileOptions, savedCallback: any ImageCapture.OnImageSavedCallback) throws {
        try pigeonInstance.takePicture(outputFileOptions, savedCallback)
    }
    
    func getImageAnalysisResolutionSelector(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> ResolutionSelector? {
        return pigeonInstance.getImageAnalysisResolutionSelector()
    }
    
    func setImageAnalysisResolutionSelector(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, resolutionSelector: ResolutionSelector?) throws {
        try pigeonInstance.setImageAnalysisResolutionSelector(resolutionSelector)
    }
    
    func getImageAnalysisBackpressureStrategy(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> BackpressureStrategyApi {
        throw CameraXError(code: "unimplemented-error", message: "getImageAnalysisBackpressureStrategy is not implemented", details: nil)
    }
    
    func setImageAnalysisBackpressureStrategy(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, strategy: BackpressureStrategyApi) throws {
        throw CameraXError(code: "unimplemented-error", message: "setImageAnalysisBackpressureStrategy is not implemented", details: nil)
    }
    
    func getImageAnalysisImageQueueDepth(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> Int64 {
        throw CameraXError(code: "unimplemented-error", message: "getImageAnalysisImageQueueDepth is not implemented", details: nil)
    }
    
    func setImageAnalysisImageQueueDepth(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, depth: Int64) throws {
        throw CameraXError(code: "unimplemented-error", message: "setImageAnalysisImageQueueDepth is not implemented", details: nil)
    }
    
    func getImageAnalysisOutputImageFormat(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> ImageFormatApi {
        return pigeonInstance.getImageAnalysisOutputImageFormat().api
    }
    
    func setImageAnalysisOutputImageFormat(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, imageAnalysisOutputImageFormat: ImageFormatApi) throws {
        pigeonInstance.setImageAnalysisOutputImageFormat(imageAnalysisOutputImageFormat.delegate)
    }
    
    func setImageAnalysisAnalyzer(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, analyzer: any ImageAnalysis.Analyzer) throws {
        pigeonInstance.setImageAnalysisAnalyzer(analyzer)
    }
    
    func clearImageAnalysisAnalyzer(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws {
        pigeonInstance.clearImageAnalysisAnalyzer()
    }
    
    func getVideoCaptureMirrorMode(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> MirrorModeApi {
        throw CameraXError(code: "unimplemented-error", message: "getVideoCaptureMirrorMode is not implemented", details: nil)
    }
    
    func setVideoCaptureMirrorMode(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, mirrorMode: MirrorModeApi) throws {
        throw CameraXError(code: "unimplemented-error", message: "setVideoCaptureMirrorMode is not implemented", details: nil)
    }
    
    func isRecording(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> Bool {
        return pigeonInstance.isRecording()
    }
    
    func startRecording(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, outputOptions: FileOutputOptions, audioConfig: AudioConfig, listener: VideoRecordEventConsumer) throws -> Recording {
        let recording = try pigeonInstance.startRecording(outputOptions, audioConfig, listener: listener)
        return recording
    }
}
