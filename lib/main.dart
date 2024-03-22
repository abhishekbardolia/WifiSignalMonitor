import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter/services.dart' as services;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wifi_signal_monitor/splashscreen/presentation/splashscreen.dart';

import 'di.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  SystemChrome.setPreferredOrientations([services.DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: EasyLoading.init(),
        title: 'Wifi Signal Monitor',
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}

