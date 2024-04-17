import 'package:equatable/equatable.dart';

class UpcomingScheduleEntity extends Equatable {
  final String doctorName;
  final DateTime doctorSchedule;
  final String? doctorImage;

  const UpcomingScheduleEntity({
    required this.doctorName,
    required this.doctorSchedule,
    this.doctorImage,
  });

  @override
  List<Object> get props => [doctorName, doctorSchedule];
}
