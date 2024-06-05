part of 'create_reservation_bloc.dart';

sealed class CreateReservationState extends Equatable {
  const CreateReservationState();
}

final class CreateReservationInitial extends CreateReservationState {
  @override
  List<Object> get props => [];
}

final class FetchPatientDataSuccess extends CreateReservationState {
  final List<PatientEntity> patientData;

  const FetchPatientDataSuccess(this.patientData);

  @override
  List<Object> get props => [patientData];
}

final class FetchPatientDataLoading extends CreateReservationState {
  const FetchPatientDataLoading();

  @override
  List<Object> get props => [];
}

final class FetchPatientDataError extends CreateReservationState {
  final String error;

  const FetchPatientDataError(this.error);

  @override
  List<Object> get props => [error];
}

final class CreateReservationLoading extends CreateReservationState {
  const CreateReservationLoading();

  @override
  List<Object> get props => [];
}

final class CreateReservationSuccess extends CreateReservationState {
  const CreateReservationSuccess();

  @override
  List<Object> get props => [];
}

final class CreateReservationFailure extends CreateReservationState {
  final String error;

  const CreateReservationFailure({required this.error});

  @override
  List<Object> get props => [error];
}
