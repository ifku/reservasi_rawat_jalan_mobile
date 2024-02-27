import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservasi_rawat_jalan_mobile/locator.dart';

import '../../../../data/model/clinic_model.dart';
import '../../../../domain/repository/clinic_repository.dart';

part 'clinic_event.dart';
part 'clinic_state.dart';

class ClinicBloc extends Bloc<ClinicEvent, ClinicState> {
    final ClinicRepository clinicRepository = locator<ClinicRepository>();
  ClinicBloc() : super(GetClinicLoading()) {
    on<GetAllClinic>((event, emit) async {
      emit(GetClinicLoading());
      try {
        final result = await clinicRepository.getAllClinic();
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
