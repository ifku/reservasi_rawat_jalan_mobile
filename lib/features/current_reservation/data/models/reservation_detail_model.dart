// To parse this JSON data, do
//
//     final reservationDetailModel = reservationDetailModelFromJson(jsonString);

import 'dart:convert';

import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/domain/entities/reservation_detail_entity.dart';

ReservationDetailModel reservationDetailModelFromJson(String str) =>
    ReservationDetailModel.fromJson(json.decode(str));

String reservationDetailModelToJson(ReservationDetailModel data) =>
    json.encode(data.toJson());

class ReservationDetailModel extends ReservationDetailEntity {
  const ReservationDetailModel({
    required super.idReservation,
    required super.reservationStatus,
    required super.reservationInsuranceType,
    required super.reservationDate,
    required super.queueNumber,
    required super.patientFullName,
    required super.doctorName,
    required super.clinicName,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ReservationDetailModel.fromJson(Map<String, dynamic> json) =>
      ReservationDetailModel(
        idReservation: json["id_reservation"],
        reservationStatus: json["reservation_status"],
        reservationInsuranceType: json["reservation_insurance_type"],
        reservationDate: DateTime.parse(json["reservation_date"]),
        queueNumber: json["queue_number"] ?? 0,
        patientFullName: json["patient_fullname"],
        doctorName: json["doctor_name"],
        clinicName: json["clinic_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_reservation": idReservation,
        "reservation_status": reservationStatus,
        "reservation_insurance_type": reservationInsuranceType,
        "reservation_date": reservationDate.toIso8601String(),
        "queue_number": queueNumber,
        "patient_name": patientFullName,
        "doctor_name": doctorName,
        "clinic_name": clinicName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
