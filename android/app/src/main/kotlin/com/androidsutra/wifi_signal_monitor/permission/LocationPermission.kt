
package com.vrem.wifianalyzer.permission

import android.annotation.TargetApi
import android.app.Activity
import android.location.LocationManager
import android.os.Build
import com.androidsutra.wifi_signal_monitor.utils.buildMinVersionP

class LocationPermission(private val activity: Activity) {
    fun enabled(): Boolean =
        if (buildMinVersionP()) {
            try {
                val locationManager = activity.getSystemService(LocationManager::class.java)
                locationEnabled(locationManager) ||
                    networkProviderEnabled(locationManager) ||
                    gpsProviderEnabled(locationManager)
            } catch (e: Exception) {
                false
            }
        } else {
            true
        }

    private fun gpsProviderEnabled(locationManager: LocationManager): Boolean =
        try {
            locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER)
        } catch (e: Exception) {
            false
        }

    private fun networkProviderEnabled(locationManager: LocationManager): Boolean =
        try {
            locationManager.isProviderEnabled(LocationManager.NETWORK_PROVIDER)
        } catch (e: Exception) {
            false
        }

    @TargetApi(Build.VERSION_CODES.P)
    private fun locationEnabled(locationManager: LocationManager): Boolean =
        try {
            locationManager.isLocationEnabled
        } catch (e: Exception) {
            false
        }

}