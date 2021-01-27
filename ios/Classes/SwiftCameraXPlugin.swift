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
            dispose()
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
                    self.startCamera(call, result)
                }
            )
        }else if status != .authorized{
            let error = FlutterError()
            result(error)
        }else{
            startCamera(call, result)
        }
    }
    
    func startCamera(_ call: FlutterMethodCall, _ result: FlutterResult) {
        let facing = call.arguments as! String == "front"
            ? AVCaptureDevice.Position.front
            : AVCaptureDevice.Position.back
        if #available(iOS 10.0, *) {
            device = AVCaptureDevice.DiscoverySession(
                deviceTypes: [.builtInWideAngleCamera],
                mediaType: .video,
                position: facing).devices.first
        }else{
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
        var width, height: Int
        if #available(iOS 9.0, *) {
            captureSession.sessionPreset = .hd4K3840x2160
            width = 2160
            height = 3840
        }else {
            captureSession.sessionPreset = .hd1920x1080
            width = 1080
            height = 1920
        }
        captureSession.commitConfiguration()
        let connection = output.connection(with: .video)!
        connection.videoOrientation = .portrait
        captureSession.startRunning()
        textureId =  registry.register(self)
        let answer: [String: Any] = ["textureId": textureId!, "width": width, "height": height]
        result(answer)
    }
    
    func dispose() {
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
        textureId = nil
        captureSession = nil
        device = nil
    }
}
