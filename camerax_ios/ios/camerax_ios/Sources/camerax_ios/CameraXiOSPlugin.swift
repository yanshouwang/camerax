import Flutter
import UIKit

public class CameraXiOSPlugin: NSObject, FlutterPlugin {
    private var api: CameraXApiPigeonProxyApiRegistrar?
    
    private init(messenger: FlutterBinaryMessenger) {
        let delegate = CameraXDelegate()
        self.api = CameraXApiPigeonProxyApiRegistrar(binaryMessenger: messenger, apiDelegate: delegate)
        self.api!.setUp()
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger = registrar.messenger()
        let instance = CameraXiOSPlugin(messenger: messenger)
        let viewFactory = ViewFactory(instanceManager: instance.api!.instanceManager)
        let viewTypeId = "camerax.zeekr.dev/PreviewView"
        registrar.register(viewFactory, withId: viewTypeId)
        registrar.publish(instance)
    }
    
    public func detachFromEngine(for registrar: any FlutterPluginRegistrar) {
        self.api!.ignoreCallsToDart = true
        self.api!.tearDown()
        self.api = nil
    }
}
