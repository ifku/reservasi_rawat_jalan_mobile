import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/const/api_constants.dart';
import 'package:reservasi_rawat_jalan_mobile/core/model/api_response.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/app_exception.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/data_sources/patient_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/models/patient_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/entities/patient_entity.dart';

class PatientRemoteDataSource implements PatientDataSource {
  final AppHttpClient _client;

  PatientRemoteDataSource(this._client);

  @override
  Future<Either<Exception, List<PatientEntity>>> getPatientByUserId(
      String userId) async {
    final response = await _client.get(
      ApiConstants.patientByUserId + userId,
    );

    return response.fold((error) => Left(AppException(error.toString())),
        (data) {
      final responseObject =
          ApiListResponse<PatientModel>.fromJson(data, PatientModel.fromJson);
      return Right(responseObject.data ?? []);
    });
  }
}
