
package com.androidsutra.wifi_signal_monitor.model

import androidx.annotation.DrawableRes
import androidx.annotation.StringRes
import com.androidsutra.wifi_signal_monitor.R
import com.androidsutra.wifi_signal_monitor.utils.EMPTY
import java.security.Security
import java.util.Locale

private val extras = listOf("SAE", "EAP_SUITE_B_192", "OWE")
private val regex = Regex("[^A-Z0-9_]")

//enum class Security(@DrawableRes val imageResource: Int, val extras: List<String> = listOf()) {
//    NONE(R.drawable.ic_lock_open),
//    WPS(R.drawable.ic_lock_outline),
//    WEP(R.drawable.ic_lock_outline),
//    WPA(R.drawable.ic_lock),
//    WPA2(R.drawable.ic_lock),
//    WPA3(R.drawable.ic_lock, extras);
//}

typealias SecurityTypeId = Int

enum class WiFiSecurityType(val securityTypeId: SecurityTypeId, @StringRes val textResource: Int) {
    UNKNOWN(-1, R.string.security_type_unknown),
    OPEN(0, R.string.security_type_open),
    WEP(1, R.string.security_type_wep),
    PSK(2, R.string.security_type_psk),
    EAP(3, R.string.security_type_eap),
    SAE(4, R.string.security_type_sae),
    EAP_WPA3_ENTERPRISE_192_BIT(5, R.string.security_type_eap_wpa3_enterprise_192_bit),
    OWE(6, R.string.security_type_owe),
    WAPI_PSK(7, R.string.security_type_wapi_psk),
    WAPI_CERT(8, R.string.security_type_wapi_cert),
    EAP_WPA3_ENTERPRISE(9, R.string.security_type_eap_wpa3_enterprise),
    OSEN(10, R.string.security_type_osen),
    PASSPOINT_R1_R2(11, R.string.security_type_passpoint_r1_r2),
    PASSPOINT_R3(12, R.string.security_type_passpoint_r3),
    SECURITY_TYPE_DPP(13, R.string.security_type_dpp);

    companion object {
        fun findOne(securityTypeId: SecurityTypeId) =
            WiFiSecurityType.values().firstOrNull { it.securityTypeId == securityTypeId } ?: UNKNOWN

        fun findAll(securityTypes: List<Int>): Set<WiFiSecurityType> = securityTypes.map { findOne(it) }.toSet()
    }
}

data class WiFiSecurity(val capabilities: String = String.EMPTY, val securityTypes: List<Int> = listOf()) {

    // This assumes that the first security type identified is the primary one.
    val security: WiFiSecurityType
        get() = wiFiSecurityTypes.firstOrNull() ?: WiFiSecurityType.UNKNOWN

    // Determine the set of WiFiSecurityTypes based on the security types IDs and the capabilities.
    val wiFiSecurityTypes: Set<WiFiSecurityType>
        get() {
            val fromTypes = WiFiSecurityType.findAll(securityTypes)
            val fromCapabilities = transformCapabilities()
            return (fromTypes + fromCapabilities).ifEmpty { setOf(WiFiSecurityType.UNKNOWN) }
        }

    // Transforms capabilities into WiFiSecurityType based on some assumed mappings.
    private fun transformCapabilities(): Set<WiFiSecurityType> =
        regex.replace(capabilities.uppercase(Locale.getDefault()), "-")
            .split("-")
            .filter { it.isNotBlank() }
            // Map the capabilities string to WiFiSecurityType; this may require custom logic based on your specific capabilities format.
            .mapNotNull { capability -> mapCapabilityToSecurityType(capability) }
            .toSet()

    // Placeholder for a method to map a capability string to a WiFiSecurityType. You'll need to define these mappings based on your needs.
    private fun mapCapabilityToSecurityType(capability: String): WiFiSecurityType? {
        // Implement mapping logic here
        // Example:
        return when (capability) {
            "WEP" -> WiFiSecurityType.WEP
            "PSK" -> WiFiSecurityType.PSK
            // Add other mappings as necessary
            else -> null
        }
    }

    companion object {
        val EMPTY = WiFiSecurity()
    }
}
