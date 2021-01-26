import Flutter
import UIKit
import AVFoundation

public class SwiftCameraXPlugin: NSObject, FlutterPlugin, FlutterStreamHandler, FlutterTexture {
    var device: AVCaptureDevice!
    
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let method = FlutterMethodChannel(
            name: "yanshouwang.dev/camerax/method",
            binaryMessenger: registrar.messenger())
        let event = FlutterEventChannel(
            name: "yanshouwang.dev/camerax/event",
            binaryMessenger: registrar.messenger())
        let instance = SwiftCameraXPlugin()
        registrar.addMethodCallDelegate(instance, channel: method)
        event.setStreamHandler(instance)
        registrar.textures()
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "init":
            initCameraX(call,result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        <#code#>
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        <#code#>
    }
    
    public func copyPixelBuffer() -> Unmanaged<CVPixelBuffer>? {
        <#code#>
    }
    
    func initCameraX(_ call: FlutterMethodCall, _ result: FlutterResult) {
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
        
    }
}
