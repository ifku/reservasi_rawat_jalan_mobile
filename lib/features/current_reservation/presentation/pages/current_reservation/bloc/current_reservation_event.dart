part of 'current_reservation_bloc.dart';

sealed class CurrentReservationEvent extends Equatable {
  const CurrentReservationEvent();
}

final class GetCurrentReservation extends CurrentReservationEvent {
  @override
  List<Object> get props => [];
}
