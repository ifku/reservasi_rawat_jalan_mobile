import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/clinic_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/clinic_model.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/repository/clinic_repository.dart';

class ClinicRepositoryImpl extends ClinicRepository {
  final ClinicDataSource _clinicDataSource = locator<ClinicDataSource>();

  @override
  Future<Either<Exception, List<ClinicModel>>> getAllClinic() async {
    return await _clinicDataSource.getAllClinic();
  }
}
