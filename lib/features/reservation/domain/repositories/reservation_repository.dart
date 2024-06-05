import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/dto/reservation_dto.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/reservation_entity.dart';

abstract class ReservationRepository {
  Future<Either<Exception, ReservationEntity>> createReservation(
      {required ReservationDto payload});
}
