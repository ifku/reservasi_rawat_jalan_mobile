import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/data/data_sources/current_reservation_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/data/data_sources/remote/current_reservation_remote_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/data/repositories/current_reservation_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/domain/repositories/current_reservation_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/domain/use_cases/get_current_queue_number_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/domain/use_cases/get_current_reservation_usecase.dart';

final locator = GetIt.instance;

void currentReservationModule() {
  locator.registerLazySingleton<CurrentReservationDataSource>(
    () => CurrentReservationRemoteDataSource(
      locator.get<AppHttpClient>(),
      locator.get<FirebaseFirestore>(),
    ),
  );
  locator.registerLazySingleton<CurrentReservationRepository>(
      () => CurrentReservationRepositoryImpl());
  locator.registerLazySingleton<GetCurrentReservationUseCase>(
      () => GetCurrentReservationUseCase());
  locator.registerLazySingleton<GetCurrentQueueNumberUseCase>(
    () => GetCurrentQueueNumberUseCase(
      locator.get<CurrentReservationRepository>(),
    ),
  );
}
