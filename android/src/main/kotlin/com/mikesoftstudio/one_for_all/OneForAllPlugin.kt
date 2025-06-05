package com.mikesoftstudio.one_for_all


import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel

/** OneForAllPlugin */
class OneForAllPlugin : FlutterPlugin {
    private var context: Context? = null
    private lateinit var methodChannel: MethodChannel

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        methodChannel = MethodChannel(flutterPluginBinding.binaryMessenger, METHOD_CHANNEL)

        // Make sure context is non-null before passing
        methodChannel.setMethodCallHandler(OneForAllMethodHandler(context!!))
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        methodChannel.setMethodCallHandler(null)
    }

    companion object {
        const val METHOD_CHANNEL = "com.mikesoftstudio.one_for_all.one_for_all_sdk.methods"
    }
}
