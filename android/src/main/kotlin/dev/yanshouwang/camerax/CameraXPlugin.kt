package dev.yanshouwang.camerax

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** CameraXPlugin */
class CameraXPlugin : FlutterPlugin, ActivityAware {
    private var binding: FlutterPlugin.FlutterPluginBinding? = null
    private var handler: CameraXHandler? = null

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        this.binding = binding
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        this.binding = null
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        handler = CameraXHandler(binding.activity, this.binding!!.binaryMessenger, this.binding!!.textureRegistry)
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        handler!!.stopListening()
        handler = null
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }
}
