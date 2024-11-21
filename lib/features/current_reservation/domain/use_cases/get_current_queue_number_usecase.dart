import 'package:reservasi_rawat_jalan_mobile/core/usecase/stream_use_case.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/domain/repositories/current_reservation_repository.dart';

class GetCurrentQueueNumberUseCase implements StreamUseCase<int, String> {
  final CurrentReservationRepository _repository;

  GetCurrentQueueNumberUseCase(this._repository);

  @override
  Stream<int> call(String doctorId) {
    return _repository.getCurrentQueueNumber(doctorId);
  }
}
