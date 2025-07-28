# camerax

Work with audiovisual assets, control device cameras, process audio, and configure system audio interactions.

This plugin is aimed to provide a simple and fimiliar experience when controlling the camera devices for developers. We use the CameraX library on Android, and implement the  CameraX interfaces with AVFoundation framework on iOS.

So if you familiar with the CameraX library, you'll find it is quite easy to add this plugin to your app.

What's more, We provide MlKitAnalyzer and AVAnalyzer for you to recognize barcodes, faces and so on.

## Features

* Control the camera devices with [CameraController](https://developer.android.com/reference/kotlin/androidx/camera/view/CameraController), take picture, record video and so on.
* Preview with PreviewWidget.
* Predefined analyzers with MlKit on Android and AVCaptureMetadataOutput on iOS.
* Custom analyzers with ImageAnalyzer. 

## Getting Started

### Android

Make sure you have a miniSdk with 21 or higher in the `android/app/build.gradle`.

Note: You can run the example on a device emulator with Android 11 or higher and physical devices, CameraX doesn't work when running on emulators with Android 10 or lower. See https://developer.android.google.cn/codelabs/camerax-getting-started#5

### iOS

Make sure you have a minimum deployment target with 12.0 or higher, you can uncomment the first line platform :ios, '12.0' in the `ios/Podfile`.

Add two rows to the `ios/Runner/Info.plist`:

* one with the key `Privacy - Camera Usage Description` and a usage description.
* and one with the key `Privacy - Microphone Usage Description` and a usage description.

If editing `Info.plist` as text, add:

```xml
<key>NSCameraUsageDescription</key>
<string>your usage description here</string>
<key>NSMicrophoneUsageDescription</key>
<string>your usage description here</string>
```

## Issues

This is the first begining for this plugin, so the CameraX interfaces is not implemented completely on iOS. There's still a lot of work to do on iOS. 

If anyone find any bugs or mistakes with this plugin, please file a issue on GitHub.