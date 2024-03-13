import 'dart:convert';

class DoctorModel {
  final String idDoctor;
  final String doctorName;
  final String doctorSip;
  final String doctorStr;
  final int doctorAge;
  final String doctorRating;
  final String doctorImage;
  final String clinicId;

  final String clinicName;
  final DateTime? createdAt;
  final DateTime? updatedAt;


  DoctorModel({
    required this.idDoctor,
    required this.doctorName,
    required this.doctorSip,
    required this.doctorStr,
    required this.doctorAge,
    required this.doctorRating,
    required this.doctorImage,
    required this.clinicId,
    required this.clinicName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DoctorModel.fromRawJson(String str) =>
      DoctorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        idDoctor: json["id_doctor"] ?? "",
        doctorName: json["doctor_name"] ?? "",
        doctorSip: json["doctor_sip"] ?? "",
        doctorStr: json["doctor_str"] ?? "",
        doctorAge: json["doctor_age"] ?? "",
        doctorRating: json["doctor_rating"] ?? "",
        doctorImage: json["doctor_image"] ?? "",
        clinicId: json["clinic_id"] ?? "",
        clinicName: json["clinic_name"] ?? "",
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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
        "clinic_name": clinicName,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
