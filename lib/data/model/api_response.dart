import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  String? message;
  T? data;
  bool isSuccess;

  ApiResponse({required this.message, this.data, required this.isSuccess});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>) create,
  ) {
    return ApiResponse<T>(
      isSuccess: json["isSuccess"],
      data: json["value"] != null && json["value"].toString() != "{}"
          ? json["value"]["data"].toString() != "{}"
              ? create(json["value"]["data"])
              : null
          : null,
      message: json["message"],
    );
  }
}

@JsonSerializable(genericArgumentFactories: true)
class ApiListResponse<T> {
  String? message;
  List<T>? data;
  bool isSuccess;

  ApiListResponse({
    required this.message,
    this.data,
    required this.isSuccess,
  });

  factory ApiListResponse.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>) create,
  ) {
    var data = <T>[];

    if (json['data'] != null) {
      final jsonData = json['data'];
      if (jsonData is List) {
        for (var v in jsonData) {
          data.add(create(v));
        }
      }
    }

    return ApiListResponse<T>(
        message: json["message"], data: data, isSuccess: json["isSuccess"]);
  }
}
