package com.example.image_tile

import android.content.Context
import android.util.Log
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
            Log.e("image_url", it as String)
            view.setImage(ImageSource.uri(it))
        }
    }
}
