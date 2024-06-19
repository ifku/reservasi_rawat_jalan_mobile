import 'dart:convert';

import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/doctor_entity.dart';

class DoctorModel extends DoctorEntity {
  factory DoctorModel.fromRawJson(String str) =>
      DoctorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  const DoctorModel({
    required super.idDoctor,
    required super.doctorName,
    required super.doctorSip,
    required super.doctorStr,
    required super.doctorAge,
    required super.doctorRating,
    required super.doctorImage,
    required super.clinicId,
    required super.isAvailable,
    required super.clinicName,
    required super.createdAt,
    required super.updatedAt,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        idDoctor: json["id_doctor"],
        doctorName: json["doctor_name"],
        doctorSip: json["doctor_sip"],
        doctorStr: json["doctor_str"],
        doctorAge: json["doctor_age"],
        doctorRating: json["doctor_rating"],
        doctorImage: json["doctor_image"],
        clinicId: json["clinic_id"],
        isAvailable: json["is_available"],
        clinicName: json["clinic_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_doctor": idDoctor,
        "doctor_name": doctorName,
        "doctor_sip": doctorSip,
        "doctor_str": doctorStr,
        "doctor_age": doctorAge,
        "doctor_rating": doctorRating,
        "doctor_image": doctorImage,
        "clinic_id": clinicId,
        "is_available": isAvailable,
        "clinic_name": clinicName,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
