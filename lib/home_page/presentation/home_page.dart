import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wifi_signal_monitor/di.dart';
import 'package:wifi_signal_monitor/home_page/domain/bloc/home_bloc.dart';

import '../../util/app_colors.dart';
import '../data/model/wifi_details_model.dart';
import 'all_wifi_details_widget.dart';

class HomePage extends StatelessWidget {
  final HomeBloc _homeBloc=injector<HomeBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(title: Text('Wifi Analyser',style: TextStyle(color: Colors.white),),backgroundColor: bgColor),
      body: BlocProvider.value(
        value:_homeBloc..add(FetchItems()),
        child: StreamBuilder<WifiDetailsModel>(
          stream: _homeBloc.wifiDetailStream,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return AllWifiDetailWidget(data:snapshot.data);
            }

            return Container();
          }
        )
      ),
    );
  }
}
