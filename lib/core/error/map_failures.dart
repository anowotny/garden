
import 'package:garden/core/error/error_messages.dart';
import 'package:garden/core/error/failures.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE;
    case CacheFailure:
      return CACHE_FAILURE;
    case UnauthorizedFailure:
      return UNAUTHORIZED_FAILURE;
    case BadRequestFailure:
      return BAD_REQUEST_FAILURE;
    case NoSuchMethodFailure:
      return FB_GOOGLE_CANCELED;
    case SocketFailure:
      return SOCKET_FAILURE;
    case TimeoutFailure:
      return TIMEOUT_FAILURE;
    case NoConnectionFailure:
      return NO_INTERNET_CONNECTION;
    case NoSuchMethodFailure:
      return NO_SUCH_METHOD_ERROR;
    case ClientFailure:
      return CLIENT_FAILURE;
    case PlatformFailure:
      return PLATFORM_FAILURE;
    default:
      return 'Unexpected error';
  }
}

String mapFailureToExceptionsMessage(Failure failure) {
  if (failure is BadRequestFailure) {
    if (failure.message.contains(USER_ALERADY_REGISTERED_ERROR)) {
      return errorMessagesMap[USER_ALERADY_REGISTERED_ERROR];
    } else if (failure.message.contains(INVALID_TOKEN_ERROR)) {
      return errorMessagesMap[INVALID_TOKEN_ERROR];
    } else {
      return failure.message;
    }
  } else if (failure is NoSuchMethodFailure) {
    return failure.message;
  } else if (failure is SocketFailure) {
    return failure.message;
  } else if (failure is ServerFailure) {
    return failure.message;
  } else if (failure is CacheFailure) {
    return failure.message;
  } else if (failure is NoConnectionFailure) {
    return failure.message;
  } else if (failure is PlatformFailure) {
    return failure.message;
  } else if (failure is UnauthorizedFailure) {
    if (failure.message.contains(USER_UNREGISTERED)) {
      return errorMessagesMap[USER_UNREGISTERED];
    } else {
      return failure.message;
    }
  } else {
    return 'Wystąpił nieoczekiwany błąd';
  }
}
