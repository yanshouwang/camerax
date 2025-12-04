//
//  CameraControllerDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

class CameraControllerDelegate: PigeonApiDelegateCameraControllerProxyApi {
    func observeTorchState(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, observer: TorchStateObserver) throws {
        pigeonInstance.getTorchState().observe(observer)
    }
    
    func removeTorchStateObserver(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, observer: TorchStateObserver) throws {
        pigeonInstance.getTorchState().removeObserver(observer)
    }
    
    func observeZoomState(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, observer: ZoomStateObserver) throws {
        pigeonInstance.getZoomState().observe(observer)
    }
    
    func removeZoomStateObserver(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, observer: ZoomStateObserver) throws {
        pigeonInstance.getZoomState().removeObserver(observer)
    }
    
    func pigeonDefaultConstructor(pigeonApi: PigeonApiCameraControllerProxyApi) throws -> CameraController {
        return CameraController()
    }
    
    func bind(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws {
        try pigeonInstance.bind()
    }
    
    func unbind(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws {
        pigeonInstance.unbind()
    }
    
    func hasCamera(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, cameraSelector: CameraSelector) throws -> Bool {
        return pigeonInstance.hasCamera(cameraSelector: cameraSelector)
    }
    
    func getCameraSelector(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws -> CameraSelector {
        return pigeonInstance.getCameraSelector()
    }
    
    func setCameraSelector(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, cameraSelector: CameraSelector) throws {
        try pigeonInstance.setCameraSelector(cameraSelector)
    }
    
    func getCameraInfo(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws -> CameraInfo? {
        return pigeonInstance.getCameraInfo()
    }
    
    func getCameraControl(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws -> CameraControl? {
        return pigeonInstance.getCameraControl()
    }
    
    func getTorchState(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws -> TorchStateApi? {
        return pigeonInstance.getTorchState().getValue()?.api
    }
    
    func enableTorch(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, torchEnabled: Bool) throws {
        try pigeonInstance.enableTorch(torchEnabled)
    }
    
    func getZoomState(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws -> ZoomState? {
        return pigeonInstance.getZoomState().getValue()
    }
    
    func setZoomRatio(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, zoomRatio: Double) throws {
        try pigeonInstance.setZoomRatio(zoomRatio)
    }
    
    func setLinearZoom(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, linearZoom: Double) throws {
        try pigeonInstance.setLinearZoom(linearZoom)
    }
    
    func isPinchToZoomEnabled(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws -> Bool {
        return pigeonInstance.isPinchToZoomEnabled()
    }
    
    func setPinchToZoomEnabled(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, enabled: Bool) throws {
        pigeonInstance.setPinchToZoomEnabled(enabled)
    }
    
    func isTapToFocusEnabled(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws -> Bool {
        return pigeonInstance.isTapToFocusEnabled()
    }
    
    func setTapToFocusEnabled(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, enabled: Bool) throws {
        pigeonInstance.setTapToFocusEnabled(enabled)
    }
    
    func isImageCaptureEnabled(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "isImageCaptureEnabled is not implemented", details: nil)
    }
    
    func isImageAnalysisEnabled(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "isImageAnalysisEnabled is not implemented", details: nil)
    }
    
    func isVideoCaptureEnabled(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws -> Bool {
        throw CameraXError(code: "unimplemented-error", message: "isVideoCaptureEnabled is not implemented", details: nil)
    }
    
    func setEnabledUseCases(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, enabledUseCases: [CameraControllerUseCaseApi]) throws {
        throw CameraXError(code: "unimplemented-error", message: "setEnabledUseCases is not implemented", details: nil)
    }
    
    func getImageCaptureMode(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws -> ImageCaptureCaptureModeApi {
        throw CameraXError(code: "unimplemented-error", message: "getImageCaptureMode is not implemented", details: nil)
    }
    
    func setImageCaptureMode(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, captureMode: ImageCaptureCaptureModeApi) throws {
        throw CameraXError(code: "unimplemented-error", message: "setImageCaptureMode is not implemented", details: nil)
    }
    
    func getImageCaptureFlashMode(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws -> ImageCaptureFlashModeApi {
        return try pigeonInstance.getImageCaptureFlashMode().api
    }
    
    func setImageCaptureFlashMode(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, flashMode: ImageCaptureFlashModeApi) throws {
        guard let mode = flashMode.delegateOrNil else {
            throw CameraXError(code: "nil-error", message: "mode is nil", details: nil)
        }
        pigeonInstance.setImageCaptureFlashMode(mode)
    }
    
    func takePicture1(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, imageCapturedCallback: any ImageCapture.OnImageCapturedCallback) throws {
        try pigeonInstance.takePicture(imageCapturedCallback)
    }
    
    func getImageAnalysisResolutionSelector(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws -> ResolutionSelector? {
        return pigeonInstance.getImageAnalysisResolutionSelector()
    }
    
    func setImageAnalysisResolutionSelector(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, resolutionSelector: ResolutionSelector?) throws {
        try pigeonInstance.setImageAnalysisResolutionSelector(resolutionSelector)
    }
    
    func getImageAnalysisBackpressureStrategy(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws -> ImageAnalysisStrategyApi {
        throw CameraXError(code: "unimplemented-error", message: "getImageAnalysisBackpressureStrategy is not implemented", details: nil)
    }
    
    func setImageAnalysisBackpressureStrategy(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, strategy: ImageAnalysisStrategyApi) throws {
        throw CameraXError(code: "unimplemented-error", message: "setImageAnalysisBackpressureStrategy is not implemented", details: nil)
    }
    
    func getImageAnalysisImageQueueDepth(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws -> Int64 {
        throw CameraXError(code: "unimplemented-error", message: "getImageAnalysisImageQueueDepth is not implemented", details: nil)
    }
    
    func setImageAnalysisImageQueueDepth(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, depth: Int64) throws {
        throw CameraXError(code: "unimplemented-error", message: "setImageAnalysisImageQueueDepth is not implemented", details: nil)
    }
    
    func getImageAnalysisOutputImageFormat(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws -> ImageAnalysisOutputImageFormatApi {
        return try pigeonInstance.getImageAnalysisOutputImageFormat().api
    }
    
    func setImageAnalysisOutputImageFormat(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, imageAnalysisOutputImageFormat: ImageAnalysisOutputImageFormatApi) throws {
        pigeonInstance.setImageAnalysisOutputImageFormat(imageAnalysisOutputImageFormat.delegate)
    }
    
    func setImageAnalysisAnalyzer(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, analyzer: ImageAnalysis.Analyzer) throws {
        try pigeonInstance.setImageAnalysisAnalyzer(analyzer)
    }
    
    func clearImageAnalysisAnalyzer(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws {
        pigeonInstance.clearImageAnalysisAnalyzer()
    }
    
    func getVideoCaptureMirrorMode(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws -> MirrorModeApi {
        throw CameraXError(code: "unimplemented-error", message: "getVideoCaptureMirrorMode is not implemented", details: nil)
    }
    
    func setVideoCaptureMirrorMode(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, mirrorMode: MirrorModeApi) throws {
        throw CameraXError(code: "unimplemented-error", message: "setVideoCaptureMirrorMode is not implemented", details: nil)
    }
    
    func isRecording(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController) throws -> Bool {
        return pigeonInstance.isRecording()
    }
    
    func startRecording1(pigeonApi: PigeonApiCameraControllerProxyApi, pigeonInstance: CameraController, outputOptions: FileOutputOptions, audioConfig: AudioConfig, listener: VideoRecordEventConsumer) throws -> Recording {
        let recording = try pigeonInstance.startRecording(outputOptions, audioConfig, listener: listener)
        return recording
    }
}
