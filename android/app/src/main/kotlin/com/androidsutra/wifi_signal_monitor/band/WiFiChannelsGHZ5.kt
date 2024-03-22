package com.androidsutra.wifi_signal_monitor.band




class WiFiChannelsGHZ5 : WiFiChannels(RANGE, SETS) {
    override fun wiFiChannelPairs(): List<WiFiChannelPair> = SETS


    override fun wiFiChannelByFrequency(frequency: Int, wiFiChannelPair: WiFiChannelPair): WiFiChannel =
        if (inRange(frequency)) wiFiChannel(frequency, wiFiChannelPair) else WiFiChannel.UNKNOWN

    companion object {
        val SET1 = WiFiChannelPair(WiFiChannel(36, 5180), WiFiChannel(64, 5320))
        val SET2 = WiFiChannelPair(WiFiChannel(100, 5500), WiFiChannel(144, 5720))
        val SET3 = WiFiChannelPair(WiFiChannel(149, 5745), WiFiChannel(177, 5885))
        val SETS = listOf(SET1, SET2, SET3)
        private val RANGE = WiFiRange(4900, 5899)
    }
}
