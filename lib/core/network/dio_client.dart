import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DioClient {
  const DioClient(this._baseUrl);

  final String _baseUrl;

  Dio create({
    bool ignoreApiInterceptor = false,
  }) {
    return Dio(_createBaseOptions())
      ..interceptors.add(const ApiInterceptor())
      ..addLoggingInterceptor()
      ..ignoreBadCertificate();
  }

  BaseOptions _createBaseOptions() {
    return BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(minutes: 1),
    );
  }
}

class ApiInterceptor extends Interceptor {
  const ApiInterceptor();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    await options.setDefaultHeaders();
    dev.log('headers: ${options.headers}');

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
  }
}

class DioLoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    dev.log(
        "┌----- Request ------------------------------------------------------------------");
    dev.log('| [DIO] ${options.method} ${options.uri}');
    if (options.data != null) {
      dev.log('| ${options.data.toString()}');
    }
    dev.log('| Headers:');
    options.headers.forEach((key, value) {
      dev.log('|\t$key: $value');
    });
    dev.log(
        "└--------------------------------------------------------------------------------");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    dev.log(
        "┌----- Response -----------------------------------------------------------------");
    dev.log(
        "| [DIO] ${response.statusCode} ${response.statusMessage} ${response.requestOptions.uri}");
    final responseData = response.data;
    if (responseData != null) {
      if (responseData is Map) {
        final jsonResponse = jsonEncode(responseData);
        dev.log('| $jsonResponse');
      } else {
        dev.log('| ${response.data.toString()}');
      }
    }
    dev.log(
        "└--------------------------------------------------------------------------------");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    dev.log(
        "┌----- Error --------------------------------------------------------------------");
    dev.log("| [DIO] ${err.requestOptions.method} ${err.requestOptions.uri}");
    dev.log("| ${err.error}: ${err.response.toString()}");
    dev.log(
        "└--------------------------------------------------------------------------------");
    super.onError(err, handler);
  }
}

extension DioExt on Dio {
  void addLoggingInterceptor() {
    if (kDebugMode) {
      interceptors.add(DioLoggingInterceptor());
    }
  }

  void ignoreBadCertificate() {
    if (!kIsWeb) {
      (httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        return HttpClient()
          ..badCertificateCallback =
              ((X509Certificate cert, String host, int port) => true);
      };
    }
  }
}

extension RequestOptionsExt on RequestOptions {
  Future<RequestOptions> setDefaultHeaders() async {
    final packageInfo = await PackageInfo.fromPlatform();

    String platform;
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        platform = 'android';
      } else if (Platform.isIOS) {
        platform = 'ios';
      } else {
        platform = 'desktop';
      }
    } else {
      platform = 'web';
    }

    headers.addAll({
      HttpHeaders.contentTypeHeader: 'application/json',
      'x-client-id': packageInfo.packageName,
      'x-client-version': packageInfo.version,
    });

    /*headers.putIfAbsent('client-platform', () => platform);
    final tokenDataSource = locator<TokenLocalDataSource>();
    final accessToken = await tokenDataSource.getAccessToken();
    headers.putIfAbsent(
      HttpHeaders.authorizationHeader,
      () => 'Bearer $accessToken',
    );*/

    return this;
  }
}
