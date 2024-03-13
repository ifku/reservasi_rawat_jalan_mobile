import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/doctor_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/doctor_model.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/repository/doctor_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/locator.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final DoctorDatasource doctorDatasource = locator<DoctorDatasource>();

  @override
  Future<Either<Exception, List<DoctorModel>>> getDoctorById(String id) async {
    return await doctorDatasource.getDoctorById(id);
  }
}
