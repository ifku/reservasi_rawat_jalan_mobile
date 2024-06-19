import 'package:reservasi_rawat_jalan_mobile/features/home/domain/entities/upcoming_schedule_entity.dart';

class UpcomingScheduleModel extends UpcomingScheduleEntity {
  const UpcomingScheduleModel({
    required super.doctorName,
    required super.doctorSchedule,
    required super.doctorImage,
  });

  factory UpcomingScheduleModel.fromJson(Map<String, dynamic> json) {
    return UpcomingScheduleModel(
      doctorName: json['doctorName'],
      doctorSchedule: json['doctorSchedule'],
      doctorImage: json['doctorImage'],
    );
  }
}
