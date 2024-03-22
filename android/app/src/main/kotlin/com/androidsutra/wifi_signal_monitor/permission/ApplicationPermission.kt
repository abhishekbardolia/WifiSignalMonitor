
package com.vrem.wifianalyzer.permission

import android.Manifest
import android.app.Activity
import android.content.pm.PackageManager
import android.os.Build
import androidx.annotation.RequiresApi

class ApplicationPermission(
    private val activity: Activity,
//    private val permissionDialog: PermissionDialog = PermissionDialog(activity)
) {
    @RequiresApi(Build.VERSION_CODES.M)
    fun check() {
        PERMISSIONS.forEach {
            if (!granted(it) && !activity.isFinishing) {
//                permissionDialog.show()
            }
        }
    }

    fun granted(requestCode: Int, grantResults: IntArray): Boolean =
        requestCode == REQUEST_CODE && grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED

    @RequiresApi(Build.VERSION_CODES.M)
    fun granted(): Boolean =
        PERMISSIONS.all { return granted(it) }

    @RequiresApi(Build.VERSION_CODES.M)
    private fun granted(permission: String): Boolean =
        activity.checkSelfPermission(permission) == PackageManager.PERMISSION_GRANTED

    companion object {
        internal val PERMISSIONS = arrayOf(Manifest.permission.ACCESS_FINE_LOCATION)
        internal const val REQUEST_CODE = 0x123450
    }

}