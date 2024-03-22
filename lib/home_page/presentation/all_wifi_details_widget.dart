
import 'package:flutter/material.dart';
import 'package:wifi_signal_monitor/home_page/data/model/wifi_details_model.dart';
import 'package:wifi_signal_monitor/home_page/presentation/widget/all_wifi_details.dart';
import 'package:wifi_signal_monitor/home_page/presentation/widget/connected_wifi.dart';



class AllWifiDetailWidget extends StatelessWidget {
  const AllWifiDetailWidget({super.key, this.data});

  final WifiDetailsModel? data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ConnectedWifi(data: data),
          SizedBox(height: 8,),
          AllWifiDetails(data: data)
        ],
      ),
    );
  }

}
