import Flutter
import UIKit
import AVFoundation
import CoreMotion

public class SwiftCameraXPlugin:
    NSObject,
    FlutterPlugin,
    FlutterStreamHandler,
    FlutterTexture,
    AVCaptureVideoDataOutputSampleBufferDelegate {
    
    let registry: FlutterTextureRegistry
    var device: AVCaptureDevice!
    var captureSession: AVCaptureSession!
    var textureId: Int64!
    var resolution: CGSize!
    var latestPixelBuffer: CVImageBuffer!
    var events: FlutterEventSink!
    
    init(_ registry: FlutterTextureRegistry) {
        self.registry = registry
        super.init()
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let method = FlutterMethodChannel(name: "yanshouwang.dev/camerax/method", binaryMessenger: registrar.messenger())
        let event = FlutterEventChannel(name: "yanshouwang.dev/camerax/event", binaryMessenger: registrar.messenger())
        let instance = SwiftCameraXPlugin(registrar.textures())
        registrar.addMethodCallDelegate(instance, channel: method)
        event.setStreamHandler(instance)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "init":
            checkStatus(call,result)
        case "dispose":
            closeCamera()
            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.events = events
        return nil
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        self.events = nil
        return nil
    }
    
    public func copyPixelBuffer() -> Unmanaged<CVPixelBuffer>? {
        if latestPixelBuffer == nil {
            return nil
        }
        return Unmanaged<CVPixelBuffer>.passRetained(latestPixelBuffer)
    }
    
    public func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        latestPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)
        registry.textureFrameAvailable(textureId)
        // Stream camera image data.
        if events != nil {
            let buffer = CMSampleBufferGetImageBuffer(sampleBuffer)!
            CVPixelBufferLockBaseAddress(buffer, .readOnly)
            let imageWidth = CVPixelBufferGetWidth(buffer)
            let imageHeight = CVPixelBufferGetHeight(buffer)
            let planes = NSMutableArray()
            let planar = CVPixelBufferIsPlanar(buffer)
            let count = planar ? CVPixelBufferGetPlaneCount(buffer) : 1
            for i in 0 ..< count {
                var address: UnsafeMutableRawPointer!
                var bytesPerRow: Int
                var width: Int
                var height: Int
                if planar {
                    address = CVPixelBufferGetBaseAddressOfPlane(buffer, i)
                    bytesPerRow = CVPixelBufferGetBytesPerRowOfPlane(buffer, i)
                    width = CVPixelBufferGetWidthOfPlane(buffer, i)
                    height = CVPixelBufferGetHeightOfPlane(buffer, i)
                } else {
                    address = CVPixelBufferGetBaseAddress(buffer)
                    bytesPerRow = CVPixelBufferGetBytesPerRow(buffer)
                    width = CVPixelBufferGetWidth(buffer)
                    height = CVPixelBufferGetHeight(buffer)
                }
                let length = bytesPerRow * height
                let bytes = Data(bytesNoCopy: address, count: count, deallocator: address.deallocate())
                let plane = NSMutableDictionary()
                plane["bytesPerRow"] = bytesPerRow
                plane["width"] = width
                plane["height"] = height
                plane["bytes"] = FlutterStandardTypedData(bytes: bytes)
                planes.add(plane)
            }
            let image = NSMutableDictionary()
            image["width"] = imageWidth
            image["height"] = imageHeight
            image["format"] = kCVPixelFormatType_32BGRA
            image["planes"] = planes
            events(image)
            CVPixelBufferUnlockBaseAddress(buffer, .readOnly)
        }
    }
    
    func checkStatus(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        if status == .notDetermined {
            AVCaptureDevice.requestAccess(
                for: .video,
                completionHandler: {
                    (authorized) in
                    if !authorized {
                        let error = FlutterError()
                        result(error)
                    }
                    self.openCamera(call, result)
                }
            )
        } else if status != .authorized {
            let error = FlutterError()
            result(error)
        } else {
            openCamera(call, result)
        }
    }
    
    func openCamera(_ call: FlutterMethodCall, _ result: FlutterResult) {
        // Make sure this is not a hot reload.
        if device == nil {
            let facing = call.arguments as! String == "front"
                ? AVCaptureDevice.Position.front
                : AVCaptureDevice.Position.back
            if #available(iOS 10.0, *) {
                device = AVCaptureDevice.DiscoverySession(
                    deviceTypes: [.builtInWideAngleCamera],
                    mediaType: .video,
                    position: facing).devices.first
            } else {
                device = AVCaptureDevice.devices(for: .video)
                    .filter({$0.position == facing})
                    .first
            }
            captureSession = AVCaptureSession()
            captureSession.beginConfiguration()
            do {
                let input = try AVCaptureDeviceInput(device: device)
                captureSession.addInput(input)
            } catch {
                let err = FlutterError(code: error.localizedDescription, message: nil, details: nil)
                result(err)
            }
            let output = AVCaptureVideoDataOutput()
            output.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String:  kCVPixelFormatType_32BGRA]
            output.alwaysDiscardsLateVideoFrames = true
            output.setSampleBufferDelegate(self, queue: DispatchQueue.main)
            captureSession.addOutput(output)
            if #available(iOS 9.0, *) {
                captureSession.sessionPreset = .hd4K3840x2160
                resolution = CGSize(width: 2160, height: 3840)
            } else {
                captureSession.sessionPreset = .hd1920x1080
                resolution = CGSize(width: 1080, height: 1920)
            }
            captureSession.commitConfiguration()
            let connection = output.connection(with: .video)!
            connection.videoOrientation = .portrait
            captureSession.startRunning()
            textureId =  registry.register(self)
            let width = resolution.width.native
            let height = resolution.height.native
            let answer: [String: Any] = ["textureId": textureId!, "width": width, "height": height]
            result(answer)
        }
        let textureId = self.textureId!
        let width = resolution.width
        let height = resolution.height
        let answer: [String: Any] = ["textureId": textureId, "width": width, "height": height]
        result(answer)
    }
    
    func closeCamera() {
        captureSession.stopRunning()
        for input in captureSession.inputs {
            captureSession.removeInput(input)
        }
        for output in captureSession.outputs {
            captureSession.removeOutput(output)
        }
        registry.unregisterTexture(textureId)
        events = nil
        latestPixelBuffer = nil
        resolution = nil
        textureId = nil
        captureSession = nil
        device = nil
    }
}
