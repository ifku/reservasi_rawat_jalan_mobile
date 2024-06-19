import 'package:dartz/dartz.dart';
import '../models/clinic_model.dart';

abstract class ClinicDataSource {
  Future<Either<Exception, List<ClinicModel>>> getAllClinic();
}
