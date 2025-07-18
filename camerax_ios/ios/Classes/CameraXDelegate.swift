//
//  CameraXDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

class CameraXDelegate: CameraXApiPigeonProxyApiDelegate {
    func pigeonApiPermissionManagerApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiPermissionManagerApi {
        let delegate = PermissionManagerDelegate()
        return PigeonApiPermissionManagerApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAutoCloseableApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAutoCloseableApi {
        let delegate = AutoCloseableDelegate()
        return PigeonApiAutoCloseableApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiLocationApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiLocationApi {
        let delegate = LocationDelegate()
        return PigeonApiLocationApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiSizeApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiSizeApi {
        let delegate = SizeDelegate()
        return PigeonApiSizeApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiCameraSelectorApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCameraSelectorApi {
        let delegate = CameraSelectorDelegate()
        return PigeonApiCameraSelectorApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiCameraStateLiveDataApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCameraStateLiveDataApi {
        let delegate = CameraStateLiveDataDelegate()
        return PigeonApiCameraStateLiveDataApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiCameraStateObserverApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCameraStateObserverApi {
        let delegate = CameraStateObserverDelegate()
        return PigeonApiCameraStateObserverApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiTorchStateLiveDataApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiTorchStateLiveDataApi {
        let delegate = TorchStateLiveDataDelegate()
        return PigeonApiTorchStateLiveDataApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiTorchStateObserverApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiTorchStateObserverApi {
        let delegate = TorchStateObserverDelegate()
        return PigeonApiTorchStateObserverApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiZoomStateApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiZoomStateApi {
        let delegate = ZoomStateDelegate()
        return PigeonApiZoomStateApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiZoomStateLiveDataApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiZoomStateLiveDataApi {
        let delegate = ZoomStateLiveDataDelegate()
        return PigeonApiZoomStateLiveDataApi(pigeonRegistrar: registrar, delegate: delegate)
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
    
    func pigeonApiPlaneProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiPlaneProxyApi {
        let delegate = ImageProxyDelegate.PlaneProxyDelegate()
        return PigeonApiPlaneProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiImageProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiImageProxyApi {
        let delegate = ImageProxyDelegate()
        return PigeonApiImageProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiOnImageCapturedCallbackApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiOnImageCapturedCallbackApi {
        let delegate = ImageCaptureDelegate.OnImageCapturedCallbackDelegate()
        return PigeonApiOnImageCapturedCallbackApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiImageAnalyzerApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiImageAnalyzerApi {
        let delegate = ImageAnalyzerDelegate()
        return PigeonApiImageAnalyzerApi(pigeonRegistrar: registrar, delegate: delegate)
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
