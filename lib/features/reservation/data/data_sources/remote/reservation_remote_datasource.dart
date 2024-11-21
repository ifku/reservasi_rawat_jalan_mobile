import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/const/api_constants.dart';
import 'package:reservasi_rawat_jalan_mobile/core/model/api_response.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/app_exception.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/data_sources/reservation_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/models/reservation_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/dto/reservation_dto.dart';

class ReservationRemoteDataSource implements ReservationDataSource {
  final AppHttpClient client;

  ReservationRemoteDataSource(this.client);

  @override
  Future<Either<Exception, ReservationModel>> createReservation(
      {required ReservationDto payload}) async {
    final response = await client.post(ApiConstants.reservation, data: {
      'reservation_insurance_type': payload.reservationInsuranceType,
      'reservation_date': payload.reservationDate.toIso8601String(),
      'patient_id': payload.patientId,
      'doctor_id': payload.doctorId,
      'user_id': payload.userId
    });

    return response.fold((error) => Left(AppException(error.toString())),
        (data) {
      final responseObject = ApiResponse<ReservationModel>.fromJson(
          data, ReservationModel.fromJson);
      return Right(responseObject.data!);
    });
  }
}
