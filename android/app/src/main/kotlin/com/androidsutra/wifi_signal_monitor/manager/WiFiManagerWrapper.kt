
package com.androidsutra.wifi_signal_monitor.manager

import android.annotation.SuppressLint
import android.net.wifi.ScanResult
import android.net.wifi.WifiInfo
import android.net.wifi.WifiManager
import android.os.Build
import androidx.annotation.RequiresApi
import com.androidsutra.wifi_signal_monitor.utils.buildMinVersionR

class WiFiManagerWrapper(
    private val wifiManager: WifiManager,
    private val wiFiSwitch: WiFiSwitch = WiFiSwitch(wifiManager)
) {
    fun wiFiEnabled(): Boolean =
        try {
            wifiManager.isWifiEnabled
        } catch (e: Exception) {
            false
        }

    fun enableWiFi(): Boolean =
        try {
            wiFiEnabled() || wiFiSwitch.on()
        } catch (e: Exception) {
            false
        }

    fun disableWiFi(): Boolean =
        try {
            !wiFiEnabled() || wiFiSwitch.off()
        } catch (e: Exception) {
            false
        }

    @Suppress("DEPRECATION")
    fun startScan(): Boolean =
        try {
            wifiManager.startScan()
        } catch (e: Exception) {
            false
        }

    @SuppressLint("MissingPermission")
    fun scanResults(): List<ScanResult> =
        try {
            wifiManager.scanResults ?: listOf()
        } catch (e: Exception) {
            listOf()
        }

    @Suppress("DEPRECATION")
    fun wiFiInfo(): WifiInfo? =
        try {
            wifiManager.connectionInfo
        } catch (e: Exception) {
            null
        }


    fun is5GHzBandSupported(): Boolean =
        wifiManager.is5GHzBandSupported

    fun is6GHzBandSupported(): Boolean =
        if (minVersionR()) {
            wifiManager.is6GHzBandSupported
        } else {
            false
        }

    fun isScanThrottleEnabled(): Boolean =
        if (minVersionR()) {
            wifiManager.isScanThrottleEnabled
        } else {
            false
        }

    fun minVersionR(): Boolean = buildMinVersionR()

}

