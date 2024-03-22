package com.androidsutra.wifi_signal_monitor.scanner

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.wifi.WifiManager
import com.androidsutra.wifi_signal_monitor.MainActivity

fun interface Callback { // Compliant, function interface used
    fun onSuccess()
}

internal class ScanResultsReceiver(private val mainActivity: MainActivity, private val callback: Callback) :
    BroadcastReceiver() {
    private var registered = false

    fun register() {
        if (!registered) {
            mainActivity.registerReceiver(this, makeIntentFilter(WifiManager.SCAN_RESULTS_AVAILABLE_ACTION))
            registered = true
        }
    }

    fun unregister() {
        if (registered) {
            mainActivity.unregisterReceiver(this)
            registered = false
        }
    }

    fun makeIntentFilter(action: String): IntentFilter = IntentFilter(action)

    override fun onReceive(context: Context, intent: Intent) {
        if (WifiManager.SCAN_RESULTS_AVAILABLE_ACTION == intent.action &&
            intent.getBooleanExtra(WifiManager.EXTRA_RESULTS_UPDATED, false)
        ) {
            callback.onSuccess()
        }
    }
}