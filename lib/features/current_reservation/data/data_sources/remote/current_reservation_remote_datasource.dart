import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/const/api_constants.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/core/model/api_response.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/app_exception.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/data/data_sources/current_reservation_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/data/models/reservation_detail_model.dart';

class CurrentReservationRemoteDataSource
    implements CurrentReservationDataSource {
  final AppHttpClient client = locator<AppHttpClient>();

  @override
  Future<Either<Exception, List<ReservationDetailModel>>> getCurrentReservation(
      String userId) async {
    final response =
        await client.get(ApiConstants.reservationByUserId + userId);
    return response.fold((error) => Left(AppException(error.toString())),
        (data) {
      final responseObject = ApiListResponse<ReservationDetailModel>.fromJson(
          data, ReservationDetailModel.fromJson);
      return Right(responseObject.data ?? []);
    });
  }
}
