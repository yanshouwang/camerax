//
//  CameraXImpl.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

class CameraXImpl: CameraXApiPigeonProxyApiDelegate {
    func pigeonApiNSKeyValueObservationApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiNSKeyValueObservationApi {
        let impl = NSKeyValueObservationImpl()
        return PigeonApiNSKeyValueObservationApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiPermissionManagerApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiPermissionManagerApi {
        let impl = PermissionManagerImpl()
        return PigeonApiPermissionManagerApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiAutoCloseableApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAutoCloseableApi {
        let impl = AutoCloseableImpl()
        return PigeonApiAutoCloseableApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiLocationApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiLocationApi {
        let impl = LocationImpl()
        return PigeonApiLocationApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiCameraSelectorApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCameraSelectorApi {
        let impl = CameraSelectorImpl()
        return PigeonApiCameraSelectorApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiTorchStateObserverApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiTorchStateObserverApi {
        let impl = TorchStateObserverImpl()
        return PigeonApiTorchStateObserverApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiZoomStateApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiZoomStateApi {
        let impl = ZoomStateImpl()
        return PigeonApiZoomStateApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiZoomStateObserverApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiZoomStateObserverApi {
        let impl = ZoomStateObserverImpl()
        return PigeonApiZoomStateObserverApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiImageInfoApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiImageInfoApi {
        let impl = ImageInfoImpl()
        return PigeonApiImageInfoApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiPlaneProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiPlaneProxyApi {
        let impl = ImageProxyImpl.PlaneProxyImpl()
        return PigeonApiPlaneProxyApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiImageProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiImageProxyApi {
        let impl = ImageProxyImpl()
        return PigeonApiImageProxyApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiMetadataApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiMetadataApi {
        let impl = ImageCaptureImpl.MetadataImpl()
        return PigeonApiMetadataApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiOutputFileOptionsApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiOutputFileOptionsApi {
        let impl = ImageCaptureImpl.OutputFileOptionsImpl()
        return PigeonApiOutputFileOptionsApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiOutputFileResultsApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiOutputFileResultsApi {
        let impl = ImageCaptureImpl.OutputFileResultsImpl()
        return PigeonApiOutputFileResultsApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiOnImageCapturedCallbackApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiOnImageCapturedCallbackApi {
        let impl = ImageCaptureImpl.OnImageCapturedCallbackImpl()
        return PigeonApiOnImageCapturedCallbackApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiOnImageSavedCallbackApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiOnImageSavedCallbackApi {
        let impl = ImageCaptureImpl.OnImageSavedCallbackImpl()
        return PigeonApiOnImageSavedCallbackApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiImageAnalyzerApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiImageAnalyzerApi {
        let impl = ImageAnalyzerImpl()
        return PigeonApiImageAnalyzerApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiFileOutputOptionsApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiFileOutputOptionsApi {
        let impl = FileOutputOptionsImpl()
        return PigeonApiFileOutputOptionsApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiAudioConfigApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAudioConfigApi {
        let impl = AudioConfigImpl()
        return PigeonApiAudioConfigApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiAudioStatsApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAudioStatsApi {
        let impl = AudioStatsImpl()
        return PigeonApiAudioStatsApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiRecordingStatsApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiRecordingStatsApi {
        let impl = RecordingStatsImpl()
        return PigeonApiRecordingStatsApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiVideoRecordStatusEventApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordStatusEventApi {
        let impl = VideoRecordEventImpl.StatusImpl()
        return PigeonApiVideoRecordStatusEventApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiVideoRecordStartEventApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordStartEventApi {
        let impl = VideoRecordEventImpl.StartImpl()
        return PigeonApiVideoRecordStartEventApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiVideoRecordPauseEventApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordPauseEventApi {
        let impl = VideoRecordEventImpl.PauseImpl()
        return PigeonApiVideoRecordPauseEventApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiVideoRecordResumeEventApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordResumeEventApi {
        let impl = VideoRecordEventImpl.ResumeImpl()
        return PigeonApiVideoRecordResumeEventApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiOutputResultsApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiOutputResultsApi {
        let impl = OutputResultsImpl()
        return PigeonApiOutputResultsApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiVideoRecordFinalizeEventApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordFinalizeEventApi {
        let impl = VideoRecordEventImpl.FinalizeImpl()
        return PigeonApiVideoRecordFinalizeEventApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiVideoRecordEventConsumerApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordEventConsumerApi {
        let impl = VideoRecordEventConsumerImpl()
        return PigeonApiVideoRecordEventConsumerApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiRecordingApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiRecordingApi {
        let impl = RecordingImpl()
        return PigeonApiRecordingApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiCameraControllerApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCameraControllerApi {
        let impl = CameraControllerImpl()
        return PigeonApiCameraControllerApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiPreviewViewApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiPreviewViewApi {
        let impl = PreviewViewImpl()
        return PigeonApiPreviewViewApi(pigeonRegistrar: registrar, delegate: impl)
    }
}
