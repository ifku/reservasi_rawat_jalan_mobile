import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/data/data_sources/current_reservation_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/data/models/reservation_detail_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/domain/entities/reservation_detail_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/domain/repositories/current_reservation_repository.dart';

class CurrentReservationRepositoryImpl implements CurrentReservationRepository {
  final CurrentReservationDataSource _currentReservationDataSource =
      locator<CurrentReservationDataSource>();

  @override
  Future<Either<Exception, List<ReservationDetailModel>>> getCurrentReservation(
      String userId) async {
    return await _currentReservationDataSource.getCurrentReservation(userId);
  }

  @override
  Future<Either<Exception, ReservationDetailEntity>> getCurrentReservationById(String reservationId) async {
    return await _currentReservationDataSource.getCurrentReservationById(reservationId);
  }
}
