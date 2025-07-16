import Flutter
import UIKit

public class CameraXiOSPlugin: NSObject, FlutterPlugin {
    var api: CameraXApiPigeonProxyApiRegistrar?
    
    init(messenger: FlutterBinaryMessenger) {
        let delegate = CameraXDelegate()
        api = CameraXApiPigeonProxyApiRegistrar(binaryMessenger: messenger, apiDelegate: delegate)
        api!.setUp()
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger = registrar.messenger()
        let instance = CameraXiOSPlugin(messenger: messenger)
        let viewFactory = ViewFactory(instanceManager: instance.api!.instanceManager)
        let viewTypeId = "camerax.hebei.dev/PreviewView"
        registrar.register(viewFactory, withId: viewTypeId)
        registrar.publish(instance)
    }
    
    public func detachFromEngine(for registrar: any FlutterPluginRegistrar) {
        api!.ignoreCallsToDart = true
        api!.tearDown()
        api = nil
    }
}
