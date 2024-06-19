import 'package:equatable/equatable.dart';

enum InsuranceType { personal, bpjs, insurance }

enum ReservationStatus { pending, accepted, rejected }

class ReservationEntity extends Equatable {
  final String idReservation;
  final String reservationInsuranceType;
  final String reservationDate;
  final String patientId;
  final String doctorId;
  final String userId;
  final String updatedAt;
  final String createdAt;

  const ReservationEntity({
    required this.idReservation,
    required this.reservationInsuranceType,
    required this.reservationDate,
    required this.patientId,
    required this.doctorId,
    required this.userId,
    required this.updatedAt,
    required this.createdAt,
  });

  @override
  List<Object> get props => [
        idReservation,
        reservationInsuranceType,
        reservationDate,
        patientId,
        doctorId,
        userId,
        updatedAt,
        createdAt,
      ];
}
