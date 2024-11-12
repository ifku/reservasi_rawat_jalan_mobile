import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/doctor_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/use_cases/choose_doctor/get_doctor_by_clinic_id_usecase.dart';

part 'choose_doctor_event.dart';
part 'choose_doctor_state.dart';

class ChooseDoctorBloc extends Bloc<ChooseDoctorEvent, ChooseDoctorState> {
  final GetDoctorByClinicIdUseCase _getDoctorByClinicIdUseCase;

  ChooseDoctorBloc(this._getDoctorByClinicIdUseCase)
      : super(GetDoctorByClinicIdLoading()) {
    on<GetDoctorByClinicId>((event, emit) async {
      emit(GetDoctorByClinicIdLoading());
      try {
        final result = await _getDoctorByClinicIdUseCase.call(event.clinicId);
        result.fold(
            (e) => emit(GetDoctorByClinicIdFailed(message: e.toString())),
            (data) => emit(GetDoctorByClinicIdSuccess(
                  doctor: data,
                )));
        log('GetDoctorByClinicIdSuccess: ${result.toString()}');
      } catch (e) {
        emit(GetDoctorByClinicIdFailed(message: e.toString()));
      }
    });
  }
}
