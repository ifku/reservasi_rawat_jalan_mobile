import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/const/api_constants.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/clinic_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/api_response.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/clinic_model.dart';
import 'package:reservasi_rawat_jalan_mobile/locator.dart';

class ClinicRemoteDatasource extends ClinicDataSource {
  final AppHttpClient client = locator<AppHttpClient>();

  @override
  Future<Either<Exception, List<ClinicModel>>> getAllClinic() async {
    final response = await client.get(
      ApiConstants.CLINIC,
    );

    return response.fold((error) => Left(error), (data) {
      final responseObject =
          ApiListResponse<ClinicModel>.fromJson(data, ClinicModel.fromJson);
      return Right(responseObject.data ?? []);
    });
  }
}
