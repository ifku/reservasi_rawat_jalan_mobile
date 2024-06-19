import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/data_sources/reservation_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/models/reservation_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/dto/reservation_dto.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/repositories/reservation_repository.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final ReservationDataSource _reservationDataSource =
      locator<ReservationDataSource>();

  @override
  Future<Either<Exception, ReservationModel>> createReservation(
      {required ReservationDto payload}) async {
    return await _reservationDataSource.createReservation(payload: payload);
  }
}
