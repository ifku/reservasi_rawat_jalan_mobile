part of 'create_reservation_bloc.dart';

sealed class CreateReservationEvent extends Equatable {
  const CreateReservationEvent();
}

class SelectedDateChanged extends CreateReservationEvent {
  final DateTime selectedDate;

  const SelectedDateChanged(this.selectedDate);

  @override
  List<Object> get props => [selectedDate];
}

class AddAsPatientChanged extends CreateReservationEvent {
  final bool isAddAsPatient;

  const AddAsPatientChanged(this.isAddAsPatient);

  @override
  List<Object> get props => [isAddAsPatient];
}