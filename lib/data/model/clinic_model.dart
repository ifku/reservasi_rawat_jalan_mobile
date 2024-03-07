// To parse this JSON data, do
//
//     final clinicModel = clinicModelFromJson(jsonString);

class ClinicModel {
  final String idClinic;
  final String clinicName;
  final String clinicIcon;
  final DateTime createdAt;
  final DateTime updatedAt;

  ClinicModel({
    required this.idClinic,
    required this.clinicName,
    required this.clinicIcon,
    required this.createdAt,
    required this.updatedAt,
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
