package com.androidsutra.wifi_signal_monitor.scanner

import com.androidsutra.wifi_signal_monitor.Cache
import com.androidsutra.wifi_signal_monitor.manager.WiFiManagerWrapper

internal class ScannerCallback(private val wiFiManagerWrapper: WiFiManagerWrapper, private val cache: Cache) :
    Callback {

    override fun onSuccess() {
        cache.add(wiFiManagerWrapper.scanResults())
        cache.wifiInfo = wiFiManagerWrapper.wiFiInfo()
    }

}