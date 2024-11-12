import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/const/api_constants.dart';
import 'package:reservasi_rawat_jalan_mobile/core/model/api_response.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/app_exception.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/data_sources/doctor_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/models/doctor_model.dart';

class DoctorRemoteDataSource implements DoctorDatasource {
  final AppHttpClient _client;
  DoctorRemoteDataSource(this._client);
  @override
  Future<Either<Exception, List<DoctorModel>>> getDoctorByClinicId(String id) async {
    final response = await _client.get(
      "${ApiConstants.doctorByClinicId}$id",
    );

    return response.fold((error) => Left(AppException(error.toString())), (data) {
      final responseObject =
          ApiListResponse<DoctorModel>.fromJson(data, DoctorModel.fromJson);
      return Right(responseObject.data ?? []);
    });
  }
}
