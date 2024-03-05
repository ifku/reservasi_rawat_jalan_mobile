import 'package:dartz/dartz.dart';
import '../model/clinic_model.dart';

abstract class ClinicDataSource {
  Future<Either<Exception, List<ClinicModel>>> getAllClinic();
}
