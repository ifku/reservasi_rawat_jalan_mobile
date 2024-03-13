import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/doctor_model.dart';

abstract class DoctorDatasource {
  Future<Either<Exception, List<DoctorModel>>> getDoctorById(String id);
}