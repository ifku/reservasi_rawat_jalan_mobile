class UpcomingScheduleModel {
  final String doctorName;
  final DateTime doctorSchedule;
  final String? doctorImage;

  UpcomingScheduleModel({
    required this.doctorName,
    required this.doctorSchedule,
    required this.doctorImage,
  });

  factory UpcomingScheduleModel.fromJson(Map<String, dynamic> json) {
    return UpcomingScheduleModel(
      doctorName: json['doctorName'],
      doctorSchedule: json['doctorSchedule'],
      doctorImage: json['doctorImage'],
    );
  }
}
