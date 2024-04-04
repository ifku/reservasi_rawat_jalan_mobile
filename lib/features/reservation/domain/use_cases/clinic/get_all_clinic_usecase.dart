import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/models/clinic_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/repositories/clinic_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';

class GetAllClinicUseCase implements UseCase<List<ClinicModel>, void> {
  final ClinicRepository clinicRepository = locator<ClinicRepository>();

  @override
  Future<Either<Exception, List<ClinicModel>>> call(void params) async {
    return await clinicRepository.getAllClinic();
  }
}
