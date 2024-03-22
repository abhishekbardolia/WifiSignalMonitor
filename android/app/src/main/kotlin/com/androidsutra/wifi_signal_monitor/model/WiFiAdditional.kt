
package com.androidsutra.wifi_signal_monitor.model

import com.androidsutra.wifi_signal_monitor.utils.EMPTY


class WiFiAdditional(
    val vendorName: String = String.EMPTY,
    val wiFiConnection: WiFiConnection = WiFiConnection.EMPTY
) {

    companion object {
        val EMPTY = WiFiAdditional()
    }

}