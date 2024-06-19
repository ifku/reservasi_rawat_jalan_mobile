import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/reservation_entity.dart';

class ReservationModel extends ReservationEntity {
  const ReservationModel(
      {required super.idReservation,
      required super.reservationInsuranceType,
      required super.reservationDate,
      required super.patientId,
      required super.doctorId,
      required super.userId,
      required super.updatedAt,
      required super.createdAt});

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      idReservation: json['id_reservation'],
      reservationInsuranceType: json['reservation_insurance_type'],
      reservationDate: json['reservation_date'],
      patientId: json['patient_id'],
      doctorId: json['doctor_id'],
      userId: json['user_id'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_reservation': idReservation,
      'reservation_insurance_type': reservationInsuranceType,
      'reservation_date': reservationDate,
      'patient_id': patientId,
      'doctor_id': doctorId,
      'user_id': userId,
      'updatedAt': updatedAt,
      'createdAt': createdAt
    };
  }
}
