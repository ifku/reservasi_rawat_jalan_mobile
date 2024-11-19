part of 'choose_doctor_bloc.dart';

abstract class ChooseDoctorEvent extends Equatable {
  const ChooseDoctorEvent();
}

class GetDoctorByClinicId extends ChooseDoctorEvent {
  final String clinicId;
  final DateTime date;

  const GetDoctorByClinicId({required this.clinicId, required this.date});

  @override
  List<Object> get props => [clinicId, date];
}
