package dev.yanshouwang.camerax

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

/** CameraXPlugin */
class CameraXPlugin : FlutterPlugin, ActivityAware {
    private var flutter: FlutterPlugin.FlutterPluginBinding? = null
    private var activity: ActivityPluginBinding? = null
    private var handler: CameraXHandler? = null
    private var method: MethodChannel? = null
    private var event: EventChannel? = null

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        this.flutter = binding
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        this.flutter = null
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding
        handler = CameraXHandler(activity!!.activity, flutter!!.textureRegistry)
        method = MethodChannel(flutter!!.binaryMessenger, "yanshouwang.dev/camerax/method")
        event = EventChannel(flutter!!.binaryMessenger, "yanshouwang.dev/camerax/event")
        method!!.setMethodCallHandler(handler)
        event!!.setStreamHandler(handler)
        activity!!.addRequestPermissionsResultListener(handler!!)
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        activity!!.removeRequestPermissionsResultListener(handler!!)
        event!!.setStreamHandler(null)
        method!!.setMethodCallHandler(null)
        event = null
        method = null
        handler = null
        activity = null
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }
}
