//
//  CameraXImpl.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

class CameraXImpl: CameraXApiPigeonProxyApiDelegate {
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
        let impl = ImageCaptureImpl.OutputResultsImpl()
        return PigeonApiOutputFileResultsApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiOnImageCapturedCallbackApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiOnImageCapturedCallbackApi {
        fatalError()
    }
    
    func pigeonApiOnImageSavedCallbackApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiOnImageSavedCallbackApi {
        fatalError()
    }
    
    func pigeonApiImageAnalyzerApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiImageAnalyzerApi {
        let impl = ImageAnalyzerImpl()
        return PigeonApiImageAnalyzerApi(pigeonRegistrar: registrar, delegate: impl)
    }
    
    func pigeonApiFileOutputOptionsApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiFileOutputOptionsApi {
        fatalError()
    }
    
    func pigeonApiAudioConfigApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAudioConfigApi {
        fatalError()
    }
    
    func pigeonApiAudioStatsApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAudioStatsApi {
        fatalError()
    }
    
    func pigeonApiRecordingStatsApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiRecordingStatsApi {
        fatalError()
    }
    
    func pigeonApiVideoRecordStatusEventApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordStatusEventApi {
        fatalError()
    }
    
    func pigeonApiVideoRecordStartEventApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordStartEventApi {
        fatalError()
    }
    
    func pigeonApiVideoRecordPauseEventApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordPauseEventApi {
        fatalError()
    }
    
    func pigeonApiVideoRecordResumeEventApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordResumeEventApi {
        fatalError()
    }
    
    func pigeonApiOutputResultsApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiOutputResultsApi {
        fatalError()
    }
    
    func pigeonApiVideoRecordFinalizeEventApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordFinalizeEventApi {
        fatalError()
    }
    
    func pigeonApiVideoRecordEventConsumerApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordEventConsumerApi {
        fatalError()
    }
    
    func pigeonApiRecordingApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiRecordingApi {
        fatalError()
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
