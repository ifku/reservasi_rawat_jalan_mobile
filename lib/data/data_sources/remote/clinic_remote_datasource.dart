import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:reservasi_rawat_jalan_mobile/core/const/api_constants.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/clinic_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/api_response.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/clinic_model.dart';
import 'package:reservasi_rawat_jalan_mobile/locator.dart';

class ClinicRemoteDatasource extends ClinicDataSource {
  final AppHttpClient client = locator<AppHttpClient>();

  @override
  Future<Either<Exception, List<Clinic>>> getAllClinic() async {
    final response = await client.get(
      "${dotenv.env['API_BASE_URL']}${ApiConstants.CLINIC}",
    );

    return response.fold((error) => Left(error), (data) {
      final responseObject =
          ApiListResponse<Clinic>.fromJson(data, Clinic.fromJson);

      log(responseObject.data.toString());
      return Right(responseObject.data ?? []);
    });
  }
}
