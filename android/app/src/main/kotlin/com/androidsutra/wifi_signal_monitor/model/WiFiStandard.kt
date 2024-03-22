package com.androidsutra.wifi_signal_monitor.model

import androidx.annotation.DrawableRes
import androidx.annotation.StringRes
import com.androidsutra.wifi_signal_monitor.R
typealias WiFiStandardId = Int
enum class WiFiStandard(val wiFiStandardId: WiFiStandardId, @StringRes val textResource: Int) {
    UNKNOWN(0, R.string.wifi_standard_unknown),
    LEGACY(1, R.string.wifi_standard_legacy),
    N(4, R.string.wifi_standard_n),
    AC(5, R.string.wifi_standard_ac),
    AX(6, R.string.wifi_standard_ax),
    AD(7, R.string.wifi_standard_ad),
    BE(8, R.string.wifi_standard_be);

    companion object {
        fun findOne(wiFiStandardId: WiFiStandardId): WiFiStandard =
            WiFiStandard.values().firstOrNull { it.wiFiStandardId == wiFiStandardId } ?: UNKNOWN
    }
}