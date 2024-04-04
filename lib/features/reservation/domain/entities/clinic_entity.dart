import 'package:equatable/equatable.dart';

class ClinicEntity extends Equatable {
  final String idClinic;
  final String clinicName;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ClinicEntity({
    required this.idClinic,
    required this.clinicName,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [idClinic, clinicName, createdAt, updatedAt];
}
