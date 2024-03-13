import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:reservasi_rawat_jalan_mobile/core/const/api_constants.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/doctor_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/api_response.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/doctor_model.dart';
import 'package:reservasi_rawat_jalan_mobile/locator.dart';

class DoctorRemoteDataSource implements DoctorDatasource {
  final AppHttpClient client = locator<AppHttpClient>();

  @override
  Future<Either<Exception, List<DoctorModel>>> getDoctorById(String id) async {
    final response = await client.get(
      "${dotenv.env['API_BASE_URL']}${ApiConstants.DOCTOR_BYID}${id.toString()}",
    );

    return response.fold((error) => Left(error), (data) {
      final responseObject =
          ApiListResponse<DoctorModel>.fromJson(data, DoctorModel.fromJson);
      return Right(responseObject.data ?? []);
    });
  }
}
