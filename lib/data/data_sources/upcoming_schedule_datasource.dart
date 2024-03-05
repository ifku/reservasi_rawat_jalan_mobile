import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/upcoming_schedule_model.dart';

abstract class UpcomingScheduleDatasource {
  Future<Either<Exception, List<UpcomingScheduleModel>>> getUpcomingSchedule();
}
