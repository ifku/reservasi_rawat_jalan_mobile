part of 'current_reservation_bloc.dart';

sealed class CurrentReservationState extends Equatable {
  const CurrentReservationState();
}

final class CurrentReservationInitial extends CurrentReservationState {
  @override
  List<Object> get props => [];
}
