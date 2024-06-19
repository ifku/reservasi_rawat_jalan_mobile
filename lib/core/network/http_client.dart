import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/app_exception.dart';

class AppHttpClient {
  final Dio _dio;

  AppHttpClient({required dio}) : _dio = dio;

  Future<Either<Exception, Map<String, dynamic>>> get(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.toNetworkException());
    } catch (error, stackTrace) {
      return Left(AppException(error.toString(), stackTrace: stackTrace));
    }
  }

  Future<Either<Exception, Map<String, dynamic>>> post(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post(url,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken);
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.toNetworkException());
    } catch (error, stackTrace) {
      return Left(AppException(error.toString(), stackTrace: stackTrace));
    }
  }

  Future<Either<Exception, Map<String, dynamic>>> patch(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.toNetworkException());
    } catch (e, s) {
      return Left(AppException(e.toString(), stackTrace: s));
    }
  }

  Future<Either<Exception, Map<String, dynamic>>> put(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.toNetworkException());
    } catch (e, s) {
      return Left(AppException(e.toString(), stackTrace: s));
    }
  }

  Future<Either<Exception, Map<String, dynamic>>> delete(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.toNetworkException());
    } catch (e, s) {
      return Left(AppException(e.toString(), stackTrace: s));
    }
  }
}
