package dev.hebei.camerax_android

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** CameraXAndroidPlugin */
class CameraXAndroidPlugin : FlutterPlugin, ActivityAware {
    private var instanceManager: InstanceManager? = null
    private var permissionsManagerAPI: PermissionsManagerAPI? = null
    private var cameraControllerAPI: CameraControllerAPI? = null

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        val context = binding.applicationContext
        val binaryMessenger = binding.binaryMessenger
        val viewRegistry = binding.platformViewRegistry
        val finalizationListener = object : InstanceManager.FinalizationListener {
            override fun onFinalize(identifier: Long) {
                ObjectFlutterAPI(binaryMessenger).dispose(identifier) {}
            }
        }
        val instanceManager = InstanceManager.create(finalizationListener)
        this.instanceManager = instanceManager
        val instanceManagerAPI = InstanceManagerAPI(instanceManager)
        InstanceManagerHostAPI.setUp(binaryMessenger, instanceManagerAPI)
        val objectAPI = ObjectAPI(instanceManager)
        ObjectHostAPI.setUp(binaryMessenger, objectAPI)
        val permissionsManagerAPI = PermissionsManagerAPI()
        this.permissionsManagerAPI = permissionsManagerAPI
        PermissionsManagerHostAPI.setUp(binaryMessenger, permissionsManagerAPI)
        val cameraControllerAPI = CameraControllerAPI(context, instanceManager)
        this.cameraControllerAPI = cameraControllerAPI
        CameraControllerHostAPI.setUp(binaryMessenger, cameraControllerAPI)
        val previewViewAPI = PreviewViewAPI(context, instanceManager)
        PreviewViewHostAPI.setUp(binaryMessenger, previewViewAPI)
        val previewViewFactory = PreviewViewFactory(instanceManager)
        viewRegistry.registerViewFactory("hebei.dev/PreviewView", previewViewFactory)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        instanceManager?.stopFinalizationListener()
        instanceManager = null
        permissionsManagerAPI = null
        cameraControllerAPI = null
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        permissionsManagerAPI?.activity = binding.activity
        permissionsManagerAPI?.registry = binding::addRequestPermissionsResultListener
        cameraControllerAPI?.activity = binding.activity
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        permissionsManagerAPI?.activity = null
        permissionsManagerAPI?.registry = null
        cameraControllerAPI?.activity = null
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }
}
