package com.androidsutra.wifi_signal_monitor.scanner

import android.os.Build
import androidx.annotation.RequiresApi
import com.androidsutra.wifi_signal_monitor.Transformer
import com.androidsutra.wifi_signal_monitor.manager.WiFiManagerWrapper
import com.androidsutra.wifi_signal_monitor.model.WiFiData
import com.androidsutra.wifi_signal_monitor.permission.PermissionService
import com.androidsutra.wifi_signal_monitor.settings.Settings


internal class Scanner(
    val wiFiManagerWrapper: WiFiManagerWrapper,
    val settings: Settings,
    val permissionService: PermissionService,
    val transformer: Transformer
) : ScannerService {
    private val updateNotifiers: MutableList<UpdateNotifier> = mutableListOf()

    private var wiFiData: List<WiFiData> = emptyList()
    private var initialScan: Boolean = false

//    lateinit var periodicScan: PeriodicScan
    lateinit var scannerCallback: ScannerCallback
    lateinit var scanResultsReceiver: ScanResultsReceiver

    @RequiresApi(Build.VERSION_CODES.M)
    override fun update() {
        wiFiManagerWrapper.enableWiFi()
        if (permissionService.enabled()) {
            scanResultsReceiver.register()
            wiFiManagerWrapper.startScan()
            if (!initialScan) {
                scannerCallback.onSuccess()
                initialScan = true
            }
        }
        wiFiData = listOf(transformer.transformToWiFiData())
        updateNotifiers.forEach { it.update(wiFiData) }
    }

    override fun wiFiData(): List<WiFiData> = wiFiData

    override fun register(updateNotifier: UpdateNotifier): Boolean = updateNotifiers.add(updateNotifier)

    override fun unregister(updateNotifier: UpdateNotifier): Boolean = updateNotifiers.remove(updateNotifier)
    override fun getUpdateNotifier(updateNotifier: UpdateNotifier) {}

    override fun pause() {
//        periodicScan.stop()
        scanResultsReceiver.unregister()
    }

//    override fun running(): Boolean = periodicScan.running
//
//    override fun resume(): Unit = periodicScan.start()
//
//    override fun resumeWithDelay(): Unit = periodicScan.startWithDelay()

    override fun stop() {
//        periodicScan.stop()
        updateNotifiers.clear()
//        if (settings.wiFiOffOnExit()) {
//            wiFiManagerWrapper.disableWiFi()
//        }
        scanResultsReceiver.unregister()
    }

//    override fun toggle(): Unit =
//        if (periodicScan.running) {
//            periodicScan.stop()
//        } else {
//            periodicScan.start()
//        }
//
//    fun registered(): Int = updateNotifiers.size

}