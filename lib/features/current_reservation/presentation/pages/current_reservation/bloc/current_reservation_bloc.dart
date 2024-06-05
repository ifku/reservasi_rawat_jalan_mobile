import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/use_cases/user/get_user_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/domain/entities/reservation_detail_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/domain/use_cases/get_current_reservation_usecase.dart';

part 'current_reservation_event.dart';

part 'current_reservation_state.dart';

class CurrentReservationBloc
    extends Bloc<CurrentReservationEvent, CurrentReservationState> {
  final GetCurrentReservationUseCase _getCurrentReservationUseCase =
      locator<GetCurrentReservationUseCase>();
  final GetUserUseCase _getUserUseCase = locator<GetUserUseCase>();

  CurrentReservationBloc() : super(CurrentReservationLoading()) {
    on<GetCurrentReservation>((event, emit) async {
      emit(CurrentReservationLoading());
      try {
        final user = await _getUserUseCase.call(null);
        final userId = user.fold((l) => null, (r) => r.idUser);
        final currentReservation =
            await _getCurrentReservationUseCase.call(userId!);
        currentReservation.fold(
          (error) => emit(CurrentReservationError(error: error.toString())),
          (data) {
            if (data.isEmpty) {
              emit(CurrentReservationEmpty());
            } else {
              emit(CurrentReservationAvailable(
                data: data,
              ));
            }
          },
        );
      } catch (e) {
        emit(CurrentReservationError(error: e.toString()));
      }
    });
  }
}
