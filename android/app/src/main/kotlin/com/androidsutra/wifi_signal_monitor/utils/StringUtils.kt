
package com.androidsutra.wifi_signal_monitor.utils

import java.util.Locale

val String.Companion.EMPTY: String get() = ""
val String.Companion.SPACE_SEPARATOR: String get() = " "
fun String.Companion.nullToEmpty(value: String?): String = value ?: String.EMPTY
fun String.specialTrim(): String = this.trim { it <= ' ' }.replace(" +".toRegex(), String.SPACE_SEPARATOR)
fun String.toCapitalize(locale: Locale): String = this.replaceFirstChar { word -> word.uppercase(locale) }
