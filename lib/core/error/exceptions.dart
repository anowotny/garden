class ServerException implements Exception {
  final String message;
  final int statusCode;

  ServerException({this.message, this.statusCode});
}

class CacheException implements Exception {}

class BadRequestException implements Exception {
  final String message;
  final int statusCode;

  BadRequestException({this.statusCode, this.message});
}

class UnauthorizedException implements Exception {
  final String message;
  final int statusCode;

  UnauthorizedException({this.message, this.statusCode});
}

class NotFoundException implements Exception {
  final String message;
  final int statusCode;

  NotFoundException({this.message, this.statusCode});
}

class TimeoutException implements Exception {
  final String message;
  final int statusCode;

  TimeoutException({this.message, this.statusCode});
}
