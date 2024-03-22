import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  Failure({required this.message});
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  final code;
  ServerFailure({message, this.code}) : super(message: message);
}

class CacheFailure extends Failure {
  CacheFailure({message}) : super(message: message);
}

class ValidationFailure extends Failure {
  ValidationFailure({message}) : super(message: message);
}
