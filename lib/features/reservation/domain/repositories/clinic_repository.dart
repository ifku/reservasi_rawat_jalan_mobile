
import 'package:dartz/dartz.dart';

import '../../data/models/clinic_model.dart';

abstract class ClinicRepository {
  Future<Either<Exception, List<ClinicModel>>> getAllClinic();
}
