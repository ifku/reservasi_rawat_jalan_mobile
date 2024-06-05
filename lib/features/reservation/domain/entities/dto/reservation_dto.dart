import 'package:equatable/equatable.dart';

class ReservationDto extends Equatable {
  final String reservationInsuranceType;
  final DateTime reservationDate;
  final String patientId;
  final String doctorId;
  final String userId;

  const ReservationDto(
      {required this.reservationInsuranceType,
      required this.reservationDate,
      required this.patientId,
      required this.doctorId,
      required this.userId});

  @override
  List<Object> get props =>
      [reservationInsuranceType, reservationDate, patientId, doctorId, userId];
}
