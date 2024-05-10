import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_reservation_event.dart';

part 'create_reservation_state.dart';

class CreateReservationBloc
    extends Bloc<CreateReservationEvent, CreateReservationState> {
  CreateReservationBloc() : super(CreateReservationInitial()) {
    on<CreateReservationEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SelectedDateChanged>((event, emit) {
      emit(SelectedDate(event.selectedDate));
    });

    on<AddAsPatientChanged>((event, emit) {
      emit(AddAsPatient(event.isAddAsPatient));
    });
  }
}
