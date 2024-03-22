# Keep Gson classes
-keep class com.google.gson.stream.** { *; }

# Keep model classes that are serialized/deserialized with Gson
-keep class com.androidsutra.wifi_signal_monitor.** { *; }

# If you use methods in MainActivity for Gson, keep them as well
-keepclassmembers class com.androidsutra.wifi_signal_monitor.MainActivity {

}

# General rule to prevent Gson from breaking
-keepattributes Signature,RuntimeVisibleAnnotations,AnnotationDefault

# If you use custom annotations
-keepattributes Signature
-keepattributes *Annotation*
-keepattributes Enumerated

