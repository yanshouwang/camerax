package dev.yanshouwang.camerax

import android.app.Activity
import androidx.core.content.ContextCompat
import androidx.camera.core.Preview as MPreview
import androidx.camera.core.ImageAnalysis as MImageAnalysis
import androidx.camera.core.ImageCapture as MImageCapture
import androidx.camera.core.CameraSelector as MCameraSelector
import androidx.camera.core.UseCase as MUseCase
import androidx.camera.lifecycle.ProcessCameraProvider as MCameraProvider
import androidx.lifecycle.LifecycleOwner
import dev.yanshouwang.camerax.messages.CameraFacing
import dev.yanshouwang.camerax.messages.CameraSelector
import dev.yanshouwang.camerax.messages.UseCase
import dev.yanshouwang.camerax.messages.camera

internal class CameraProviderPigeon :
    Pigeons.CameraProviderHostPigeon {
    var activity: Activity? = null
    private val mUseCases = mutableMapOf<String, MUseCase>()

    override fun bind(
        cameraSelectorByteArray: ByteArray,
        useCaseByteArrays: MutableList<ByteArray>,
        result: Pigeons.Result<ByteArray>
    ) {
        val activity = this.activity!!
        val mainExecutor = ContextCompat.getMainExecutor(activity)
        val mCameraProviderFuture = MCameraProvider.getInstance(activity)
        mCameraProviderFuture.addListener({
            val mCameraProvider = mCameraProviderFuture.get()
            val lifecycleOwner = activity as LifecycleOwner
            val cameraSelector = CameraSelector.parseFrom(cameraSelectorByteArray)
            val mCameraSelector = when (cameraSelector.facing) {
                CameraFacing.CAMERA_FACING_BACK -> MCameraSelector.DEFAULT_BACK_CAMERA
                CameraFacing.CAMERA_FACING_FRONT -> MCameraSelector.DEFAULT_FRONT_CAMERA
                else -> throw IllegalArgumentException()
            }
            val mUseCases = useCaseByteArrays.map { useCaseByteArray ->
                val useCase = UseCase.parseFrom(useCaseByteArray)
                when (useCase.useCaseCase) {
                    UseCase.UseCaseCase.PREVIEW -> MPreview.Builder().build().apply {
                        val key = useCase.preview.viewId
                        val cameraView = InstanceManager.findInstance<CameraView>(key)
                        this.setSurfaceProvider(cameraView!!.surfaceProvider)
                    }
                    UseCase.UseCaseCase.IMAGE_ANALYSIS -> MImageAnalysis.Builder().build()
                    UseCase.UseCaseCase.IMAGE_CAPTURE -> MImageCapture.Builder().build()
                    else -> throw IllegalArgumentException()
                }
            }.toTypedArray()
            val mCamera =
                mCameraProvider.bindToLifecycle(lifecycleOwner, mCameraSelector, *mUseCases)
            val camera = camera {
                this.id = mCamera.hashCode().toString()
            }.toByteArray()
            result.success(camera)
        }, mainExecutor)
    }

    override fun unbind(useCaseByteArrays: MutableList<ByteArray>, result: Pigeons.Result<Void>) {
        val activity = this.activity!!
        val mCameraProviderFuture = MCameraProvider.getInstance(activity)
        val mainExecutor = ContextCompat.getMainExecutor(activity)
        mCameraProviderFuture.addListener({
            val mCameraProvider = mCameraProviderFuture.get()
            val mUseCases = useCaseByteArrays.mapNotNull { useCaseByteArray ->
                val useCase = UseCase.parseFrom(useCaseByteArray)
                this.mUseCases.remove(useCase.id)
            }.toTypedArray()
            mCameraProvider.unbind(*mUseCases)
            result.success(null)
        }, mainExecutor)
    }

    override fun unbindAll(result: Pigeons.Result<Void>) {
        val activity = this.activity!!
        val mCameraProviderFuture = MCameraProvider.getInstance(activity)
        val mainExecutor = ContextCompat.getMainExecutor(activity)
        mCameraProviderFuture.addListener({
            val mCameraProvider = mCameraProviderFuture.get()
            this.mUseCases.clear()
            mCameraProvider.unbindAll()
            result.success(null)
        }, mainExecutor)
    }
}