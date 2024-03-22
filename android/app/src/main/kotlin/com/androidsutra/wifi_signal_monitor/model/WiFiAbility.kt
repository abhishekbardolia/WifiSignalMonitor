package com.androidsutra.wifi_signal_monitor.model

import com.androidsutra.wifi_signal_monitor.utils.EMPTY

data class WiFiAbility (val channelDisplay:String= String.EMPTY, val distance:String= String.EMPTY, val width:String= String.EMPTY){
    companion object {
        val EMPTY = WiFiAbility()
    }
}