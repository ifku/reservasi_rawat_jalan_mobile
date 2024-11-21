import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/models/doctor_model.dart';

abstract class DoctorListRepository {
  Future<Either<Exception, List<DoctorModel>>> getAllDoctor({required int page});
}