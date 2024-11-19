import 'package:equatable/equatable.dart';

class DoctorEntity extends Equatable {
  final String idDoctor;
  final String doctorName;
  final String doctorSip;
  final String doctorStr;
  final int doctorAge;
  final String doctorRating;
  final String? doctorImage;
  final String clinicId;
  final String clinicName;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const DoctorEntity({
    required this.idDoctor,
    required this.doctorName,
    required this.doctorSip,
    required this.doctorStr,
    required this.doctorAge,
    required this.doctorRating,
    required this.doctorImage,
    required this.clinicId,
    required this.clinicName,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [];
}
