
package com.androidsutra.wifi_signal_monitor

import android.annotation.TargetApi
import android.content.Intent
import android.os.Build
import android.provider.Settings
import android.view.WindowManager
import androidx.appcompat.widget.Toolbar


internal fun makeIntent(action: String): Intent = Intent(action)

@TargetApi(Build.VERSION_CODES.Q)
internal fun MainActivity.startWiFiSettings() =
    this.startActivity(makeIntent(Settings.Panel.ACTION_WIFI))

internal fun MainActivity.startLocationSettings() =
    this.startActivity(makeIntent(Settings.ACTION_LOCATION_SOURCE_SETTINGS))

