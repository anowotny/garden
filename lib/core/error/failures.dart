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

class CacheFailure extends Failure {
  final String message;

  CacheFailure(this.message);
  @override
  List<Object> get props => [];
}

class BadRequestFailure extends Failure {
  final String message;

  BadRequestFailure(this.message);
  @override
  List<Object> get props => [message];
}

class UnauthorizedFailure extends Failure {
  final String message;

  UnauthorizedFailure(this.message);
  @override
  List<Object> get props => [message];
}

class NoConnectionFailure extends Failure {
  final String message;

  NoConnectionFailure(this.message);
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

class SocketFailure extends Failure {
  final String message;

  SocketFailure(this.message);
  @override
  List<Object> get props => [message];
}

class TimeoutFailure extends Failure {
  final String message;

  TimeoutFailure(this.message);
  @override
  List<Object> get props => [message];
}

class ClientFailure extends Failure {
  final String message;

  ClientFailure(this.message);
  @override
  List<Object> get props => [message];
}

class PlatformFailure extends Failure{
final String message;

  PlatformFailure(this.message);

  @override
  List<Object> get props => [message];

}