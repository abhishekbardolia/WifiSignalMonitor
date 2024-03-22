import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wifi_signal_monitor/di.dart';
import 'package:wifi_signal_monitor/splashscreen/domain/bloc/splash_bloc.dart';
import 'package:wifi_signal_monitor/util/app_colors.dart';

import '../../home_page/data/model/strength.dart';
import '../../home_page/presentation/home_page.dart';

class SplashScreen extends StatelessWidget {
  final SplashBloc _splashBloc = injector<SplashBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _splashBloc..add(NavigationEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) async {
          if (state is ReadyToNavigate) {
            PermissionStatus status = await Permission.location.request();
            if (status.isGranted) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
            } else if (status.isPermanentlyDenied) {
              final bool? opened = await openAppSettings();
              if (opened != true) {
              }
            } else {
              showSettingDialog(context);

            }
          }
        },
        child: Scaffold(
          backgroundColor: bgColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/logo.svg", color: Colors.white, height: 120),
              SizedBox(height: 8),
              Center(
                child: Text('Wifi Monitor', style: TextStyle(fontSize: 32, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSettingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Permission Required'),
        content: Text('This app requires location permission to function. Please enable it in settings.'),
        actions: [
          TextButton(
            child: Text('Dismiss'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text('Settings'),
            onPressed: () {
              openAppSettings();
            },
          ),
        ],
      ),
    );
  }
}
