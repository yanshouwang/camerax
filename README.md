# camerax

A camera plugin for flutter, which use CameraX on Android, native API on iOS, supports 
preview, image & ML analysis, image capture and video capture.

## Getting Started

Add `camerax` as a [dependency in your pubspec.yaml file](https://flutter.dev/using-packages/).

```
dependencies:
  camerax: ^<latest-version>
```

### Android

Make sure you have a `miniSdkVersion` with 21 or higher in your `android/app/build.gradle` file, because the camera2 API which CameraX used only support Android 5.0 or above.

*Note*: You can run the example on a device emulator with Android 11 or higher and physical devices, CameraX doesn't work when running on emulators with Android 10 or lower. See https://developer.android.google.cn/codelabs/camerax-getting-started#5

### iOS

Make sure you have a minimum deployment target of 10.0, because the `MLKit` only support iOS 10.0 or above, you can uncomment the first line `platform :ios, '10.0'` in your iOS project's `Podfile`
