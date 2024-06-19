import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/data_sources/upcoming_schedule_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/models/upcoming_schedule_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/domain/repositories/upcoming_schedule_repository.dart';

class UpcomingScheduleRepositoryImpl implements UpcomingScheduleRepository {
  final UpcomingScheduleDatasource _upcomingScheduleDatasource =
      locator<UpcomingScheduleDatasource>();

  @override
  Future<Either<Exception, List<UpcomingScheduleModel>>>
      getUpcomingSchedule() async {
    return await _upcomingScheduleDatasource.getUpcomingSchedule();
  }
}
