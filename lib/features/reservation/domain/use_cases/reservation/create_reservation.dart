import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/dto/reservation_dto.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/reservation_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/repositories/reservation_repository.dart';

class CreateReservationUseCase
    implements UseCase<ReservationEntity, ReservationDto> {
  final ReservationRepository _reservationRepository =
      locator<ReservationRepository>();

  @override
  Future<Either<Exception, ReservationEntity>> call(
      ReservationDto params) async {
    return await _reservationRepository.createReservation(payload: params);
  }
}
