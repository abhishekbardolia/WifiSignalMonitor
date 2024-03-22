
import 'package:dartz/dartz.dart';

import '../../data/data_source/get_wifi_detail_data_source.dart';
import '../model/error/exceptions.dart';
import '../model/error/failure.dart';
import 'get_wifi_detail_repository.dart';

class GetWifiDetailRepositoryImpl extends GetWifiDetailRepository{
  GetWifiDetailRepositoryImpl({required this.getWifiDetailDataSource});
  GetWifiDetailDataSource getWifiDetailDataSource;

  @override
  Future<Either<Failure, Unit>> getWifiDetails() async{
    try{
      await getWifiDetailDataSource.getWifiDetails();
      return right(unit);
    }on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessage, code: e.code));
    }
  }


}