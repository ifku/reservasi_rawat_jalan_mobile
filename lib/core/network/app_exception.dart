import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';

class AppException implements Exception {
  String message;
  int? code;
  StackTrace? stackTrace;

  AppException(this.message, {this.code, this.stackTrace});

  @override
  String toString() {
    return message;
  }
}

class BadRequestException extends AppException {
  BadRequestException(String message) : super(message);
}

class UnauthorizedException extends AppException {
  UnauthorizedException(String message) : super(message);
}

class ForbiddenException extends AppException {
  ForbiddenException(String message) : super(message);
}

class NotFoundException extends AppException {
  NotFoundException(String message) : super(message);
}

class InternalServerException extends AppException {
  InternalServerException(String message) : super(message);
}

class RequestTimeoutException implements Exception {
  @override
  String toString() {
    return LocaleKeys.exception_requestTimeOutException.tr();
  }
}

class RequestCancelledException implements Exception {
  @override
  String toString() {
    return LocaleKeys.exception_requestCancelledException.tr();
  }
}

class NoInternetException implements Exception {
  @override
  String toString() {
    return LocaleKeys.exception_noInternetException.tr();
  }
}

class SignInWithGoogleException implements Exception {
  @override
  String toString() {
    return LocaleKeys.exception_googleSignInException.tr();
  }
}

extension DioExceptionExtension on DioException {
  Exception toNetworkException() {
    Exception exception;
    switch (type) {
      case DioExceptionType.cancel:
        exception = RequestCancelledException();
        break;
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        exception = RequestTimeoutException();
        break;
      case DioExceptionType.badResponse:
        final resp = response;
        final respData = resp?.data;
        String errorMessage;
        if (respData is Map) {
          errorMessage = respData['message'] ??
              LocaleKeys.exception_generalErrorException.tr();
        } else {
          errorMessage = respData.toString();
        }

        switch (resp?.statusCode) {
          case 400:
            exception = BadRequestException(errorMessage);
            break;
          case 401:
            exception = UnauthorizedException(errorMessage);
            break;
          case 403:
            exception = ForbiddenException(errorMessage);
            break;
          case 404:
            exception = NotFoundException(errorMessage);
            break;
          case 500:
            exception = InternalServerException(errorMessage);
          default:
            exception = AppException(errorMessage);
            break;
        }
        break;
      case DioExceptionType.unknown:
        if (message?.contains('SocketException') == true) {
          exception = NoInternetException();
          break;
        }
        exception =
            AppException(LocaleKeys.exception_generalErrorException.tr());
        break;
      default:
        exception =
            AppException(LocaleKeys.exception_generalErrorException.tr());
        break;
    }
    return exception;
  }
}
