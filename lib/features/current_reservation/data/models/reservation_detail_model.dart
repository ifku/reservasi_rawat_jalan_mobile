// To parse this JSON data, do
//
//     final reservationDetailModel = reservationDetailModelFromJson(jsonString);

import 'dart:convert';

ReservationDetailModel reservationDetailModelFromJson(String str) => ReservationDetailModel.fromJson(json.decode(str));

String reservationDetailModelToJson(ReservationDetailModel data) => json.encode(data.toJson());

class ReservationDetailModel {
  final String idReservation;
  final String reservationStatus;
  final String reservationInsuranceType;
  final DateTime reservationDate;
  final String patientName;
  final String doctorName;
  final String clinicName;
  final DateTime createdAt;
  final DateTime updatedAt;

  ReservationDetailModel({
    required this.idReservation,
    required this.reservationStatus,
    required this.reservationInsuranceType,
    required this.reservationDate,
    required this.patientName,
    required this.doctorName,
    required this.clinicName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ReservationDetailModel.fromJson(Map<String, dynamic> json) => ReservationDetailModel(
    idReservation: json["id_reservation"] ?? "",
    reservationStatus: json["reservation_status"] ?? "",
    reservationInsuranceType: json["reservation_insurance_type"] ?? "",
    reservationDate: DateTime.parse(json["reservation_date"]) ?? DateTime.now(),
    patientName: json["patient_name"] ?? "",
    doctorName: json["doctor_name"] ?? "",
    clinicName: json["clinic_name"] ?? "",
    createdAt: DateTime.parse(json["created_at"]) ?? DateTime.now(),
    updatedAt: DateTime.parse(json["updated_at"]) ?? DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "id_reservation": idReservation,
    "reservation_status": reservationStatus,
    "reservation_insurance_type": reservationInsuranceType,
    "reservation_date": reservationDate.toIso8601String(),
    "patient_name": patientName,
    "doctor_name": doctorName,
    "clinic_name": clinicName,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
