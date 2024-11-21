import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/const/api_constants.dart';
import 'package:reservasi_rawat_jalan_mobile/core/model/api_response.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/features/doctor_schedule/data/data_sources/doctor_list_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/models/doctor_model.dart';

class DoctorListRemoteDataSource implements DoctorListDataSource {
  final AppHttpClient _client;

  DoctorListRemoteDataSource(this._client);

  @override
  Future<Either<Exception, List<DoctorModel>>> getAllDoctor({int page = 1}) async {
    try {
      final response = await _client.get(
        '${ApiConstants.doctor}?page=$page',
      );

      return response.fold((error) => Left(Exception(error.toString())),
          (data) {
        final responseObject =
            ListPagingData<DoctorModel>.fromJson(data, DoctorModel.fromJson);
        return Right(responseObject.data ?? []);
      });
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
