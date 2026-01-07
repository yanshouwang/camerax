//
//  CameraXDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

class CameraXDelegate: CameraXApiPigeonProxyApiDelegate {
    func pigeonApiVNDetectFaceRectanglesRequestProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVNDetectFaceRectanglesRequestProxyApi {
        let delegate = VNDetectFaceRectanglesRequestDelegate()
        return PigeonApiVNDetectFaceRectanglesRequestProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVNFaceLandmarkRegionProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVNFaceLandmarkRegionProxyApi {
        let delegate = VNFaceLandmarkRegionDelegate()
        return PigeonApiVNFaceLandmarkRegionProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVNFaceLandmarkRegion2DProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVNFaceLandmarkRegion2DProxyApi {
        let delegate = VNFaceLandmarkRegion2DDelegate()
        return PigeonApiVNFaceLandmarkRegion2DProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVNFaceLandmarksProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVNFaceLandmarksProxyApi {
        let delegate = VNFaceLandmarksDelegate()
        return PigeonApiVNFaceLandmarksProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVNFaceLandmarks2DProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVNFaceLandmarks2DProxyApi {
        let delegate = VNFaceLandmarks2DDelegate()
        return PigeonApiVNFaceLandmarks2DProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVNFaceObservationProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVNFaceObservationProxyApi {
        let delegate = VNFaceObservationDelegate()
        return PigeonApiVNFaceObservationProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVNImageRequestHandlerProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVNImageRequestHandlerProxyApi {
        let delegate = VNImageRequestHandlerDelegate()
        return PigeonApiVNImageRequestHandlerProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVNRequestProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVNRequestProxyApi {
        let delegate = VNRequestDelegate()
        return PigeonApiVNRequestProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVNImageBasedRequestProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVNImageBasedRequestProxyApi {
        let delegate = VNImageBasedRequestDelegate()
        return PigeonApiVNImageBasedRequestProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVNObservationProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVNObservationProxyApi {
        let delegate = VNObservationDelegate()
        return PigeonApiVNObservationProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVNDetectedObjectObservationProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVNDetectedObjectObservationProxyApi {
        let delegate = VNDetectedObjectObservationDelegate()
        return PigeonApiVNDetectedObjectObservationProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVNRectangleObservationProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVNRectangleObservationProxyApi {
        let delegate = VNRectangleObservationDelegate()
        return PigeonApiVNRectangleObservationProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVNDetectBarcodesRequestProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVNDetectBarcodesRequestProxyApi {
        let delegate = VNDetectBarcodesRequestDelegate()
        return PigeonApiVNDetectBarcodesRequestProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVNBarcodeObservationProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVNBarcodeObservationProxyApi {
        let delegate = VNBarcodeObservationDelegate()
        return PigeonApiVNBarcodeObservationProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
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
    
    func pigeonApiCameraSelectorBuilderProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCameraSelectorBuilderProxyApi {
        let delegate = CameraSelectorDelegate.BuilderDelegate()
        return PigeonApiCameraSelectorBuilderProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiCameraSelectorProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCameraSelectorProxyApi {
        let delegate = CameraSelectorDelegate()
        return PigeonApiCameraSelectorProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiCameraStateLiveDataProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCameraStateLiveDataProxyApi {
        let delegate = CameraStateLiveDataDelegate()
        return PigeonApiCameraStateLiveDataProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiCameraStateObserverProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiCameraStateObserverProxyApi {
        let delegate = CameraStateObserverDelegate()
        return PigeonApiCameraStateObserverProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiTorchStateLiveDataProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiTorchStateLiveDataProxyApi {
        let delegate = TorchStateLiveDataDelegate()
        return PigeonApiTorchStateLiveDataProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiTorchStateObserverProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiTorchStateObserverProxyApi {
        let delegate = TorchStateObserverDelegate()
        return PigeonApiTorchStateObserverProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiZoomStateLiveDataProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiZoomStateLiveDataProxyApi {
        let delegate = ZoomStateLiveDataDelegate()
        return PigeonApiZoomStateLiveDataProxyApi(pigeonRegistrar: registrar, delegate: delegate)
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
    
    func pigeonApiFocusMeteringActionBuilderProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiFocusMeteringActionBuilderProxyApi {
        let delegate = FocusMeteringActionDelegate.BuilderDelegate()
        return PigeonApiFocusMeteringActionBuilderProxyApi(pigeonRegistrar: registrar, delegate: delegate)
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
    
    func pigeonApiResolutionSelectorBuilderProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiResolutionSelectorBuilderProxyApi {
        let delegate = ResolutionSelectorDelegate.BuilderDelegate()
        return PigeonApiResolutionSelectorBuilderProxyApi(pigeonRegistrar: registrar, delegate: delegate)
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
    
    func pigeonApiFileOutputOptionsBuilderProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiFileOutputOptionsBuilderProxyApi {
        let delegate = FileOutputOptionsDelegate.BuilderDelegate()
        return PigeonApiFileOutputOptionsBuilderProxyApi(pigeonRegistrar: registrar, delegate: delegate)
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
    
    func pigeonApiVideoRecordEventStatusProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordEventStatusProxyApi {
        let delegate = VideoRecordEventDelegate.StatusDelegate()
        return PigeonApiVideoRecordEventStatusProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVideoRecordEventStartProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordEventStartProxyApi {
        let delegate = VideoRecordEventDelegate.StartDelegate()
        return PigeonApiVideoRecordEventStartProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVideoRecordEventPauseProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordEventPauseProxyApi {
        let delegate = VideoRecordEventDelegate.PauseDelegate()
        return PigeonApiVideoRecordEventPauseProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVideoRecordEventResumeProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordEventResumeProxyApi {
        let delegate = VideoRecordEventDelegate.ResumeDelegate()
        return PigeonApiVideoRecordEventResumeProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiOutputResultsProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiOutputResultsProxyApi {
        let delegate = OutputResultsDelegate()
        return PigeonApiOutputResultsProxyApi(pigeonRegistrar: registrar, delegate: delegate)
    }
    
    func pigeonApiVideoRecordEventFinalizeProxyApi(_ registrar: CameraXApiPigeonProxyApiRegistrar) -> PigeonApiVideoRecordEventFinalizeProxyApi {
        let delegate = VideoRecordEventDelegate.FinalizeDelegate()
        return PigeonApiVideoRecordEventFinalizeProxyApi(pigeonRegistrar: registrar, delegate: delegate)
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
