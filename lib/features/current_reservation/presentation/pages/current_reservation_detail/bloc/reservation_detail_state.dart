part of 'reservation_detail_bloc.dart';

sealed class ReservationDetailState extends Equatable {
  const ReservationDetailState();

  @override
  List<Object?> get props => [];
}

final class ReservationDetailInitial extends ReservationDetailState {}

final class QueueNumberUpdated extends ReservationDetailState {
  final int queueNumber;

  const QueueNumberUpdated(this.queueNumber);

  @override
  List<Object?> get props => [queueNumber];
}

final class ReservationDetailError extends ReservationDetailState {
  final String message;

  const ReservationDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
