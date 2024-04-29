import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/const/api_constants.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/data_sources/doctor_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/core/model/api_response.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/models/doctor_model.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';

class DoctorRemoteDataSource implements DoctorDatasource {
  final AppHttpClient client = locator<AppHttpClient>();

  @override
  Future<Either<Exception, List<DoctorModel>>> getDoctorByClinicId(String id) async {
    final response = await client.get(
      "${ApiConstants.doctorByClinicId}$id",
    );

    return response.fold((error) => Left(error), (data) {
      final responseObject =
          ApiListResponse<DoctorModel>.fromJson(data, DoctorModel.fromJson);
      return Right(responseObject.data ?? []);
    });
  }
}
