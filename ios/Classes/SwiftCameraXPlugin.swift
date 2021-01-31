import Flutter
import UIKit
import AVFoundation
import CoreMotion

public class SwiftCameraXPlugin:
    NSObject,
    FlutterPlugin,
    FlutterStreamHandler,
    FlutterTexture,
    AVCaptureVideoDataOutputSampleBufferDelegate,
    AVCaptureMetadataOutputObjectsDelegate {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = SwiftCameraXPlugin(registrar.textures())
        
        let method = FlutterMethodChannel(name: "yanshouwang.dev/camerax/method", binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(instance, channel: method)
        
        let event = FlutterEventChannel(name: "yanshouwang.dev/camerax/event", binaryMessenger: registrar.messenger())
        event.setStreamHandler(instance)
    }
    
    let registry: FlutterTextureRegistry
    var stream: FlutterEventSink!
    var instanceId: Int!
    var textureId: Int64!
    var device: AVCaptureDevice!
    var captureSession: AVCaptureSession!
    var resolution: CGSize!
    var latestPixelBuffer: CVImageBuffer!
    
    init(_ registry: FlutterTextureRegistry) {
        self.registry = registry
        super.init()
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "state":
            stateNative(call, result)
        case "request":
            requestNative(call, result)
        case "init":
            initNative(call, result)
        case "dispose":
            disposeNative(call, result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        stream = events
        return nil
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        stream = nil
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
    
    public func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        for mo in metadataObjects {
            if let mmo = mo as? AVMetadataMachineReadableCodeObject {
                let data: [String: Any?] = [
                    "type": mmo.type.rawValue,
                    "value": mmo.stringValue,
                    "corners": mmo.corners.map({["x": Double($0.x), "y": Double($0.y)]})
                ]
                stream?(data)
            }
        }
    }
    
    func stateNative(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .notDetermined:
            result(0)
        case .authorized:
            result(1)
        default:
            result(2)
        }
    }
    
    func requestNative(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        AVCaptureDevice.requestAccess(
            for: .video,
            completionHandler: { result($0) }
        )
    }
    
    func initNative(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        if instanceId != nil {
            closeCamera()
            instanceId = nil
        }
        let arguments = call.arguments as! [Any]
        let id = arguments[0] as! Int
        let position = arguments[1] as! Int == 0 ? AVCaptureDevice.Position.front : .back
        do {
            try openCamera(position)
            instanceId = id
            let answer: [String : Any?] = [
                "textureId": textureId,
                "width": resolution.width,
                "height": resolution.height
            ]
            result(answer)
        } catch {
            error.throwNative(result)
        }
    }
    
    func disposeNative(_ call: FlutterMethodCall, _ result: FlutterResult) {
        let id = call.arguments as! Int
        if id == instanceId {
            closeCamera()
            instanceId = nil
        }
        result(nil)
    }
    
    func openCamera(_ position: AVCaptureDevice.Position) throws {
        textureId = registry.register(self)
        if #available(iOS 10.0, *) {
            device = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: position).devices.first
        } else {
            device = AVCaptureDevice.devices(for: .video).filter({$0.position == position}).first
        }
        captureSession = AVCaptureSession()
        captureSession.beginConfiguration()
        let input = try AVCaptureDeviceInput(device: device)
        captureSession.addInput(input)
        // Add video output.
        let videoOutput = AVCaptureVideoDataOutput()
        captureSession.addOutput(videoOutput)
        videoOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String:  kCVPixelFormatType_32BGRA]
        videoOutput.alwaysDiscardsLateVideoFrames = true
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue.main)
        // Add metadata output.
        let metadataOutput = AVCaptureMetadataOutput()
        captureSession.addOutput(metadataOutput)
        metadataOutput.metadataObjectTypes = [
            .aztec,
            .dataMatrix,
            .pdf417,
            .qr,
        ]
        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        for connection in videoOutput.connections {
            connection.videoOrientation = .portrait
            if position == .front && connection.isVideoMirroringSupported {
                connection.isVideoMirrored = true
            }
        }
        captureSession.commitConfiguration()
        captureSession.startRunning()
        let demensions = CMVideoFormatDescriptionGetDimensions(device.activeFormat.formatDescription)
        let width = Int(demensions.height)
        let height = Int(demensions.width)
        resolution = CGSize(width: width, height: height)
    }
    
    func closeCamera() {
        captureSession.stopRunning()
        for input in captureSession.inputs {
            captureSession.removeInput(input)
        }
        for output in captureSession.outputs {
            captureSession.removeOutput(output)
        }
        captureSession = nil
        latestPixelBuffer = nil
        device = nil
        registry.unregisterTexture(textureId)
        textureId = nil
    }
}

extension Error {
    func throwNative(_ result: FlutterResult) {
        let error = FlutterError(code: localizedDescription, message: nil, details: nil)
        result(error)
    }
}
