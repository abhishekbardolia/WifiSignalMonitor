import 'dart:async';

import 'package:flutter/services.dart';

import '../model/error/exceptions.dart';
import 'get_wifi_detail_data_source.dart';

class GetWifiDetailDataSourceImpl extends GetWifiDetailDataSource{
  MethodChannel _channel = MethodChannel('wifi_monitor');
  @override
  Future<void> getWifiDetails() async {
    try {
      final result = await _channel.invokeMethod('WifiNative');
      print(result);
    } on PlatformException catch (e) {
      throw ServerException(errorMessage: "Failed to get wifi networks: '${e.message}");
    }
  }
}