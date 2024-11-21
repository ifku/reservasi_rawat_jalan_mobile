import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'current_reservation_event.dart';
part 'current_reservation_state.dart';

class CurrentReservationBloc extends Bloc<CurrentReservationEvent, CurrentReservationState> {
  CurrentReservationBloc() : super(CurrentReservationInitial()) {
    on<CurrentReservationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
