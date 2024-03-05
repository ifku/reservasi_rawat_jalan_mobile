
import 'package:dartz/dartz.dart';

import '../../data/model/clinic_model.dart';

abstract class ClinicRepository {
  Future<Either<Exception, List<ClinicModel>>> getAllClinic();
}
