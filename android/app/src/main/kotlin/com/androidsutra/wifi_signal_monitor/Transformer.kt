
package com.androidsutra.wifi_signal_monitor

import android.net.wifi.ScanResult
import android.net.wifi.WifiInfo
import android.os.Build
import androidx.annotation.RequiresApi
import com.androidsutra.wifi_signal_monitor.model.WiFiConnection
import com.androidsutra.wifi_signal_monitor.model.WiFiData
import com.androidsutra.wifi_signal_monitor.model.WiFiDetail
import com.androidsutra.wifi_signal_monitor.model.WiFiIdentifier
import com.androidsutra.wifi_signal_monitor.model.WiFiStandard
import com.androidsutra.wifi_signal_monitor.model.WiFiStandardId
import com.androidsutra.wifi_signal_monitor.model.WiFiWidth
import com.androidsutra.wifi_signal_monitor.model.convertIpV4Address
import com.androidsutra.wifi_signal_monitor.model.convertSSID
import com.androidsutra.wifi_signal_monitor.utils.buildMinVersionR
import com.androidsutra.wifi_signal_monitor.utils.buildMinVersionT
import com.androidsutra.wifi_signal_monitor.utils.nullToEmpty
import com.androidsutra.wifi_signal_monitor.utils.ssid
import com.androidsutra.wifi_signal_monitor.model.WiFiSecurity
import com.androidsutra.wifi_signal_monitor.model.WiFiSignal
import com.androidsutra.wifi_signal_monitor.model.WiFiAbility

@Suppress("DEPRECATION")
fun WifiInfo.ipV4Address(): Int = ipAddress

internal class Transformer(private val cache: Cache) {

    internal fun transformWifiInfo(): WiFiConnection {
        val _cache=cache.scanResults()
        val wifiInfo: WifiInfo? = cache.wifiInfo
        return if (wifiInfo == null || wifiInfo.networkId == -1) {
            WiFiConnection.EMPTY
        } else {
            val ssid = convertSSID(String.nullToEmpty(wifiInfo.ssid))
            val wiFiIdentifier = WiFiIdentifier(ssid, String.nullToEmpty(wifiInfo.bssid))

            WiFiConnection(wiFiIdentifier, convertIpV4Address(wifiInfo.ipV4Address()), wifiInfo.linkSpeed)
        }
    }

    @RequiresApi(Build.VERSION_CODES.M)
    internal fun transformCacheResults(): List<WiFiDetail> =
        cache.scanResults().map { transform(it) }

    @RequiresApi(Build.VERSION_CODES.M)
    internal fun transformToWiFiData(): WiFiData =
        WiFiData(transformCacheResults(), transformWifiInfo())

    internal fun wiFiStandard(scanResult: ScanResult): WiFiStandardId =
        if (minVersionR()) {
            scanResult.wifiStandard
        } else {
            WiFiStandard.UNKNOWN.wiFiStandardId
        }

    internal fun securityTypes(scanResult: ScanResult): List<Int> =
        if (minVersionT()) {
            scanResult.securityTypes.asList()
        } else {
            listOf()
        }

    internal fun minVersionR(): Boolean = buildMinVersionR()
    internal fun minVersionT(): Boolean = buildMinVersionT()

    @RequiresApi(Build.VERSION_CODES.M)
    private fun transform(cacheResult: CacheResult): WiFiDetail {
        val scanResult = cacheResult.scanResult
        val wiFiWidth = WiFiWidth.findOne(scanResult.channelWidth)
        val centerFrequency = wiFiWidth.calculateCenter(scanResult.frequency, scanResult.centerFreq0)
        val mc80211 = scanResult.is80211mcResponder
        val wiFiStandard = WiFiStandard.findOne(wiFiStandard(scanResult))
        val wiFiSignal = WiFiSignal(
            scanResult.frequency, centerFrequency, wiFiWidth,
            cacheResult.average, mc80211, wiFiStandard, scanResult.timestamp
        )
        val channelDisplay=wiFiSignal.channelDisplay()
        val distance=wiFiSignal.distance
        val width="(${wiFiSignal.wiFiWidth.frequencyWidth}${WiFiSignal.FREQUENCY_UNITS})"
        val wifiAbility= WiFiAbility(channelDisplay,distance,width)
        val wiFiIdentifier = WiFiIdentifier(
            scanResult.ssid(),
            String.nullToEmpty(scanResult.BSSID)

        )
        val wiFiSecurity = WiFiSecurity(
            String.nullToEmpty(scanResult.capabilities),
            securityTypes(scanResult)
        )
        return WiFiDetail(wiFiIdentifier, wiFiSecurity, wiFiSignal,wifiAbility)
    }



}
