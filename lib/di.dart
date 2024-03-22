import 'package:get_it/get_it.dart';
import 'package:wifi_signal_monitor/home_page/domain/bloc/home_bloc.dart';
import 'package:wifi_signal_monitor/splashscreen/domain/bloc/splash_bloc.dart';

import 'home_page/data/data_source/get_wifi_detail_data_source.dart';
import 'home_page/data/data_source/get_wifi_detail_data_source_impl.dart';
import 'home_page/data/repository/get_wifi_detail_repository.dart';
import 'home_page/data/repository/get_wifi_detail_repository_impl.dart';
import 'home_page/usecase/get_wifi_analyser_usecase.dart';

final injector = GetIt.instance;

Future<void> injectDependencies() async {
  injector.registerLazySingleton<GetWifiDetailDataSource>(
          () => GetWifiDetailDataSourceImpl());
  injector.registerLazySingleton<GetWifiDetailRepository>(
          () => GetWifiDetailRepositoryImpl(getWifiDetailDataSource: injector()));

  injector.registerLazySingleton<GetWifiAnalyserUseCase>(
    () => GetWifiAnalyserUseCase(getWifiDetailRepository: injector()),
  );
  injector.registerLazySingleton<SplashBloc>(
    () => SplashBloc(),
  );
  injector.registerLazySingleton<HomeBloc>(
    () => HomeBloc(getWifiAnalyserUseCase: injector()),
  );


}
