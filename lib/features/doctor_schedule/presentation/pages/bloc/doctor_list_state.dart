part of 'doctor_list_bloc.dart';

sealed class DoctorListState extends Equatable {
  const DoctorListState();
}

final class DoctorListInitial extends DoctorListState {
  @override
  List<Object> get props => [];
}

final class DoctorListLoading extends DoctorListState {
  @override
  List<Object> get props => [];
}

final class DoctorListSuccess extends DoctorListState {
  final List<DoctorEntity> doctorList;
  final bool isFetchingMore;

  DoctorListSuccess(this.doctorList, this.isFetchingMore);

  DoctorListSuccess copyWith({
    List<DoctorEntity>? doctorList,
    bool? isFetchingMore,
  }) {
    return DoctorListSuccess(
      doctorList ?? this.doctorList,
      isFetchingMore ?? this.isFetchingMore,
    );
  }

  @override
  List<Object> get props => [doctorList, isFetchingMore];
}

final class DoctorListFailure extends DoctorListState {
  final String message;

  DoctorListFailure(this.message);

  @override
  List<Object> get props => [message];
}
