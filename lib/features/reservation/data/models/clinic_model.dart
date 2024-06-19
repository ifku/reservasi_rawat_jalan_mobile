// To parse this JSON data, do
//
//     final clinicModel = clinicModelFromJson(jsonString);

import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/clinic_entity.dart';

class ClinicModel extends ClinicEntity {
  const ClinicModel({
    required super.idClinic,
    required super.clinicName,
    required super.clinicIcon,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ClinicModel.fromJson(Map<String, dynamic> json) => ClinicModel(
        idClinic: json["id_clinic"],
        clinicName: json["clinic_name"],
        clinicIcon: json["clinic_icon"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_clinic": idClinic,
        "clinic_name": clinicName,
        "clinic_icon": clinicIcon,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
