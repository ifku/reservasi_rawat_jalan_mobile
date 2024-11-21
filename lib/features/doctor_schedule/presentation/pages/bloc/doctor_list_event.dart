part of 'doctor_list_bloc.dart';

sealed class DoctorListEvent extends Equatable {
  const DoctorListEvent();
}

class GetAllDoctorEvent extends DoctorListEvent {
  const GetAllDoctorEvent();

  @override
  List<Object> get props => [];
}

class GetNextDoctorEvent extends DoctorListEvent {
  const GetNextDoctorEvent();

  @override
  List<Object> get props => [];
}

class ResetDoctorListEvent extends DoctorListEvent {
  const ResetDoctorListEvent();

  @override
  List<Object> get props => [];
}