import 'package:dartz/dartz.dart';

import '../model/error/failure.dart';

abstract class GetWifiDetailRepository{
  Future<Either<Failure,Unit>> getWifiDetails();
}