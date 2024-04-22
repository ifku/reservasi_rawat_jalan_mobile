// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponse<T>(
      message: json['message'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      isSuccess: json['isSuccess'] as bool,
    );

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'isSuccess': instance.isSuccess,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

ApiListResponse<T> _$ApiListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiListResponse<T>(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
      isSuccess: json['isSuccess'] as bool,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$ApiListResponseToJson<T>(
  ApiListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data?.map(toJsonT).toList(),
      'isSuccess': instance.isSuccess,
      'total': instance.total,
    };
