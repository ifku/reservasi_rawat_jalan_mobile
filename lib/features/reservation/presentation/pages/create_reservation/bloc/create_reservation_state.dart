part of 'create_reservation_bloc.dart';

sealed class CreateReservationState extends Equatable {
  const CreateReservationState();
}

final class CreateReservationInitial extends CreateReservationState {
  @override
  List<Object> get props => [];
}

final class SelectedDate extends CreateReservationState {
  final DateTime selectedDate;

  const SelectedDate(this.selectedDate);

  @override
  List<Object> get props => [selectedDate];
}

final class AddAsPatient extends CreateReservationState {
  final bool isAddAsPatient;

  const AddAsPatient(this.isAddAsPatient);

  @override
  List<Object> get props => [isAddAsPatient];
}
