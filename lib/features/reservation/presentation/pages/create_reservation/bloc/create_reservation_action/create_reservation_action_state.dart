part of 'create_reservation_action_cubit.dart';

sealed class CreateReservationActionState extends Equatable {
  const CreateReservationActionState();
}

final class CreateReservationActionInitial extends CreateReservationActionState {
  @override
  List<Object> get props => [];
}

final class SelectedDate extends CreateReservationActionState {
  final DateTime selectedDate;

  const SelectedDate(this.selectedDate);

  @override
  List<Object> get props => [selectedDate];
}

final class AddAsPatient extends CreateReservationActionState {
  final bool isAddAsPatient;

  const AddAsPatient(this.isAddAsPatient);

  @override
  List<Object> get props => [isAddAsPatient];
}