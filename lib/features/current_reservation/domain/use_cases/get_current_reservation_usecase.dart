import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/domain/entities/reservation_detail_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/domain/repositories/current_reservation_repository.dart';

class GetCurrentReservationUseCase
    implements UseCase<List<ReservationDetailEntity>, String> {
  final CurrentReservationRepository _currentReservationRepository =
      locator<CurrentReservationRepository>();

  @override
  Future<Either<Exception, List<ReservationDetailEntity>>> call(
      String params) async {
    return await _currentReservationRepository.getCurrentReservation(params);
  }
}
