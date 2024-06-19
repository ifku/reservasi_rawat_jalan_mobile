import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/entities/patient_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/use_cases/patient/get_patient_by_userid_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/use_cases/user/get_user_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/dto/reservation_dto.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/use_cases/reservation/create_reservation.dart';

part 'create_reservation_event.dart';

part 'create_reservation_state.dart';

class CreateReservationBloc
    extends Bloc<CreateReservationEvent, CreateReservationState> {
  final GetPatientByUserIdUseCase _getPatientByUserIdUseCase =
      locator<GetPatientByUserIdUseCase>();
  final GetUserUseCase _getUserUseCase = locator<GetUserUseCase>();

  final CreateReservationUseCase _createReservationUseCase =
      locator<CreateReservationUseCase>();

  CreateReservationBloc() : super(CreateReservationInitial()) {
    on<CreateReservation>((event, emit) async {
      emit(const CreateReservationLoading());
      final userId = await getPatientId();
      final data = ReservationDto(
        reservationInsuranceType: event.reservationInsuranceType,
        reservationDate: event.reservationDate,
        patientId: event.patientId,
        doctorId: event.doctorId,
        userId: userId,
      );
      await _createReservationUseCase.call(data).then((value) {
        value.fold(
          (l) => emit(CreateReservationFailure(error: l.toString())),
          (r) => emit(const CreateReservationSuccess()),
        );
      });
    });

    on<FetchPatientData>((event, emit) async {
      emit(const FetchPatientDataLoading());
      final userId = await getPatientId();
      final patientData = await _getPatientByUserIdUseCase.call(userId);
      patientData.fold(
        (l) => emit(FetchPatientDataError(l.toString())),
        (r) => emit(FetchPatientDataSuccess(r)),
      );
    });
  }

  Future<String> getPatientId() async {
    final user = await _getUserUseCase.call(null);
    final userId = user.fold((l) => null, (r) => r.idUser);
    return userId!;
  }
}
