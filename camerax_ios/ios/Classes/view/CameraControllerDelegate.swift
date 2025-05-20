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
    
    func initialize(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, completion: @escaping (Result<Void, any Error>) -> Void) {
        do {
            throw CameraXError(code: "unimplemented-error", message: "initialize is not implemented", details: nil)
        } catch {
            completion(.failure(error))
        }
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
    
    func getTorchState(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> TorchStateApi? {
        return pigeonInstance.torchState?.api
    }
    
    func observeTorchState(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, observer: TorchStateObserver) throws -> NSKeyValueObservation {
        return pigeonInstance.observe(\.torchState, options: .new) { _, change in
            guard let newValue = change.newValue, let torchState = newValue else { return }
            observer.onChanged(torchState)
        }
    }
    
    func enableTorch(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, torchEnabled: Bool) throws {
        try pigeonInstance.enableTorch(torchEnabled)
    }
    
    func getZoomState(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> ZoomState? {
        return pigeonInstance.zoomState
    }
    
    func observeZoomState(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, observer: ZoomStateObserver) throws -> NSKeyValueObservation {
        return pigeonInstance.observe(\.zoomState, options: .new) { _, change in
            guard let newValue = change.newValue, let zoomState = newValue else { return }
            observer.onChanged(zoomState)
        }
    }
    
    func setZoomRatio(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, zoomRatio: Double) throws {
        try pigeonInstance.setZoomRatio(zoomRatio)
    }
    
    func setLinearZoom(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, linearZoom: Double) throws {
        try pigeonInstance.setLinearZoom(linearZoom)
    }
    
    func isPinchToZoomEnabled(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> Bool {
        return pigeonInstance.isPinchToZoomEnabled
    }
    
    func setPinchToZoomEnabled(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, enabled: Bool) throws {
        pigeonInstance.isPinchToZoomEnabled = enabled
    }
    
    func isTapToFocusEnabled(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController) throws -> Bool {
        return pigeonInstance.isTapToFocusEnabled
    }
    
    func setTapToFocusEnabled(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, enabled: Bool) throws {
        pigeonInstance.isTapToFocusEnabled = enabled
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
        throw CameraXError(code: "unimplemented-error", message: "getImageCaptureFlashMode is not implemented", details: nil)
    }
    
    func setImageCaptureFlashMode(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, flashMode: FlashModeApi) throws {
        throw CameraXError(code: "unimplemented-error", message: "setImageCaptureFlashMode is not implemented", details: nil)
    }
    
    func takePictureToMemory(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, capturedCallback: any ImageCapture.OnImageCapturedCallback, completion: @escaping (Result<Void, any Error>) -> Void) {
        do {
            throw CameraXError(code: "unimplemented-error", message: "takePictureToMemory is not implemented", details: nil)
        } catch {
            completion(.failure(error))
        }
    }
    
    func takePictureToFile(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, outputFileOptions: ImageCapture.OutputFileOptions, savedCallback: any ImageCapture.OnImageSavedCallback, completion: @escaping (Result<Void, any Error>) -> Void) {
        do {
            throw CameraXError(code: "unimplemented-error", message: "takePictureToFile is not implemented", details: nil)
        } catch {
            completion(.failure(error))
        }
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
        return pigeonInstance.imageAnalysisOutputImageFormat.api
    }
    
    func setImageAnalysisOutputImageFormat(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, imageAnalysisOutputImageFormat: ImageFormatApi) throws {
        pigeonInstance.imageAnalysisOutputImageFormat = imageAnalysisOutputImageFormat.delegate
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
        throw CameraXError(code: "unimplemented-error", message: "isRecording is not implemented", details: nil)
    }
    
    func startRecording(pigeonApi: PigeonApiCameraControllerApi, pigeonInstance: CameraController, outputOptions: FileOutputOptions, audioConfig: AudioConfig, listener: VideoRecordEventConsumer) throws -> Recording {
        throw CameraXError(code: "unimplemented-error", message: "startRecording is not implemented", details: nil)
    }
}
