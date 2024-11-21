import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/dio_client.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/core/service/firebase_messaging_service.dart';
import 'package:reservasi_rawat_jalan_mobile/core/utils/app_database.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/auth_module.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/common_module.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/data_sources/local/user_local_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/data_sources/user_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/repositories/user_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/repositories/user_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/use_cases/user/get_user_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/use_cases/user/save_user_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/current_reservation_module.dart';
import 'package:reservasi_rawat_jalan_mobile/features/doctor_schedule/doctor_schedule_module.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/home_module.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/reservation_module.dart';

final locator = GetIt.instance;

Future<void> setupServiceLocator() async {
  /*Network*/
  locator.registerLazySingleton<Dio>(
    () => DioClient("${dotenv.env['API_BASE_URL']}").create(),
  );
  locator.registerLazySingleton<AppHttpClient>(
    () => AppHttpClient(
      dio: locator.get<Dio>(),
    ),
  );

  /*Local Database*/
  final appDatabase = AppDatabase();
  await appDatabase.initialize();
  locator.registerLazySingleton<AppDatabase>(
    () => AppDatabase(),
  );
  locator.registerLazySingleton<Isar>(() => appDatabase.isar);
  locator.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  /*Notification*/
  locator.registerLazySingleton<FirebaseMessagingService>(
    () => FirebaseMessagingService(),
  );

  /*User*/
  locator.registerLazySingleton<UserDataSource>(
    () => UserLocalDataSource(
      locator.get<Isar>(),
    ),
  );
  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      locator.get<UserDataSource>(),
    ),
  );
  locator.registerLazySingleton<SaveUserUseCase>(
    () => SaveUserUseCase(
      locator.get<UserRepository>(),
    ),
  );
  locator.registerLazySingleton<GetUserUseCase>(
    () => GetUserUseCase(
      locator.get<UserRepository>(),
    ),
  );

  /*Module*/
  commonModule();
  authModule();
  homeModule();
  doctorScheduleModule();
  reservationModule();
  currentReservationModule();
}
