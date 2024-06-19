import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/models/upcoming_schedule_model.dart';

abstract class UpcomingScheduleRepository {
  Future<Either<Exception, List<UpcomingScheduleModel>>> getUpcomingSchedule();
}