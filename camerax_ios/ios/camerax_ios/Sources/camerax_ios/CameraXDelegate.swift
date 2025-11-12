//
//  CameraXDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

class CameraXDelegate: CameraXApiPigeonProxyApiDelegate {
    func pigeonApiAVMetadataObjectProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAVMetadataObjectProxyApi {
        let delegate = AVMetadataObjectDelegate()
        return PigeonApiAVMetadataObjectProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAVMetadataBodyObjectProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAVMetadataBodyObjectProxyApi {
        let delegate = AVMetadataBodyObjectDelegate()
        return PigeonApiAVMetadataBodyObjectProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiImageProxyConsumerProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiImageProxyConsumerProxyApi {
        let delegate = ImageProxyConsumerDelegate()
        return PigeonApiImageProxyConsumerProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiRotationProviderListenerProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiRotationProviderListenerProxyApi {
        let delegate = RotationProviderDelegate.ListenerDelegate()
        return PigeonApiRotationProviderListenerProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiRotationProviderProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiRotationProviderProxyApi {
        let delegate = RotationProviderDelegate()
        return PigeonApiRotationProviderProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiPermissionManagerProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiPermissionManagerProxyApi {
        let delegate = PermissionManagerDelegate()
        return PigeonApiPermissionManagerProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAutoCloseableProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAutoCloseableProxyApi {
        let delegate = AutoCloseableDelegate()
        return PigeonApiAutoCloseableProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiCLLocationProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCLLocationProxyApi {
        let delegate = CLLocationDelegate()
        return PigeonApiCLLocationProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiSizeProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiSizeProxyApi {
        let delegate = SizeDelegate()
        return PigeonApiSizeProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiSizeFProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiSizeFProxyApi {
        let delegate = SizeFDelegate()
        return PigeonApiSizeFProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiPointProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiPointProxyApi {
        let delegate = PointDelegate()
        return PigeonApiPointProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiPointFProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiPointFProxyApi {
        let delegate = PointFDelegate()
        return PigeonApiPointFProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiRectProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiRectProxyApi {
        let delegate = RectDelegate()
        return PigeonApiRectProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiRectFProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiRectFProxyApi {
        let delegate = RectFDelegate()
        return PigeonApiRectFProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiDurationTupleProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiDurationTupleProxyApi {
        let delegate = DurationTupleDelegate()
        return PigeonApiDurationTupleProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiMeteringPointTupleProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiMeteringPointTupleProxyApi {
        let delegate = MeteringPointTupleDelegate()
        return PigeonApiMeteringPointTupleProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiCameraSelectorProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCameraSelectorProxyApi {
        let delegate = CameraSelectorDelegate()
        return PigeonApiCameraSelectorProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiCameraStateObserverProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCameraStateObserverProxyApi {
        let delegate = CameraStateObserverDelegate()
        return PigeonApiCameraStateObserverProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiTorchStateObserverProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiTorchStateObserverProxyApi {
        let delegate = TorchStateObserverDelegate()
        return PigeonApiTorchStateObserverProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiZoomStateProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiZoomStateProxyApi {
        let delegate = ZoomStateDelegate()
        return PigeonApiZoomStateProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiZoomStateObserverProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiZoomStateObserverProxyApi {
        let delegate = ZoomStateObserverDelegate()
        return PigeonApiZoomStateObserverProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiMeteringPointProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiMeteringPointProxyApi {
        let delegate = MeteringPointDelegate()
        return PigeonApiMeteringPointProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiMeteringPointFactoryProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiMeteringPointFactoryProxyApi {
        let delegate = MeteringPointFactoryDelegate()
        return PigeonApiMeteringPointFactoryProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiSurfaceOrientedMeteringPointFactoryProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiSurfaceOrientedMeteringPointFactoryProxyApi {
        let delegate = SurfaceOrientedMeteringPointFactoryDelegate()
        return PigeonApiSurfaceOrientedMeteringPointFactoryProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiFocusMeteringActionProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiFocusMeteringActionProxyApi {
        let delegate = FocusMeteringActionDelegate()
        return PigeonApiFocusMeteringActionProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiFocusMeteringResultProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiFocusMeteringResultProxyApi {
        let delegate = FocusMeteringResultDelegate()
        return PigeonApiFocusMeteringResultProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiCameraInfoProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCameraInfoProxyApi {
        let delegate = CameraInfoDelegate()
        return PigeonApiCameraInfoProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiCameraControlProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCameraControlProxyApi {
        let delegate = CameraControlDelegate()
        return PigeonApiCameraControlProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiResolutionStrategyProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiResolutionStrategyProxyApi {
        let delegate = ResolutionStrategyDelegate()
        return PigeonApiResolutionStrategyProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiResolutionSelectorProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiResolutionSelectorProxyApi {
        let delegate = ResolutionSelectorDelegate()
        return PigeonApiResolutionSelectorProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiImageInfoProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiImageInfoProxyApi {
        let delegate = ImageInfoDelegate()
        return PigeonApiImageInfoProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiImageProxyPlaneProxyProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiImageProxyPlaneProxyProxyApi {
        let delegate = ImageProxyDelegate.PlaneProxyDelegate()
        return PigeonApiImageProxyPlaneProxyProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiImageProxyProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiImageProxyProxyApi {
        let delegate = ImageProxyDelegate()
        return PigeonApiImageProxyProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiImageCaptureOnImageCapturedCallbackProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiImageCaptureOnImageCapturedCallbackProxyApi {
        let delegate = ImageCaptureDelegate.OnImageCapturedCallbackDelegate()
        return PigeonApiImageCaptureOnImageCapturedCallbackProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiImageAnalysisAnalyzerProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiImageAnalysisAnalyzerProxyApi {
        let delegate = ImageAnalysisDelegate.AnalyzerDelegate()
        return PigeonApiImageAnalysisAnalyzerProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiImageAnalysisAnalyzerImplProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiImageAnalysisAnalyzerImplProxyApi {
        let delegate = ImageAnalysisDelegate.AnalyzerImplDelegate()
        return PigeonApiImageAnalysisAnalyzerImplProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAVMetadataFaceObjectProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAVMetadataFaceObjectProxyApi {
        let delegate = AVMetadataFaceObjectDelegate()
        return PigeonApiAVMetadataFaceObjectProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAVMetadataMachineReadableCodeObjectProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAVMetadataMachineReadableCodeObjectProxyApi {
        let delegate = AVMetadataMachineReadableCodeObjectDelegate()
        return PigeonApiAVMetadataMachineReadableCodeObjectProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAVAnalyzerResultProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAVAnalyzerResultProxyApi {
        let delegate = AVAnalyzerDelegate.ResultDelegate()
        return PigeonApiAVAnalyzerResultProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAVAnalyzerResultConsumerProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAVAnalyzerResultConsumerProxyApi {
        let delegate = AVAnalyzerResultConsumerDelegate()
        return PigeonApiAVAnalyzerResultConsumerProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAVAnalyzerProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAVAnalyzerProxyApi {
        let delegate = AVAnalyzerDelegate()
        return PigeonApiAVAnalyzerProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiOutputOptionsProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiOutputOptionsProxyApi {
        let delegate = OutputOptionsDelegate()
        return PigeonApiOutputOptionsProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiFileOutputOptionsProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiFileOutputOptionsProxyApi {
        let delegate = FileOutputOptionsDelegate()
        return PigeonApiFileOutputOptionsProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAudioConfigProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAudioConfigProxyApi {
        let delegate = AudioConfigDelegate()
        return PigeonApiAudioConfigProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiAudioStatsProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiAudioStatsProxyApi {
        let delegate = AudioStatsDelegate()
        return PigeonApiAudioStatsProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiRecordingStatsProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiRecordingStatsProxyApi {
        let delegate = RecordingStatsDelegate()
        return PigeonApiRecordingStatsProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVideoRecordStatusEventProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordStatusEventProxyApi {
        let delegate = VideoRecordEventDelegate.StatusDelegate()
        return PigeonApiVideoRecordStatusEventProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVideoRecordStartEventProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordStartEventProxyApi {
        let delegate = VideoRecordEventDelegate.StartDelegate()
        return PigeonApiVideoRecordStartEventProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVideoRecordPauseEventProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordPauseEventProxyApi {
        let delegate = VideoRecordEventDelegate.PauseDelegate()
        return PigeonApiVideoRecordPauseEventProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVideoRecordResumeEventProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordResumeEventProxyApi {
        let delegate = VideoRecordEventDelegate.ResumeDelegate()
        return PigeonApiVideoRecordResumeEventProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiOutputResultsProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiOutputResultsProxyApi {
        let delegate = OutputResultsDelegate()
        return PigeonApiOutputResultsProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVideoRecordFinalizeEventProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordFinalizeEventProxyApi {
        let delegate = VideoRecordEventDelegate.FinalizeDelegate()
        return PigeonApiVideoRecordFinalizeEventProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVideoRecordEventConsumerProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordEventConsumerProxyApi {
        let delegate = VideoRecordEventConsumerDelegate()
        return PigeonApiVideoRecordEventConsumerProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiRecordingProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiRecordingProxyApi {
        let delegate = RecordingDelegate()
        return PigeonApiRecordingProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiCameraControllerProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCameraControllerProxyApi {
        let delegate = CameraControllerDelegate()
        return PigeonApiCameraControllerProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiPreviewViewProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiPreviewViewProxyApi {
        let delegate = PreviewViewDelegate()
        return PigeonApiPreviewViewProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
}
