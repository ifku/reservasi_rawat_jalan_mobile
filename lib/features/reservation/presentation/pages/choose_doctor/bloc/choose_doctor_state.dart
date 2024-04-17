part of 'choose_doctor_bloc.dart';

abstract class ChooseDoctorState extends Equatable {
  const ChooseDoctorState();
}

class ChooseDoctorInitial extends ChooseDoctorState {
  @override
  List<Object> get props => [];
}

class GetDoctorByClinicIdLoading extends ChooseDoctorState {
  @override
  List<Object> get props => [];
}

class GetDoctorByClinicIdSuccess extends ChooseDoctorState {
  final List<DoctorEntity> doctor;

  const GetDoctorByClinicIdSuccess({required this.doctor});

  @override
  List<Object> get props => [doctor];
}

class GetDoctorByClinicIdFailed extends ChooseDoctorState {
  final String message;

  const GetDoctorByClinicIdFailed({required this.message});

  @override
  List<Object> get props => [message];
}
