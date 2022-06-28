package com.example.image_tile_example

import android.content.Context
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class SubSampleFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(
        context: Context?,
        viewId: Int,
        args: Any?
    ): PlatformView {
        return NativeView(context, viewId, args as Map<String?, Any?>?)
    }
}