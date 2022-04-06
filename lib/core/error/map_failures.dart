import 'package:garden/core/error/error_messages.dart';
import 'package:garden/core/error/failures.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE;
    case BadRequestFailure:
      return BAD_REQUEST_FAILURE;
      return 'Unexpected error';
    default:
      return 'Error occured';
  }
}

String mapFailureToExceptionsMessage(Failure failure) {
  if (failure is BadRequestFailure) {
    return failure.message;
  } else if (failure is ServerFailure) {
    return failure.message;
  } else {
    return 'Unexpected error';
  }
}
