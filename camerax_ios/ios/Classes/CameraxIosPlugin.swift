import Flutter
import UIKit

public class CameraXiOSPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
      registrar.register(PreviewViewFactory.shared, withId: "hebei.dev/PreviewView")
  }
}
