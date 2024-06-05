import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_reservation_action_state.dart';

class CreateReservationActionCubit extends Cubit<CreateReservationActionState> {
  CreateReservationActionCubit() : super(CreateReservationActionInitial());

  void selectedDateChanged(DateTime selectedDate) {
    emit(SelectedDate(selectedDate));
  }

  void addAsPatientChanged(bool isAddAsPatient) {
    emit(AddAsPatient(isAddAsPatient));
  }
}
