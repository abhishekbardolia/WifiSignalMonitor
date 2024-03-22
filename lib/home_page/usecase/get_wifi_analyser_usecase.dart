import 'package:dartz/dartz.dart';

import '../data/model/error/failure.dart';
import '../data/repository/get_wifi_detail_repository.dart';

class GetWifiAnalyserUseCase {
  GetWifiDetailRepository getWifiDetailRepository;

  GetWifiAnalyserUseCase({required this.getWifiDetailRepository});

  Future<Either<Failure, Unit>> call() async {
    return await getWifiDetailRepository.getWifiDetails();
  }
}
