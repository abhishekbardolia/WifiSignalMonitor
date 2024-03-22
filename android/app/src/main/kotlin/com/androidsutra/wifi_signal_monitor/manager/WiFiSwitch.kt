
package com.androidsutra.wifi_signal_monitor.manager

import android.annotation.TargetApi
import android.net.wifi.WifiManager
import android.os.Build
import com.androidsutra.wifi_signal_monitor.MainContext
import com.androidsutra.wifi_signal_monitor.startWiFiSettings
import com.androidsutra.wifi_signal_monitor.utils.buildMinVersionQ


class WiFiSwitch(private val wifiManager: WifiManager) {
    fun on(): Boolean = enable(true)

    fun off(): Boolean = enable(false)

    fun startWiFiSettings(): Unit = MainContext.INSTANCE.mainActivity.startWiFiSettings()

    fun minVersionQ(): Boolean = buildMinVersionQ()

    private fun enable(enabled: Boolean): Boolean = if (minVersionQ()) enableWiFiAndroidQ() else enableWiFiLegacy(enabled)

    private fun enableWiFiAndroidQ(): Boolean {
        startWiFiSettings()
        return true
    }

    @Suppress("DEPRECATION")
    private fun enableWiFiLegacy(enabled: Boolean): Boolean = wifiManager.setWifiEnabled(enabled)

}