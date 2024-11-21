import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/domain/entities/reservation_detail_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/domain/repositories/current_reservation_repository.dart';

class GetReservationByIdUseCase implements UseCase<ReservationDetailEntity, String> {
  final CurrentReservationRepository repository;

  GetReservationByIdUseCase(this.repository);

  @override
  Future<Either<Exception, ReservationDetailEntity>> call(String params) async {
    return await repository.getCurrentReservationById(params);
  }
}