import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/const/api_constants.dart';
import 'package:reservasi_rawat_jalan_mobile/core/model/api_response.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/app_exception.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/data/data_sources/current_reservation_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/data/models/reservation_detail_model.dart';

class CurrentReservationRemoteDataSource
    implements CurrentReservationDataSource {
  final AppHttpClient _client;

  CurrentReservationRemoteDataSource(this._client);

  @override
  Future<Either<Exception, List<ReservationDetailModel>>> getCurrentReservation(
      String userId) async {
    final response =
        await _client.get(ApiConstants.reservationByUserId + userId);
    return response.fold((error) => Left(AppException(error.toString())),
        (data) {
      final responseObject = ApiListResponse<ReservationDetailModel>.fromJson(
          data, ReservationDetailModel.fromJson);
      return Right(responseObject.data ?? []);
    });
  }

  @override
  Future<Either<Exception, ReservationDetailModel>> getCurrentReservationById(
      String reservationId) async {
    try {
      final response =
          await _client.get(ApiConstants.reservation + reservationId);
      return response.fold((error) => Left(AppException(error.toString())),
          (data) {
        final responseObject = ApiResponse<ReservationDetailModel>.fromJson(
            data, ReservationDetailModel.fromJson);
        return Right(responseObject.data!);
      });
    } catch (e) {
      return Left(AppException(e.toString()));
    }
  }
}
