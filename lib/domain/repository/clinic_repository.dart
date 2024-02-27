import 'package:either_dart/either.dart';

import '../../data/model/clinic_model.dart';

abstract class ClinicRepository {
  Future<Either<Exception, List<Clinic>>> getAllClinic();
}
