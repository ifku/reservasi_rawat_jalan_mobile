part of 'reservation_detail_bloc.dart';

sealed class ReservationDetailEvent extends Equatable {
  const ReservationDetailEvent();

  @override
  List<Object?> get props => [];
}

final class ListenToQueueNumber extends ReservationDetailEvent {
  final String doctorId;

  const ListenToQueueNumber(this.doctorId);

  @override
  List<Object?> get props => [doctorId];
}
