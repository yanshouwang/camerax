# CameraX

A camera plugin for flutter, which use CameraX on Android, native API on iOS, supports preview and image analysis.

*Note*: This plugin is only available on Android now, iOS is under development and will be available soon. After that, I will try to add more features such as flash light control, take picutres and so on... This plugin is inspired by the official [camera](https://pub.dev/packages/camera) project but more simple to use.

## Features

- Camera preview
- Access to a camera image stream

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

// TODO: Add iOS guide.

## Issues

- iOS still under developement.
- Doesn't work with horizontal orientation now.
- No tests for now.

## Screenshots

![Home](https://github.com/yanshouwang/docs/blob/master/camerax/home.png?raw=true)
![Camera](https://github.com/yanshouwang/docs/blob/master/camerax/camera.png?raw=true)
