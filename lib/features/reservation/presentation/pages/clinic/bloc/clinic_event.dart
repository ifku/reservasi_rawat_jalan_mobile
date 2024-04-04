part of 'clinic_bloc.dart';

abstract class ClinicEvent extends Equatable {
  const ClinicEvent();
}

class GetAllClinic extends ClinicEvent {
  @override
  List<Object?> get props => [];
}
