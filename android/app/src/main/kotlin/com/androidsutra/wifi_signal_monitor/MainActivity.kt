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
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import org.json.JSONArray
import org.json.JSONObject


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

    fun convertHashMapToJsonObject(hashMap: Map<String, Any>): JSONObject {
        val jsonObject = JSONObject()
        for ((key, value) in hashMap) {
            jsonObject.put(key, value)
        }
        return jsonObject
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
    public override fun onResume() {
        super.onResume()
        val scannerService: ScannerService = MainContext.INSTANCE.scannerService
        if (MainContext.INSTANCE.permissionService.permissionGranted()) {
            if (!MainContext.INSTANCE.permissionService.locationEnabled()) {
                startLocationSettings()
            }
        }
    }

    private val largeScreen: Boolean
        @RequiresApi(Build.VERSION_CODES.DONUT)
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

    fun convertWiFiDataListToJson(wiFiDataList: List<WiFiData>): JSONObject {
        val wiFiDataJsonArray = JSONArray()

        wiFiDataList.forEach { wiFiData ->
            val wiFiDetailsJsonArray = JSONArray()
            wiFiData.wiFiDetails.forEach { detail ->
                val detailObj = JSONObject().apply {
                    put("wiFiIdentifier", JSONObject().apply {
                        put("ssidRaw", detail.wiFiIdentifier.ssidRaw)
                        put("bssid", detail.wiFiIdentifier.bssid)
                    })
                    put("wiFiSecurity", JSONObject().apply {
                        put("capabilities", detail.wiFiSecurity.capabilities)
                    })
                    put("wiFiSignal", JSONObject().apply {
                        put("primaryFrequency", detail.wiFiSignal.primaryFrequency)
                        put("centerFrequency", detail.wiFiSignal.centerFrequency)
                        put("wiFiWidth", detail.wiFiSignal.wiFiWidth)
                        put("level", detail.wiFiSignal.level)
                        put("is80211mc", detail.wiFiSignal.is80211mc)
                        put("wiFiStandard", detail.wiFiSignal.wiFiStandard)
                        put("timestamp", detail.wiFiSignal.timestamp)
                    })
                    put("wifiAbility", JSONObject().apply {
                        put("channelDisplay", detail.wifiAbility.channelDisplay)
                        put("distance", detail.wifiAbility.distance)
                        put("width", detail.wifiAbility.width)
                    })
//                    put("wiFiAdditional", detail.wiFiAdditional) // Assuming wiFiAdditional is a String for demonstration
                }

                wiFiDetailsJsonArray.put(detailObj)
            }

            val wiFiConnectionJson = JSONObject().apply {
                put("wiFiIdentifier", JSONObject().apply {
                    put("ssidRaw", wiFiData.wiFiConnection.wiFiIdentifier?.ssidRaw)
                    put("bssid", wiFiData.wiFiConnection.wiFiIdentifier?.bssid)
                })
                put("ipAddress", wiFiData.wiFiConnection.ipAddress)
                put("linkSpeed", wiFiData.wiFiConnection.linkSpeed)
            }

            val wiFiDataJson = JSONObject().apply {
                put("wiFiDetails", wiFiDetailsJsonArray)
                put("wiFiConnection", wiFiConnectionJson)
            }

            wiFiDataJsonArray.put(wiFiDataJson)
        }

        // Here we create the final JSONObject and put the array under "WifiAnalyser"
        val finalJsonObject = JSONObject().apply {
            put("WifiAnalyser", wiFiDataJsonArray)
        }

        return finalJsonObject
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
                                val json = convertWiFiDataListToJson(wiFiData)

                                eventSink?.success(json.toString())
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
