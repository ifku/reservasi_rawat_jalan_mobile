part of 'choose_doctor_bloc.dart';

abstract class ChooseDoctorEvent extends Equatable {
  const ChooseDoctorEvent();
}

class GetDoctorByClinicId extends ChooseDoctorEvent {
  final String clinicId;

  const GetDoctorByClinicId({required this.clinicId});

  @override
  List<Object> get props => [clinicId];
}
