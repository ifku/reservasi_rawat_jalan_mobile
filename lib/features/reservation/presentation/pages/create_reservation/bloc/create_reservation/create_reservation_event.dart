part of 'create_reservation_bloc.dart';

sealed class CreateReservationEvent extends Equatable {
  const CreateReservationEvent();
}

class FetchPatientData extends CreateReservationEvent {
  const FetchPatientData();

  @override
  List<Object> get props => [];
}

class CreateReservation extends CreateReservationEvent {
  final String reservationInsuranceType;
  final DateTime reservationDate;
  final String patientId;
  final String doctorId;

  const CreateReservation({
    required this.reservationInsuranceType,
    required this.reservationDate,
    required this.patientId,
    required this.doctorId,
  });

  @override
  List<Object> get props => [
        reservationInsuranceType,
        reservationDate,
        patientId,
        doctorId
      ];
}
