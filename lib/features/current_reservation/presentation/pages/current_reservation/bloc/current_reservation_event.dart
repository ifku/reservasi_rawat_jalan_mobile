part of 'current_reservation_bloc.dart';

sealed class CurrentReservationEvent extends Equatable {
  const CurrentReservationEvent();
}

final class GetCurrentReservation extends CurrentReservationEvent {

  final String patientId;

  const GetCurrentReservation({required this.patientId});
  @override
  List<Object> get props => [
    patientId
  ];
}
