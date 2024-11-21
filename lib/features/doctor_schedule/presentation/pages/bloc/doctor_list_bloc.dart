import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/entities/doctor_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/doctor_schedule/domain/usecase/get_all_doctor_usecase.dart';

part 'doctor_list_event.dart';

part 'doctor_list_state.dart';

class DoctorListBloc extends Bloc<DoctorListEvent, DoctorListState> {
  final GetAllDoctorUseCase _getAllDoctorUseCase;

  int _currentPage = 1;
  bool _isFetchingMore = false;

  DoctorListBloc(this._getAllDoctorUseCase) : super(DoctorListInitial()) {
    on<ResetDoctorListEvent>((event, emit) {
      _currentPage = 1;
      _isFetchingMore = false;
      emit(DoctorListInitial());
    });

    on<GetAllDoctorEvent>((event, emit) async {
      emit(DoctorListLoading());
      final response = await _getAllDoctorUseCase.call(_currentPage);
      response.fold(
        (l) => emit(DoctorListFailure(l.toString())),
        (r) => emit(DoctorListSuccess(r, false)),
      );
    });

    on<GetNextDoctorEvent>((event, emit) async {
      if (_isFetchingMore || state is! DoctorListSuccess) return;

      _isFetchingMore = true;

      final currentState = state as DoctorListSuccess;
      emit(currentState.copyWith(isFetchingMore: true)); // Show loading

      final response = await _getAllDoctorUseCase.call(_currentPage + 1);

      response.fold(
        (l) {
          _isFetchingMore = false;
          emit(currentState.copyWith(isFetchingMore: false));
        },
        (r) {
          if (r.isNotEmpty) {
            _currentPage++;
            emit(currentState.copyWith(
              doctorList: currentState.doctorList + r,
              isFetchingMore: false,
            ));
          } else {
            _isFetchingMore = false;
          }
        },
      );
    });
  }
}
