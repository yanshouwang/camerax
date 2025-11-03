//
//  CameraXDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

class CameraXDelegate: CameraXApiPigeonProxyApiDelegate {
    func pigeonApiRotationProviderListenerApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiRotationProviderListenerApi {
        let delegate = RotationProviderDelegate.ListenerDelegate()
        return PigeonApiRotationProviderListenerApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiRotationProviderApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiRotationProviderApi {
        let delegate = RotationProviderDelegate()
        return PigeonApiRotationProviderApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiPermissionManagerApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiPermissionManagerApi {
        let delegate = PermissionManagerDelegate()
        return PigeonApiPermissionManagerApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAutoCloseableApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAutoCloseableApi {
        let delegate = AutoCloseableDelegate()
        return PigeonApiAutoCloseableApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiCLLocationApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCLLocationApi {
        let delegate = CLLocationDelegate()
        return PigeonApiCLLocationApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiSizeApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiSizeApi {
        let delegate = SizeDelegate()
        return PigeonApiSizeApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiSizeFApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiSizeFApi {
        let delegate = SizeFDelegate()
        return PigeonApiSizeFApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiPointApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiPointApi {
        let delegate = PointDelegate()
        return PigeonApiPointApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiPointFApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiPointFApi {
        let delegate = PointFDelegate()
        return PigeonApiPointFApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiRectApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiRectApi {
        let delegate = RectDelegate()
        return PigeonApiRectApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiRectFApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiRectFApi {
        let delegate = RectFDelegate()
        return PigeonApiRectFApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiCameraSelectorApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCameraSelectorApi {
        let delegate = CameraSelectorDelegate()
        return PigeonApiCameraSelectorApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiCameraStateObserverApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCameraStateObserverApi {
        let delegate = CameraStateObserverDelegate()
        return PigeonApiCameraStateObserverApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiTorchStateObserverApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiTorchStateObserverApi {
        let delegate = TorchStateObserverDelegate()
        return PigeonApiTorchStateObserverApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiZoomStateApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiZoomStateApi {
        let delegate = ZoomStateDelegate()
        return PigeonApiZoomStateApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiZoomStateObserverApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiZoomStateObserverApi {
        let delegate = ZoomStateObserverDelegate()
        return PigeonApiZoomStateObserverApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiMeteringPointApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiMeteringPointApi {
        let delegate = MeteringPointDelegate()
        return PigeonApiMeteringPointApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiMeteringPointFactoryApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiMeteringPointFactoryApi {
        let delegate = MeteringPointFactoryDelegate()
        return PigeonApiMeteringPointFactoryApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiSurfaceOrientedMeteringPointFactoryApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiSurfaceOrientedMeteringPointFactoryApi {
        let delegate = SurfaceOrientedMeteringPointFactoryDelegate()
        return PigeonApiSurfaceOrientedMeteringPointFactoryApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiMeteringPointTupleApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiMeteringPointTupleApi {
        let delegate = FocusMeteringActionDelegate.MeteringPointTupleDelegate()
        return PigeonApiMeteringPointTupleApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiDurationTupleApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiDurationTupleApi {
        let delegate = FocusMeteringActionDelegate.DurationTupleDelegate()
        return PigeonApiDurationTupleApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiFocusMeteringActionApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiFocusMeteringActionApi {
        let delegate = FocusMeteringActionDelegate()
        return PigeonApiFocusMeteringActionApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiFocusMeteringResultApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiFocusMeteringResultApi {
        let delegate = FocusMeteringResultDelegate()
        return PigeonApiFocusMeteringResultApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiCameraInfoApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCameraInfoApi {
        let delegate = CameraInfoDelegate()
        return PigeonApiCameraInfoApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiCameraControlApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCameraControlApi {
        let delegate = CameraControlDelegate()
        return PigeonApiCameraControlApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiResolutionStrategyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiResolutionStrategyApi {
        let delegate = ResolutionStrategyDelegate()
        return PigeonApiResolutionStrategyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiResolutionSelectorApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiResolutionSelectorApi {
        let delegate = ResolutionSelectorDelegate()
        return PigeonApiResolutionSelectorApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiImageInfoApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiImageInfoApi {
        let delegate = ImageInfoDelegate()
        return PigeonApiImageInfoApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiImageProxyPlaneProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiImageProxyPlaneProxyApi {
        let delegate = ImageProxyDelegate.PlaneProxyDelegate()
        return PigeonApiImageProxyPlaneProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiImageProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiImageProxyApi {
        let delegate = ImageProxyDelegate()
        return PigeonApiImageProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiImageCaptureOnImageCapturedCallbackApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiImageCaptureOnImageCapturedCallbackApi {
        let delegate = ImageCaptureDelegate.OnImageCapturedCallbackDelegate()
        return PigeonApiImageCaptureOnImageCapturedCallbackApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiImageAnalyzerApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiImageAnalyzerApi {
        let delegate = ImageAnalyzerDelegate()
        return PigeonApiImageAnalyzerApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAVMetadataCatBodyObjectApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAVMetadataCatBodyObjectApi {
        let delegate = AVMetadataCatBodyObjectDelegate()
        return PigeonApiAVMetadataCatBodyObjectApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAVMetadataDogBodyObjectApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAVMetadataDogBodyObjectApi {
        let delegate = AVMetadataDogBodyObjectDelegate()
        return PigeonApiAVMetadataDogBodyObjectApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAVMetadataHumanBodyObjectApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAVMetadataHumanBodyObjectApi {
        let delegate = AVMetadataHumanBodyObjectDelegate()
        return PigeonApiAVMetadataHumanBodyObjectApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAVMetadataHumanFullBodyObjectApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAVMetadataHumanFullBodyObjectApi {
        let delegate = AVMetadataHumanFullBodyObjectDelegate()
        return PigeonApiAVMetadataHumanFullBodyObjectApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAVMetadataFaceObjectApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAVMetadataFaceObjectApi {
        let delegate = AVMetadataFaceObjectDelegate()
        return PigeonApiAVMetadataFaceObjectApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAVMetadataMachineReadableCodeObjectApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAVMetadataMachineReadableCodeObjectApi {
        let delegate = AVMetadataMachineReadableCodeObjectDelegate()
        return PigeonApiAVMetadataMachineReadableCodeObjectApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAVMetadataSalientObjectApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAVMetadataSalientObjectApi {
        let delegate = AVMetadataSalientObjectDelegate()
        return PigeonApiAVMetadataSalientObjectApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAVAnalyzerResultApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAVAnalyzerResultApi {
        let delegate = AVAnalyzerDelegate.ResultDelegate()
        return PigeonApiAVAnalyzerResultApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAVAnalyzerResultConsumerApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAVAnalyzerResultConsumerApi {
        let delegate = AVAnalyzerResultConsumerDelegate()
        return PigeonApiAVAnalyzerResultConsumerApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAVAnalyzerApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAVAnalyzerApi {
        let delegate = AVAnalyzerDelegate()
        return PigeonApiAVAnalyzerApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiOutputOptionsApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiOutputOptionsApi {
        let delegate = OutputOptionsDelegate()
        return PigeonApiOutputOptionsApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiFileOutputOptionsApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiFileOutputOptionsApi {
        let delegate = FileOutputOptionsDelegate()
        return PigeonApiFileOutputOptionsApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAudioConfigApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAudioConfigApi {
        let delegate = AudioConfigDelegate()
        return PigeonApiAudioConfigApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAudioStatsApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAudioStatsApi {
        let delegate = AudioStatsDelegate()
        return PigeonApiAudioStatsApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiRecordingStatsApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiRecordingStatsApi {
        let delegate = RecordingStatsDelegate()
        return PigeonApiRecordingStatsApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVideoRecordStatusEventApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordStatusEventApi {
        let delegate = VideoRecordEventDelegate.StatusDelegate()
        return PigeonApiVideoRecordStatusEventApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVideoRecordStartEventApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordStartEventApi {
        let delegate = VideoRecordEventDelegate.StartDelegate()
        return PigeonApiVideoRecordStartEventApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVideoRecordPauseEventApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordPauseEventApi {
        let delegate = VideoRecordEventDelegate.PauseDelegate()
        return PigeonApiVideoRecordPauseEventApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVideoRecordResumeEventApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordResumeEventApi {
        let delegate = VideoRecordEventDelegate.ResumeDelegate()
        return PigeonApiVideoRecordResumeEventApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiOutputResultsApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiOutputResultsApi {
        let delegate = OutputResultsDelegate()
        return PigeonApiOutputResultsApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVideoRecordFinalizeEventApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordFinalizeEventApi {
        let delegate = VideoRecordEventDelegate.FinalizeDelegate()
        return PigeonApiVideoRecordFinalizeEventApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVideoRecordEventConsumerApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordEventConsumerApi {
        let delegate = VideoRecordEventConsumerDelegate()
        return PigeonApiVideoRecordEventConsumerApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiRecordingApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiRecordingApi {
        let delegate = RecordingDelegate()
        return PigeonApiRecordingApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiCameraControllerApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCameraControllerApi {
        let delegate = CameraControllerDelegate()
        return PigeonApiCameraControllerApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiPreviewViewApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiPreviewViewApi {
        let delegate = PreviewViewDelegate()
        return PigeonApiPreviewViewApi(pigeonRegistrar: registrar, delegate: delegate)
    }
}
