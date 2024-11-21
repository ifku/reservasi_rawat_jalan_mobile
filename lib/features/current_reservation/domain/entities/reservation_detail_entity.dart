import 'package:equatable/equatable.dart';

class ReservationDetailEntity extends Equatable {
  final String idReservation;
  final String reservationStatus;
  final String reservationInsuranceType;
  final DateTime reservationDate;
  final int queueNumber;
  final String patientFullName;
  final String doctorId;
  final String doctorName;
  final String clinicName;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ReservationDetailEntity({
    required this.idReservation,
    required this.reservationStatus,
    required this.reservationInsuranceType,
    required this.reservationDate,
    required this.queueNumber,
    required this.patientFullName,
    required this.doctorId,
    required this.doctorName,
    required this.clinicName,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        idReservation,
        reservationStatus,
        reservationInsuranceType,
        reservationDate,
        queueNumber,
        patientFullName,
        doctorId,
        doctorName,
        clinicName,
        createdAt,
        updatedAt,
  ];
}
