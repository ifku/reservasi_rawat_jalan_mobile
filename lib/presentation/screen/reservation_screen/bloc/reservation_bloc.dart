import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationInitial()) {
    on<ReservationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
