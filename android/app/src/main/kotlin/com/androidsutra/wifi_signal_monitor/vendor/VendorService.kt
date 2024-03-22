
package com.androidsutra.wifi_signal_monitor.vendor

import android.content.res.Resources
import com.androidsutra.wifi_signal_monitor.R
import com.androidsutra.wifi_signal_monitor.utils.EMPTY
import com.androidsutra.wifi_signal_monitor.utils.readFile

import java.util.Locale
import java.util.TreeMap

class VendorService(private val resources: Resources) {
    private val vendorData: VendorData by lazy { load(resources) }

    fun findVendorName(address: String = String.EMPTY): String =
        vendorData.macs[address.clean()].orEmpty()

    fun findMacAddresses(vendorName: String = String.EMPTY): List<String> =
        vendorData.vendors[vendorName.uppercase(Locale.getDefault())].orEmpty()

    fun findVendors(vendorName: String = String.EMPTY): List<String> {
        val name = vendorName.uppercase(Locale.getDefault())
        return vendorData.vendors.filterKeys { filter(it, name) }.keys.toList()
    }

    internal fun findMacs(): List<String> = vendorData.macs.keys.toList()

    private fun filter(source: String, filter: String): Boolean =
        source.contains(filter) || macContains(source, filter)

    private fun macContains(source: String, filter: String): Boolean =
        findMacAddresses(source).any { it.contains(filter) }

    private fun load(resources: Resources): VendorData {
        val macs: MutableMap<String, String> = TreeMap()
        val vendors: MutableMap<String, List<String>> = TreeMap()
        readFile(resources, R.raw.data)
            .split("\n")
            .map { it.split("|").toTypedArray() }
            .filter { it.size == 2 }
            .forEach {
                val name = it[0]
                val results: List<String> = it[1].chunked(MAX_SIZE)
                results.forEach { macs[it] = name }
                vendors[name] = results.map { it.toMacAddress() }
            }
        return VendorData(vendors, macs)
    }

    private class VendorData(val vendors: Map<String, List<String>>, val macs: Map<String, String>)

}