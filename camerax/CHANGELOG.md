## 1.1.1

* Android: Fix the ANR crash caused by PermissionManager.requestPermissions.
* iOS: Fix PreviewView is stretched when using front camera on iPhone 17 Pro.
* iOS: Fix incorrect PlatformViewLink with UiKitView.

## 1.1.0

* fvm use 3.35.7
* Make avfoundation.AVMetadataObjects async methods to sync properties.
* Add ml.Detector#process method.
* Add vision APIs.
* Add visionx APIs.
* Migrate flutter thread model changes.

## 1.0.2

* Add `RotationProvider` API.
* Add vision APIs.
* Android: No longer support `AVAnalyzer`, use `VisionAnalyzer` instead.
* iOS: Migrate to Swift Package Manager.
* iOS: No longer support `MlKitAnalyzer`, use `VisionAnalyzer` instead.

## 1.0.1

* iOS: Fix UnimplementedError when create SurfaceOrientedMeteringPointFactory and FocusMeteringAction.
* iOS: Fix videoPreviewLayer is nil when setImageAnalyzer called before bind.
* iOS: Fix issue when set setImageAnalysisResolutionSelector.
* iOS: Fix TypeError when calling getCameraInfo & getCameraControl.

## 1.0.0

* Add avfoundation APIs.
* Add camera2 APIs.
* Add common APIs.
* Add core APIs.
* Add ml APIs.
* Add video APIs.
* Add view APIs.