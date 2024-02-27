import 'package:either_dart/either.dart';

import '../model/clinic_model.dart';

abstract class ClinicDataSource {
  Future<Either<Exception, List<Clinic>>> getAllClinic();
}
