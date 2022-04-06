class ServerException implements Exception {
  final String message;
  final int statusCode;

  ServerException({this.message, this.statusCode});
}


class BadRequestException implements Exception {
  final String message;
  final int statusCode;

  BadRequestException({this.statusCode, this.message});
}



class NotFoundException implements Exception {
  final String message;
  final int statusCode;

  NotFoundException({this.message, this.statusCode});
}

