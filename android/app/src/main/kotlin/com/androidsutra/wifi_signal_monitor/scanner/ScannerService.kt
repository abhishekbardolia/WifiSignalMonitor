package com.androidsutra.wifi_signal_monitor.scanner

import android.os.Handler
import com.androidsutra.wifi_signal_monitor.Cache
import com.androidsutra.wifi_signal_monitor.MainActivity
import com.androidsutra.wifi_signal_monitor.Transformer
import com.androidsutra.wifi_signal_monitor.manager.WiFiManagerWrapper
import com.androidsutra.wifi_signal_monitor.model.WiFiData
import com.androidsutra.wifi_signal_monitor.permission.PermissionService
import com.androidsutra.wifi_signal_monitor.settings.Settings
fun interface UpdateNotifier {
    fun update(wiFiData: List<WiFiData>)
}

interface ScannerService {
    fun update()
    fun wiFiData(): List<WiFiData>
    fun register(updateNotifier: UpdateNotifier): Boolean
    fun unregister(updateNotifier: UpdateNotifier): Boolean
    fun getUpdateNotifier(updateNotifier: UpdateNotifier)
    fun pause()
//    fun running(): Boolean
//    fun resume()
//    fun resumeWithDelay()
    fun stop()
//    fun toggle()
}

fun makeScannerService(
    mainActivity: MainActivity,
    wiFiManagerWrapper: WiFiManagerWrapper,
    handler: Handler,
    settings: Settings
): ScannerService {
    val cache = Cache()
    val transformer = Transformer(cache)
    val permissionService = PermissionService(mainActivity)
    val scanner = Scanner(wiFiManagerWrapper, settings, permissionService, transformer)
//    scanner.periodicScan = PeriodicScan(scanner, handler, settings)
    scanner.scannerCallback = ScannerCallback(wiFiManagerWrapper, cache)
    scanner.scanResultsReceiver = ScanResultsReceiver(mainActivity, scanner.scannerCallback)
    return scanner
}
