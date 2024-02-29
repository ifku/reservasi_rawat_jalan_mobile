// To parse this JSON data, do
//
//     final clinicModel = clinicModelFromJson(jsonString);



class Clinic {
  final String idClinic;
  final String clinicName;
  final DateTime createdAt;
  final DateTime updatedAt;

  Clinic({
    required this.idClinic,
    required this.clinicName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
        idClinic: json["id_clinic"],
        clinicName: json["clinic_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_clinic": idClinic,
        "clinic_name": clinicName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}