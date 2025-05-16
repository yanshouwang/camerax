import Flutter
import UIKit

public class CameraXiOSPlugin: NSObject, FlutterPlugin {
    var api: CameraXApiPigeonProxyApiRegistrar?
    
    init(messenger: FlutterBinaryMessenger) {
        let impl = CameraXImpl()
        api = CameraXApiPigeonProxyApiRegistrar(binaryMessenger: messenger, apiDelegate: impl)
        api!.setUp()
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger = registrar.messenger()
        let instance = CameraXiOSPlugin(messenger: messenger)
        let viewFactory = ViewFactory(instanceManager: instance.api!.instanceManager)
        registrar.register(viewFactory, withId: "hebei.dev/PreviewView")
        registrar.publish(instance)
    }
    
    public func detachFromEngine(for registrar: any FlutterPluginRegistrar) {
        api!.ignoreCallsToDart = true
        api!.tearDown()
        api = nil
    }
}
