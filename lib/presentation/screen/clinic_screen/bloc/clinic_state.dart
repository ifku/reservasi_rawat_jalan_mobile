part of 'clinic_bloc.dart';

abstract class ClinicState extends Equatable {
  const ClinicState();
}

class GetClinicLoading extends ClinicState {
  @override
  List<Object?> get props => [];
}

class GetClinicSuccess extends ClinicState {
  final List<ClinicModel> clinics;

  const GetClinicSuccess({required this.clinics});

  @override
  List<Object> get props => [clinics];
}

class GetClinicFailure extends ClinicState {
  final String message;

  const GetClinicFailure({required this.message});

  @override
  List<Object> get props => [message];
}
