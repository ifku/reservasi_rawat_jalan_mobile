import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/models/upcoming_schedule_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/domain/repositories/upcoming_schedule_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';

class GetUpcomingScheduleUseCase
    implements UseCase<List<UpcomingScheduleModel>, void> {
  final UpcomingScheduleRepository _upcomingScheduleRepository =
      locator<UpcomingScheduleRepository>();

  @override
  Future<Either<Exception, List<UpcomingScheduleModel>>> call(
      void params) async {
    return await _upcomingScheduleRepository.getUpcomingSchedule();
  }
}
