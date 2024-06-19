import 'package:reservasi_rawat_jalan_mobile/features/common/domain/entities/patient_entity.dart';

class PatientModel extends PatientEntity {
  const PatientModel(
      {required super.idPatient,
      required super.patientFullname,
      required super.patientNik,
      required super.patientDateOfBirth,
      required super.patientPhone,
      required super.patientStatus,
      required super.createdAt,
      required super.updatedAt});

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
        idPatient: json["id_patient"],
        patientFullname: json["patient_fullname"],
        patientNik: json["patient_nik"],
        patientDateOfBirth: DateTime.parse(json["patient_date_of_birth"]),
        patientPhone: json["patient_phone"],
        patientStatus: json["patient_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_patient": idPatient,
        "patient_fullname": patientFullname,
        "patient_nik": patientNik,
        "patient_date_of_birth": patientDateOfBirth.toIso8601String(),
        "patient_phone": patientPhone,
        "patient_status": patientStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String()
      };
}
