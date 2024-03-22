
package com.androidsutra.wifi_signal_monitor.model



data class WiFiDetail(
    val wiFiIdentifier: WiFiIdentifier = WiFiIdentifier.EMPTY,
    val wiFiSecurity: WiFiSecurity = WiFiSecurity.EMPTY,
    val wiFiSignal: WiFiSignal = WiFiSignal.EMPTY,
    val wifiAbility: WiFiAbility = WiFiAbility.EMPTY,
    val wiFiAdditional: WiFiAdditional = WiFiAdditional.EMPTY,
//    val children: List<WiFiDetail> = listOf()
) : Comparable<WiFiDetail> {

    constructor(wiFiDetail: WiFiDetail, wifiAbility: WiFiAbility) :
        this(wiFiDetail.wiFiIdentifier, wiFiDetail.wiFiSecurity, wiFiDetail.wiFiSignal, wifiAbility)

    constructor(wiFiDetail: WiFiDetail, wiFiAdditional: WiFiAdditional) :
            this(wiFiDetail.wiFiIdentifier, wiFiDetail.wiFiSecurity, wiFiDetail.wiFiSignal)


//    constructor(wiFiDetail: WiFiDetail, children: List<WiFiDetail>) :
//        this(wiFiDetail.wiFiIdentifier, wiFiDetail.wiFiSecurity, wiFiDetail.wiFiSignal, wiFiDetail.wiFiAdditional, children)

//    val noChildren: Boolean
//        get() = children.isNotEmpty()

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false

        other as WiFiDetail

        return wiFiIdentifier == other.wiFiIdentifier
    }

    override fun hashCode(): Int = wiFiIdentifier.hashCode()

    override fun compareTo(other: WiFiDetail): Int = wiFiIdentifier.compareTo(other.wiFiIdentifier)

    companion object {
        val EMPTY = WiFiDetail()
    }
}

