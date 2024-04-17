import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'current_reservation_event.dart';

part 'current_reservation_state.dart';

class CurrentReservationBloc
    extends Bloc<CurrentReservationEvent, CurrentReservationState> {
  CurrentReservationBloc() : super(CurrentReservationLoading()) {
    on<GetCurrentReservation>((event, emit) {
      emit(CurrentReservationLoading());
      try {} catch (e) {
        emit(CurrentReservationError(error: e.toString()));
      }
    });
  }
}
