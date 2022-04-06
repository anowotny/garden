import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]);
}

//General failures
class ServerFailure extends Failure {
  final String message;

  ServerFailure(this.message);
  @override
  List<Object> get props => [];
}

class BadRequestFailure extends Failure {
  final String message;

  BadRequestFailure(this.message);
  @override
  List<Object> get props => [message];
}

class NoSuchMethodFailure extends Failure {
  final String message;
  NoSuchMethodFailure(this.message);
  @override
  List<Object> get props => [message];
}

class NotFoundFailure extends Failure {
  final String message;

  NotFoundFailure(this.message);
  @override
  List<Object> get props => [message];
}
