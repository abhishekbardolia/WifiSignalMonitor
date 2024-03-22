package com.androidsutra.wifi_signal_monitor


import android.content.res.Configuration
import android.net.wifi.WifiManager
import android.net.wifi.WifiManager.ScanResultsCallback
import android.os.Build
import android.os.Handler
import android.os.Looper
import androidx.annotation.RequiresApi
import com.androidsutra.wifi_signal_monitor.model.WiFiData
import com.androidsutra.wifi_signal_monitor.scanner.ScannerService
import com.google.gson.Gson
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() , EventChannel.StreamHandler,
    MethodChannel.MethodCallHandler {
    val CHANNEL = "wifi_monitor"
    val CHANNEL_EVENT = "wifi_monitor_event"
    private var wifiManager: WifiManager? = null

    var TAG = "MainActivity"
    private var scanResultsCallback: ScanResultsCallback? = null

    private var hasRunOnce = false



    private var eventSink: EventChannel.EventSink? = null
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MainContext.INSTANCE.initialize(this, largeScreen)
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_EVENT).setStreamHandler(this)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler(this)
    }

    private fun convertWiFiDataToMap(wiFiData: List<WiFiData>): Map<String, Any> {

        return hashMapOf(
            "WifiAnalyser" to wiFiData
        )
    }





    @RequiresApi(Build.VERSION_CODES.R)
    override fun onPause() {
        super.onPause()

        val scannerService: ScannerService = MainContext.INSTANCE.scannerService
        scannerService.pause()


        scanResultsCallback?.let {
            wifiManager?.unregisterScanResultsCallback(it)
            scanResultsCallback =
                null
        }

    }


    private val largeScreen: Boolean
        get() {
            val configuration = resources.configuration
            val screenLayoutSize =
                configuration.screenLayout and Configuration.SCREENLAYOUT_SIZE_MASK
            return screenLayoutSize == Configuration.SCREENLAYOUT_SIZE_LARGE ||
                    screenLayoutSize == Configuration.SCREENLAYOUT_SIZE_XLARGE
        }


    private class MethodResultWrapper internal constructor(private val methodResult: MethodChannel.Result) :
        MethodChannel.Result {
        private val handler: Handler

        init {
            handler = Handler(Looper.getMainLooper())
        }

        override fun success(result: Any?) {
            handler.post { methodResult.success(result) }
        }

        override fun error(
            errorCode: String, errorMessage: String?, errorDetails: Any?
        ) {
            handler.post { methodResult.error(errorCode, errorMessage, errorDetails) }
        }

        override fun notImplemented() {
            handler.post { methodResult.notImplemented() }
        }
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        this.eventSink = events
    }

    override fun onCancel(arguments: Any?) {
        this.eventSink = null
    }
    init {
        hasRunOnce=false
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {

            val wrappedResult = MethodResultWrapper(result)
            when (call.method) {
                "WifiNative" -> {
                    if (MainContext.INSTANCE.permissionService.permissionGranted()) {
                        MainContext.INSTANCE.scannerService.update()
                        if(!hasRunOnce) {
                            hasRunOnce=true
                            MainContext.INSTANCE.scannerService.register({ wiFiData ->
                                val wiFiDataMap = convertWiFiDataToMap(wiFiData)
                                val gson = Gson()
                                val jsonString = gson.toJson(wiFiDataMap)
                                eventSink?.success(jsonString)
                            })

                        }
                    } else {
                        MainContext.INSTANCE.permissionService.check()
                    }
                }

                else -> wrappedResult.notImplemented()
            }


    }


}
