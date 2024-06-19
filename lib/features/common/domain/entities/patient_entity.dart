import 'package:equatable/equatable.dart';

class PatientEntity extends Equatable {
  final String idPatient;
  final String patientFullname;
  final String patientNik;
  final DateTime patientDateOfBirth;
  final String patientPhone;
  final String patientStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  const PatientEntity({
    required this.idPatient,
    required this.patientFullname,
    required this.patientNik,
    required this.patientDateOfBirth,
    required this.patientPhone,
    required this.patientStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [
        idPatient,
        patientFullname,
        patientNik,
        patientDateOfBirth,
        patientPhone,
        patientStatus,
        createdAt,
        updatedAt,
      ];
}
