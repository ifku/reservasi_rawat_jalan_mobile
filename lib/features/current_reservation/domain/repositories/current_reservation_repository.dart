import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/domain/entities/reservation_detail_entity.dart';

abstract class CurrentReservationRepository {
  Future<Either<Exception, List<ReservationDetailEntity>>>
      getCurrentReservation(String userId);
}
