import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

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
      return Left(Exception(error.toString()));
    } catch (error, stackTrace) {
      return Left(Exception(error.toString()));
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
      return Left(Exception(error.toString()));
    } catch (error, stackTrace) {
      return Left(Exception(error.toString()));
    }
  }
}
