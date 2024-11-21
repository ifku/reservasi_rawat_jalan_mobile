import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/domain/use_cases/get_current_queue_number_usecase.dart';

part 'reservation_detail_event.dart';
part 'reservation_detail_state.dart';

class ReservationDetailBloc
    extends Bloc<ReservationDetailEvent, ReservationDetailState> {
  final GetCurrentQueueNumberUseCase _getCurrentQueueNumberUseCase;

  ReservationDetailBloc(this._getCurrentQueueNumberUseCase)
      : super(ReservationDetailInitial()) {
    on<ListenToQueueNumber>((event, emit) async {
      // Start streaming queue numbers using emit.forEach
      await emit.forEach<int>(
        _getCurrentQueueNumberUseCase(event.doctorId),
        onData: (queueNumber) => QueueNumberUpdated(queueNumber),
        onError: (error, stackTrace) =>
            ReservationDetailError(error.toString()),
      );
    });
  }
}