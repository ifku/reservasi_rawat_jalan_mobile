import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/data/models/reservation_detail_model.dart';

abstract class CurrentReservationDataSource {
  Future<Either<Exception, List<ReservationDetailModel>>> getCurrentReservation(String userId);
}
