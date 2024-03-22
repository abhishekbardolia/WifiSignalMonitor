package com.androidsutra.wifi_signal_monitor

import android.content.Context
import android.content.res.Resources
import android.net.wifi.WifiManager
import android.os.Handler
import android.os.Looper
import android.view.LayoutInflater
import com.androidsutra.wifi_signal_monitor.manager.WiFiManagerWrapper
import com.androidsutra.wifi_signal_monitor.permission.PermissionService
import com.androidsutra.wifi_signal_monitor.scanner.ScannerService
import com.androidsutra.wifi_signal_monitor.scanner.makeScannerService
import com.androidsutra.wifi_signal_monitor.settings.Repository
import com.androidsutra.wifi_signal_monitor.settings.Settings
import com.androidsutra.wifi_signal_monitor.vendor.VendorService

enum class MainContext {
    INSTANCE;
    lateinit var settings: Settings
    lateinit var mainActivity: MainActivity
    lateinit var configuration: Configuration
    lateinit var wiFiManagerWrapper: WiFiManagerWrapper
    lateinit var permissionService: PermissionService
    lateinit var vendorService: VendorService
    lateinit var scannerService: ScannerService

    val context: Context
        get() = mainActivity.applicationContext

    val resources: Resources
        get() = context.resources

    val layoutInflater: LayoutInflater
        get() = mainActivity.layoutInflater

    private val wiFiManager: WifiManager
        get() = context.getSystemService(Context.WIFI_SERVICE) as WifiManager


    fun initialize(activity: MainActivity, largeScreen: Boolean) {
        mainActivity = activity
        configuration = Configuration(largeScreen)
        settings = Settings(Repository(context))
        wiFiManagerWrapper = WiFiManagerWrapper(wiFiManager)
        permissionService = PermissionService(activity)
        vendorService = VendorService(activity.resources)
        scannerService = makeScannerService(mainActivity, wiFiManagerWrapper, Handler(Looper.getMainLooper()), settings)
    }
}