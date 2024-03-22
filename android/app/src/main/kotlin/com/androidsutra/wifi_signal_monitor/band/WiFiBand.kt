package com.androidsutra.wifi_signal_monitor.band

import androidx.annotation.StringRes
import com.androidsutra.wifi_signal_monitor.MainContext
import com.androidsutra.wifi_signal_monitor.R


typealias Available = () -> Boolean

internal val availableGHZ2: Available = { true }
internal val availableGHZ5: Available = { MainContext.INSTANCE.wiFiManagerWrapper.is5GHzBandSupported() }
internal val availableGHZ6: Available = { MainContext.INSTANCE.wiFiManagerWrapper.is6GHzBandSupported() }

enum class WiFiBand(@StringRes val textResource: Int, val wiFiChannels: WiFiChannels, val available: Available) {
    GHZ2(R.string.wifi_band_2ghz, WiFiChannelsGHZ2(), availableGHZ2),
    GHZ5(R.string.wifi_band_5ghz, WiFiChannelsGHZ5(), availableGHZ5),
    GHZ6(R.string.wifi_band_6ghz, WiFiChannelsGHZ6(), availableGHZ6);

//    val ghz2: Boolean get() = GHZ2 == this
//    val ghz5: Boolean get() = GHZ5 == this
//    val ghz6: Boolean get() = GHZ6 == this

    companion object {
        fun find(frequency: Int): WiFiBand = WiFiBand.values().firstOrNull { it.wiFiChannels.inRange(frequency) } ?: WiFiBand.GHZ2
    }

}
