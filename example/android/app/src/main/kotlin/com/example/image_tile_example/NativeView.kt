package com.example.image_tile_example

import android.content.Context
import android.view.View
import com.davemorrissey.labs.subscaleview.ImageSource
import com.davemorrissey.labs.subscaleview.SubsamplingScaleImageView
import io.flutter.plugin.platform.PlatformView

internal class NativeView(
    context: Context?,
    id: Int,
    creationParams: Map<String?, Any?>?
) : PlatformView {
    private val view: SubsamplingScaleImageView
    override fun getView(): View {
        return view
    }

    override fun dispose() {

    }

    init {
        view = SubsamplingScaleImageView(context)
        creationParams?.get("image")?.let {
            view.setImage(ImageSource.fileUrl(it as String))
        }
    }
}
