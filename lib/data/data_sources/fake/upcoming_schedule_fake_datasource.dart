import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/upcoming_schedule_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/upcoming_schedule_model.dart';

class UpcomingScheduleFakeDataSource extends UpcomingScheduleDatasource {
  @override
  Future<Either<Exception, List<UpcomingScheduleModel>>>
      getUpcomingSchedule() async {
    await Future.delayed(const Duration(seconds: 4));
    return Right([
      UpcomingScheduleModel(
        doctorName: 'dr. Ifku Syoba',
        doctorSchedule: DateTime.parse('2022-12-12'),
        doctorImage: null,
      ),
      UpcomingScheduleModel(
        doctorName: 'dr. Navis Nasrullah',
        doctorSchedule: DateTime.parse('2022-12-12'),
        doctorImage: "https://images.unsplash.com/photo-1537368910025-700350fe46c7?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ),
      UpcomingScheduleModel(
        doctorName: 'dr. Yoga Aditya',
        doctorSchedule: DateTime.parse('2022-12-12'),
        doctorImage: null,
      ),
    ]);
  }
}
