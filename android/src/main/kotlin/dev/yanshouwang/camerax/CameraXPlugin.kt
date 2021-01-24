package dev.yanshouwang.camerax

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** CameraXPlugin */
class CameraXPlugin : FlutterPlugin, ActivityAware {
    private var flutter: FlutterPlugin.FlutterPluginBinding? = null
    private var activity: ActivityPluginBinding? = null
    private var handler: CameraXHandler? = null

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        this.flutter = binding
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        this.flutter = null
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        handler = CameraXHandler(binding.activity, this.flutter!!.binaryMessenger, this.flutter!!.textureRegistry)
        handler!!.startListening()
        activity = binding
        activity!!.addRequestPermissionsResultListener(handler!!)
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        activity!!.removeRequestPermissionsResultListener(handler!!)
        activity = null
        handler!!.stopListening()
        handler = null
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }
}
