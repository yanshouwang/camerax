package dev.hebei.camerax_android.legacy

import android.app.Activity
import android.content.Context
import dev.hebei.camerax_android.legacy.common.*
import dev.hebei.camerax_android.legacy.common.IntRange
import dev.hebei.camerax_android.legacy.core.*
import dev.hebei.camerax_android.legacy.core.resolutionselector.AspectRatioStrategy
import dev.hebei.camerax_android.legacy.core.resolutionselector.ResolutionFilter
import dev.hebei.camerax_android.legacy.core.resolutionselector.ResolutionSelector
import dev.hebei.camerax_android.legacy.core.resolutionselector.ResolutionStrategy
import dev.hebei.camerax_android.legacy.ml.*
import dev.hebei.camerax_android.legacy.ml.barcode.Barcode
import dev.hebei.camerax_android.legacy.ml.barcode.BarcodeScanner
import dev.hebei.camerax_android.legacy.ml.barcode.BarcodeScannerOptions
import dev.hebei.camerax_android.legacy.ml.barcode.ZoomSuggestionOptions
import dev.hebei.camerax_android.legacy.ml.face.Face
import dev.hebei.camerax_android.legacy.ml.face.FaceContour
import dev.hebei.camerax_android.legacy.ml.face.FaceDetector
import dev.hebei.camerax_android.legacy.ml.face.FaceDetectorOptions
import dev.hebei.camerax_android.legacy.ml.face.FaceLandmark
import dev.hebei.camerax_android.legacy.video.*
import dev.hebei.camerax_android.legacy.view.CameraController
import dev.hebei.camerax_android.legacy.view.LifecycleCameraController
import dev.hebei.camerax_android.legacy.view.PreviewView
import dev.hebei.camerax_android.legacy.view.video.AudioConfig
import io.flutter.plugin.common.BinaryMessenger

class CameraXRegistrar(val context: Context, messenger: BinaryMessenger) : CameraXPigeonProxyApiRegistrar(messenger) {
    var activity: Activity? = null

    override fun getPigeonApiPermissionManager(): PigeonApiPermissionManager {
        return PermissionManager(this)
    }

    override fun getPigeonApiAutoCloseable(): PigeonApiAutoCloseable {
        return AutoCloseable(this)
    }

    override fun getPigeonApiLocation(): PigeonApiLocation {
        return Location(this)
    }

    override fun getPigeonApiSize(): PigeonApiSize {
        return Size(this)
    }

    override fun getPigeonApiPoint(): PigeonApiPoint {
        return Point(this)
    }

    override fun getPigeonApiPointF(): PigeonApiPointF {
        return PointF(this)
    }

    override fun getPigeonApiRect(): PigeonApiRect {
        return Rect(this)
    }

    override fun getPigeonApiIntRange(): PigeonApiIntRange {
        return IntRange(this)
    }

    override fun getPigeonApiCameraSelector(): PigeonApiCameraSelector {
        return CameraSelector(this)
    }

    override fun getPigeonApiCameraStateLiveData(): PigeonApiCameraStateLiveData {
        return CameraStateLiveData(this)
    }

    override fun getPigeonApiCameraStateObserver(): PigeonApiCameraStateObserver {
        return CameraStateObserver(this)
    }

    override fun getPigeonApiTorchStateLiveData(): PigeonApiTorchStateLiveData {
        return TorchStateLiveData(this)
    }

    override fun getPigeonApiTorchStateObserver(): PigeonApiTorchStateObserver {
        return TorchStateObserver(this)
    }

    override fun getPigeonApiZoomState(): PigeonApiZoomState {
        return ZoomState(this)
    }

    override fun getPigeonApiZoomStateLiveData(): PigeonApiZoomStateLiveData {
        return ZoomStateLiveData(this)
    }

    override fun getPigeonApiZoomStateObserver(): PigeonApiZoomStateObserver {
        return ZoomStateObserver(this)
    }

    override fun getPigeonApiExposureState(): PigeonApiExposureState {
        return ExposureState(this)
    }

    override fun getPigeonApiMeteringPoint(): PigeonApiMeteringPoint {
        return MeteringPoint(this)
    }

    override fun getPigeonApiMeteringPointFactory(): PigeonApiMeteringPointFactory {
        return MeteringPointFactory(this)
    }

    override fun getPigeonApiSurfaceOrientedMeteringPointFactory(): PigeonApiSurfaceOrientedMeteringPointFactory {
        return SurfaceOrientedMeteringPointFactory(this)
    }

    override fun getPigeonApiMeteringPointArgs(): PigeonApiMeteringPointArgs {
        return FocusMeteringAction.MeteringPointArgs(this)
    }

    override fun getPigeonApiDurationArgs(): PigeonApiDurationArgs {
        return FocusMeteringAction.DurationArgs(this)
    }

    override fun getPigeonApiFocusMeteringAction(): PigeonApiFocusMeteringAction {
        return FocusMeteringAction(this)
    }

    override fun getPigeonApiFocusMeteringResult(): PigeonApiFocusMeteringResult {
        return FocusMeteringResult(this)
    }

    override fun getPigeonApiDynamicRange(): PigeonApiDynamicRange {
        return DynamicRange(this)
    }

    override fun getPigeonApiCameraInfo(): PigeonApiCameraInfo {
        return CameraInfo(this)
    }

    override fun getPigeonApiCameraControl(): PigeonApiCameraControl {
        return CameraControl(this)
    }

    override fun getPigeonApiAspectRatioStrategy(): PigeonApiAspectRatioStrategy {
        return AspectRatioStrategy(this)
    }

    override fun getPigeonApiResolutionFilter(): PigeonApiResolutionFilter {
        return ResolutionFilter(this)
    }

    override fun getPigeonApiResolutionStrategy(): PigeonApiResolutionStrategy {
        return ResolutionStrategy(this)
    }

    override fun getPigeonApiResolutionSelector(): PigeonApiResolutionSelector {
        return ResolutionSelector(this)
    }

    override fun getPigeonApiImageInfo(): PigeonApiImageInfo {
        return ImageInfo(this)
    }

    override fun getPigeonApiPlaneProxy(): PigeonApiPlaneProxy {
        return ImageProxy.PlaneProxy(this)
    }

    override fun getPigeonApiImageProxy(): PigeonApiImageProxy {
        return ImageProxy(this)
    }

    override fun getPigeonApiMetadata(): PigeonApiMetadata {
        return ImageCapture.Metadata(this)
    }

    override fun getPigeonApiOutputFileOptions(): PigeonApiOutputFileOptions {
        return ImageCapture.OutputFileOptions(this)
    }

    override fun getPigeonApiOutputFileResults(): PigeonApiOutputFileResults {
        return ImageCapture.OutputFileResults(this)
    }

    override fun getPigeonApiOnImageCapturedCallback(): PigeonApiOnImageCapturedCallback {
        return ImageCapture.OnImageCapturedCallback(this)
    }

    override fun getPigeonApiOnImageSavedCallback(): PigeonApiOnImageSavedCallback {
        return ImageCapture.OnImageSavedCallback(this)
    }

    override fun getPigeonApiAnalyzer(): PigeonApiAnalyzer {
        return ImageAnalysis.Analyzer(this)
    }

    override fun getPigeonApiRawAnalyzer(): PigeonApiRawAnalyzer {
        return RawAnalyzer(this)
    }

    override fun getPigeonApiDetector(): PigeonApiDetector {
        return Detector(this)
    }

    override fun getPigeonApiAddress(): PigeonApiAddress {
        return Barcode.Address(this)
    }

    override fun getPigeonApiCalendarDateTime(): PigeonApiCalendarDateTime {
        return Barcode.CalendarDateTime(this)
    }

    override fun getPigeonApiCalendarEvent(): PigeonApiCalendarEvent {
        return Barcode.CalendarEvent(this)
    }

    override fun getPigeonApiContactInfo(): PigeonApiContactInfo {
        return Barcode.ContactInfo(this)
    }

    override fun getPigeonApiDriverLicense(): PigeonApiDriverLicense {
        return Barcode.DriverLicense(this)
    }

    override fun getPigeonApiEmail(): PigeonApiEmail {
        return Barcode.Email(this)
    }

    override fun getPigeonApiGeoPoint(): PigeonApiGeoPoint {
        return Barcode.GeoPoint(this)
    }

    override fun getPigeonApiPersonName(): PigeonApiPersonName {
        return Barcode.PersonName(this)
    }

    override fun getPigeonApiPhone(): PigeonApiPhone {
        return Barcode.Phone(this)
    }

    override fun getPigeonApiSms(): PigeonApiSms {
        return Barcode.Sms(this)
    }

    override fun getPigeonApiUrlBookmark(): PigeonApiUrlBookmark {
        return Barcode.UrlBookmark(this)
    }

    override fun getPigeonApiWiFi(): PigeonApiWiFi {
        return Barcode.WiFi(this)
    }

    override fun getPigeonApiBarcode(): PigeonApiBarcode {
        return Barcode(this)
    }

    override fun getPigeonApiZoomCallback(): PigeonApiZoomCallback {
        return ZoomSuggestionOptions.ZoomCallback(this)
    }

    override fun getPigeonApiZoomSuggestionOptions(): PigeonApiZoomSuggestionOptions {
        return ZoomSuggestionOptions(this)
    }

    override fun getPigeonApiBarcodeScannerOptions(): PigeonApiBarcodeScannerOptions {
        return BarcodeScannerOptions(this)
    }

    override fun getPigeonApiBarcodeScanner(): PigeonApiBarcodeScanner {
        return BarcodeScanner(this)
    }

    override fun getPigeonApiFaceDetectorOptions(): PigeonApiFaceDetectorOptions {
        return FaceDetectorOptions(this)
    }

    override fun getPigeonApiFaceContour(): PigeonApiFaceContour {
        return FaceContour(this)
    }

    override fun getPigeonApiFaceLandmark(): PigeonApiFaceLandmark {
        return FaceLandmark(this)
    }

    override fun getPigeonApiFace(): PigeonApiFace {
        return Face(this)
    }

    override fun getPigeonApiFaceDetector(): PigeonApiFaceDetector {
        return FaceDetector(this)
    }

    override fun getPigeonApiMlKitAnalyzerResult(): PigeonApiMlKitAnalyzerResult {
        return MlKitAnalyzer.Result(this)
    }

    override fun getPigeonApiMlKitAnalyzerResultConsumer(): PigeonApiMlKitAnalyzerResultConsumer {
        return MlKitAnalyzerResultConsumer(this)
    }

    override fun getPigeonApiMlKitAnalyzer(): PigeonApiMlKitAnalyzer {
        return MlKitAnalyzer(this)
    }

    override fun getPigeonApiQuality(): PigeonApiQuality {
        return Quality(this)
    }

    override fun getPigeonApiFallbackStrategy(): PigeonApiFallbackStrategy {
        return FallbackStrategy(this)
    }

    override fun getPigeonApiQualitySelector(): PigeonApiQualitySelector {
        return QualitySelector(this)
    }

    override fun getPigeonApiFileOutputOptions(): PigeonApiFileOutputOptions {
        return FileOutputOptions(this)
    }

    override fun getPigeonApiAudioConfig(): PigeonApiAudioConfig {
        return AudioConfig(this)
    }

    override fun getPigeonApiAudioStats(): PigeonApiAudioStats {
        return AudioStats(this)
    }

    override fun getPigeonApiRecordingStats(): PigeonApiRecordingStats {
        return RecordingStats(this)
    }

    override fun getPigeonApiVideoRecordEvent(): PigeonApiVideoRecordEvent {
        return VideoRecordEvent(this)
    }

    override fun getPigeonApiVideoRecordStatusEvent(): PigeonApiVideoRecordStatusEvent {
        return VideoRecordEvent.Status(this)
    }

    override fun getPigeonApiVideoRecordStartEvent(): PigeonApiVideoRecordStartEvent {
        return VideoRecordEvent.Start(this)
    }

    override fun getPigeonApiVideoRecordPauseEvent(): PigeonApiVideoRecordPauseEvent {
        return VideoRecordEvent.Pause(this)
    }

    override fun getPigeonApiVideoRecordResumeEvent(): PigeonApiVideoRecordResumeEvent {
        return VideoRecordEvent.Resume(this)
    }

    override fun getPigeonApiVideoRecordFinalizeEvent(): PigeonApiVideoRecordFinalizeEvent {
        return VideoRecordEvent.Finalize(this)
    }

    override fun getPigeonApiOutputResults(): PigeonApiOutputResults {
        return OutputResults(this)
    }

    override fun getPigeonApiVideoRecordEventConsumer(): PigeonApiVideoRecordEventConsumer {
        return VideoRecordEventConsumer(this)
    }

    override fun getPigeonApiRecording(): PigeonApiRecording {
        return Recording(this)
    }

    override fun getPigeonApiCameraController(): PigeonApiCameraController {
        return CameraController(this)
    }

    override fun getPigeonApiLifecycleCameraController(): PigeonApiLifecycleCameraController {
        return LifecycleCameraController(this)
    }

    override fun getPigeonApiPreviewView(): PigeonApiPreviewView {
        return PreviewView(this)
    }
}