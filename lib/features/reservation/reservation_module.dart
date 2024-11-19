import 'package:get_it/get_it.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/data_sources/clinic_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/data_sources/doctor_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/data_sources/remote/clinic_remote_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/data_sources/remote/doctor_remote_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/data_sources/remote/reservation_remote_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/data_sources/reservation_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/repositories/clinic_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/repositories/doctor_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/repositories/reservation_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/repositories/clinic_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/repositories/doctor_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/use_cases/choose_doctor/get_doctor_by_available_date_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/use_cases/clinic/get_all_clinic_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/use_cases/reservation/create_reservation_usecase.dart';

final locator = GetIt.instance;

void reservationModule() {
  locator.registerLazySingleton<ClinicDataSource>(
    () => ClinicRemoteDatasource(
      locator.get<AppHttpClient>(),
    ),
  );
  locator.registerLazySingleton<ClinicRepository>(
    () => ClinicRepositoryImpl(
      locator.get<ClinicDataSource>(),
    ),
  );
  locator.registerLazySingleton<GetAllClinicUseCase>(
    () => GetAllClinicUseCase(
      locator.get<ClinicRepository>(),
    ),
  );

  locator.registerLazySingleton<ReservationDataSource>(
    () => ReservationRemoteDataSource(
      locator.get<AppHttpClient>(),
    ),
  );
  locator.registerLazySingleton<ReservationRepository>(
    () => ReservationRepositoryImpl(),
  );
  locator.registerLazySingleton<CreateReservationUseCase>(
    () => CreateReservationUseCase(),
  );

  locator.registerLazySingleton<DoctorDatasource>(
    () => DoctorRemoteDataSource(
      locator.get<AppHttpClient>(),
    ),
  );
  locator.registerLazySingleton<DoctorRepository>(
    () => DoctorRepositoryImpl(
      locator.get<DoctorDatasource>(),
    ),
  );
  locator.registerLazySingleton<GetDoctorByClinicIdUseCase>(
    () => GetDoctorByClinicIdUseCase(
      locator.get<DoctorRepository>(),
    ),
  );
}
