import 'package:either_dart/either.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/clinic_model.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/repository/clinic_repository.dart';
import '../data_sources/clinic_datasource.dart';

class ClinicRepositoryImpl extends ClinicRepository {
  final ClinicDataSource _clinicDataSource;
  ClinicRepositoryImpl(this._clinicDataSource);

  @override
  Future<Either<Exception, List<Clinic>>> getAllClinic() {
    return _clinicDataSource.getAllClinic();
  }
}
