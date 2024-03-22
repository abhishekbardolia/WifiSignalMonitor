import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../data/model/error/failure.dart';
import '../../data/model/wifi_details_model.dart';
import '../../usecase/get_wifi_analyser_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late StreamController<WifiDetailsModel> _wifiDetailController;
  late Stream<WifiDetailsModel> wifiDetailStream;
  GetWifiAnalyserUseCase getWifiAnalyserUseCase;
  EventChannel _eventChannel = EventChannel('wifi_monitor_event');
  HomeBloc({required this.getWifiAnalyserUseCase}) : super(HomeInitial()) {
    _initStreams();
    WiFiNetworksEvent();
    wifiDetailStream=_wifiDetailController.stream;
    Timer.periodic(Duration(seconds: 3), (timer) async {
      Either<Failure, Unit> getWifiAnalyser = await getWifiAnalyserUseCase();
    });
    on<FetchItems>((event, emit) async {
      try {
        emit(ItemsLoading());
        final List<String> items = await fetchItems();
        emit(ItemsLoaded(items));
      } catch (_) {
        emit(ItemsError());
      }
    });
  }

  Future<List<String>> fetchItems() async {
    await Future.delayed(Duration(seconds: 1));
    return List.generate(20, (index) => 'Item $index');
  }

  Future<void> WiFiNetworksEvent() async {
    try {
      _eventChannel
          .receiveBroadcastStream()
          .listen(_onEvent, onError: _onError);
    } on PlatformException catch (e) {
      print("Failed to get wifi networks: '${e.message}'.");
    }
  }

  void _onEvent(event) {
    if (event.toString() != null) {
      final parsedJson = json.decode(event);
      final wiFiDetails =
      WifiDetailsModel.fromJson(parsedJson);
      //
      _wifiDetailController.add(wiFiDetails);
      print("_onEvent ${parsedJson.toString()}");
    }
  }

  void _onError(dynamic event) {
    _wifiDetailController.add(event);
  }

  void _initStreams() {
    _wifiDetailController=StreamController<WifiDetailsModel>.broadcast();
    wifiDetailStream=_wifiDetailController.stream;
  }
}
