import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/models/reservation_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/dto/reservation_dto.dart';

abstract class ReservationDataSource {
  Future<Either<Exception, ReservationModel>> createReservation(
      {required ReservationDto payload});
}
