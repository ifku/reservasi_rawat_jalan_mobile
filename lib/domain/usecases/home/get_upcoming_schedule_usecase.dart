import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/upcoming_schedule_model.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/repository/upcoming_schedule_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/usecases/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/locator.dart';

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
