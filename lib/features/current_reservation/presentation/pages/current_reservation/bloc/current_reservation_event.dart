part of 'current_reservation_bloc.dart';

sealed class CurrentReservationEvent extends Equatable {
  const CurrentReservationEvent();
}

final class GetCurrentReservation extends CurrentReservationEvent {
  const GetCurrentReservation();

  @override
  List<Object> get props => [];
}
