part of 'current_reservation_bloc.dart';

sealed class CurrentReservationState extends Equatable {
  const CurrentReservationState();
}

final class CurrentReservationLoading extends CurrentReservationState {
  @override
  List<Object> get props => [];
}

final class CurrentReservationEmpty extends CurrentReservationState {
  @override
  List<Object> get props => [];
}

final class CurrentReservationAvailable extends CurrentReservationState {
  @override
  List<Object> get props => [];
}

final class CurrentReservationError extends CurrentReservationState {
  final String error;

  const CurrentReservationError({required this.error});
  @override
  List<Object> get props => [error];
}

