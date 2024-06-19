import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  String? message;
  T? data;
  bool isSuccess;

  ApiResponse({
    required this.message,
    this.data,
    required this.isSuccess,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) create,
  ) {
    return ApiResponse<T>(
      isSuccess: json["isSuccess"] ?? false,
      data: json["data"] != null ? create(json["data"]) : null,
      message: json["message"] ?? "",
    );
  }
}

@JsonSerializable(genericArgumentFactories: true)
class ApiListResponse<T> {
  String? message;
  List<T>? data;
  bool isSuccess;
  int? total;

  ApiListResponse(
      {required this.message, this.data, required this.isSuccess, this.total});

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
        message: json["message"],
        data: data,
        isSuccess: json["isSuccess"],
        total: json["total"]);
  }
}

class ListPagingData<T> {
  String? message;
  List<T>? data;
  int total;
  int currentPage;
  int totalPage;
  bool hasNext;
  bool hasPrev;

  ListPagingData({
    this.message,
    this.data,
    required this.total,
    required this.currentPage,
    required this.totalPage,
    required this.hasNext,
    required this.hasPrev,
  });

  factory ListPagingData.fromListResponse({
    required ApiListResponse<T> listResponse,
    required int currentPage,
    required int limit,
  }) {
    final totalPage = ((listResponse.total ?? 0) / (limit)).ceil();
    final hasNextPage = currentPage < totalPage - 1;
    return ListPagingData<T>(
      message: listResponse.message,
      data: listResponse.data,
      currentPage: currentPage,
      totalPage: totalPage,
      total: listResponse.total ?? 0,
      hasNext: hasNextPage,
      hasPrev: currentPage > 0,
    );
  }
}
