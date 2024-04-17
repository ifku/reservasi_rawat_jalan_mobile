
import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/clinic_entity.dart';

abstract class ClinicRepository {
  Future<Either<Exception, List<ClinicEntity>>> getAllClinic();
}
