import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/models/clinic_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/use_cases/clinic/get_all_clinic_usecase.dart';

part 'clinic_event.dart';
part 'clinic_state.dart';

class ClinicBloc extends Bloc<ClinicEvent, ClinicState> {
  final GetAllClinicUseCase getAllClinicUseCase =
      locator<GetAllClinicUseCase>();

  ClinicBloc() : super(GetClinicLoading()) {
    on<GetAllClinic>((event, emit) async {
      emit(GetClinicLoading());
      try {
        final result = await getAllClinicUseCase.call(null);
        result.fold(
          (l) => emit(GetClinicFailure(message: l.toString())),
          (r) => emit(GetClinicSuccess(clinics: r)),
        );
      } catch (e) {
        log(e.toString());
        emit(GetClinicFailure(message: e.toString()));
      }
    });
  }
}
