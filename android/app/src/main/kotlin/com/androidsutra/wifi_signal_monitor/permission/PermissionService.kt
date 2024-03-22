
package com.androidsutra.wifi_signal_monitor.permission

import android.app.Activity
import com.vrem.wifianalyzer.permission.ApplicationPermission
import com.vrem.wifianalyzer.permission.LocationPermission

class PermissionService(
    private val activity: Activity,
    private val locationPermission: LocationPermission = LocationPermission(activity),
    private val applicationPermission: ApplicationPermission = ApplicationPermission(activity)
) {

    fun enabled(): Boolean = locationEnabled() && permissionGranted()

    fun locationEnabled(): Boolean = locationPermission.enabled()

    fun check(): Unit = applicationPermission.check()

    fun granted(requestCode: Int, grantResults: IntArray): Boolean =
        applicationPermission.granted(requestCode, grantResults)

    fun permissionGranted(): Boolean = applicationPermission.granted()
}