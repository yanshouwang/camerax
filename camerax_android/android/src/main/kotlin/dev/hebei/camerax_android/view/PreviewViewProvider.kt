package dev.hebei.camerax_android.view

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import dev.hebei.camerax_android.R
import io.flutter.plugin.platform.PlatformView

class PreviewViewProvider(context: Context) : PlatformView {
    private val view: View = LayoutInflater.from(context).inflate(R.layout.layout_preview, null)

    override fun getView(): View {
        return view
    }

    override fun dispose() {
    }
}