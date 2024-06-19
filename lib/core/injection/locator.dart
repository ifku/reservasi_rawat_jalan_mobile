import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/dio_client.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/core/service/firebase_messaging_service.dart';
import 'package:reservasi_rawat_jalan_mobile/core/utils/app_database.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/auth_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/local/onboard_local_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/local/token_local_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/onboard_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/remote/auth_remote_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/token_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/repositories/onboard_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/repositories/token_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/onboard_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/token_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/delete_token_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/get_token_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/save_token_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/send_otp_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/sign_in_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/sign_up_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/data_sources/local/user_local_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/data_sources/patient_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/data_sources/remote/patient_remote_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/data_sources/user_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/repositories/patient_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/repositories/user_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/repositories/patient_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/repositories/user_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/use_cases/patient/get_patient_by_userid_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/use_cases/user/get_user_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/use_cases/user/save_user_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/data/data_sources/current_reservation_dataasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/data/data_sources/remote/current_reservation_remote_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/data/repositories/current_reservation_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/domain/repositories/current_reservation_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/domain/use_cases/get_current_reservation_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/data_sources/fake/news_fake_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/data_sources/fake/upcoming_schedule_fake_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/data_sources/news_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/data_sources/upcoming_schedule_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/repositories/news_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/repositories/upcoming_schedule_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/domain/repositories/news_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/domain/repositories/upcoming_schedule_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/domain/use_cases/get_news_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/domain/use_cases/get_upcoming_schedule_usecase.dart';
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
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/use_cases/choose_doctor/get_doctor_by_clinic_id_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/use_cases/clinic/get_all_clinic_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/use_cases/reservation/create_reservation.dart';

final locator = GetIt.instance;

Future<void> setupServiceLocator() async {
  /*Network*/
  locator.registerLazySingleton<Dio>(
      () => DioClient("${dotenv.env['API_BASE_URL']}").create());
  locator.registerLazySingleton<AppHttpClient>(
      () => AppHttpClient(dio: locator.get<Dio>()));

  /*Local Database*/
  final appDatabase = AppDatabase();
  await appDatabase.initialize();
  locator.registerLazySingleton<AppDatabase>(() => AppDatabase());
  locator.registerLazySingleton<Isar>(() => appDatabase.isar);
  locator.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage());

  /*Notification*/
  locator.registerLazySingleton<FirebaseMessagingService>(
      () => FirebaseMessagingService());

  /*Common*/
  locator.registerLazySingleton<PatientDataSource>(
      () => PatientRemoteDataSource());
  locator
      .registerLazySingleton<PatientRepository>(() => PatientRepositoryImpl());
  locator.registerLazySingleton<GetPatientByUserIdUseCase>(
      () => GetPatientByUserIdUseCase());

  /*Authentication*/
  locator.registerLazySingleton<AuthDataSource>(() => AuthRemoteDataSource());
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  locator.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase());
  locator.registerLazySingleton<SignInUseCase>(() => SignInUseCase());
  locator.registerLazySingleton<SendOtpUseCase>(() => SendOtpUseCase());
  locator
      .registerLazySingleton<OnboardDataSource>(() => OnboardLocalDataSource());
  locator
      .registerLazySingleton<OnboardRepository>(() => OnboardRepositoryImpl());

  locator.registerLazySingleton<TokenDataSource>(() => TokenLocalDataSource());
  locator.registerLazySingleton<TokenRepository>(() => TokenRepositoryImpl());
  locator.registerLazySingleton<GetTokenUseCase>(() => GetTokenUseCase());
  locator.registerLazySingleton<SaveTokenUseCase>(() => SaveTokenUseCase());
  locator.registerLazySingleton<DeleteTokenUseCase>(() => DeleteTokenUseCase());

  /*Clinic*/
  locator
      .registerLazySingleton<ClinicDataSource>(() => ClinicRemoteDatasource());
  locator.registerLazySingleton<ClinicRepository>(() => ClinicRepositoryImpl());
  locator
      .registerLazySingleton<GetAllClinicUseCase>(() => GetAllClinicUseCase());

  /*News*/
  locator.registerLazySingleton<NewsDataSource>(() => NewsFakeDataSource());
  locator.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl());
  locator.registerLazySingleton<GetNewsUseCase>(() => GetNewsUseCase());

  /*Upcoming Schedule*/
  locator.registerLazySingleton<UpcomingScheduleDatasource>(
      () => UpcomingScheduleFakeDataSource());
  locator.registerLazySingleton<UpcomingScheduleRepository>(
      () => UpcomingScheduleRepositoryImpl());
  locator.registerLazySingleton<GetUpcomingScheduleUseCase>(
      () => GetUpcomingScheduleUseCase());

  /*Doctor*/
  locator
      .registerLazySingleton<DoctorDatasource>(() => DoctorRemoteDataSource());
  locator.registerLazySingleton<DoctorRepository>(() => DoctorRepositoryImpl());
  locator.registerLazySingleton<GetDoctorByClinicIdUseCase>(
      () => GetDoctorByClinicIdUseCase());

  /*User*/
  locator.registerLazySingleton<UserDataSource>(() => UserLocalDataSource());
  locator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  locator.registerLazySingleton<SaveUserUseCase>(() => SaveUserUseCase());
  locator.registerLazySingleton<GetUserUseCase>(() => GetUserUseCase());

  /*Current Reservation*/
  locator.registerLazySingleton<CurrentReservationDataSource>(
      () => CurrentReservationRemoteDataSource());
  locator.registerLazySingleton<CurrentReservationRepository>(
      () => CurrentReservationRepositoryImpl());
  locator.registerLazySingleton<GetCurrentReservationUseCase>(
      () => GetCurrentReservationUseCase());

  /*Reservation*/
  locator.registerLazySingleton<ReservationDataSource>(
      () => ReservationRemoteDataSource());
  locator.registerLazySingleton<ReservationRepository>(
      () => ReservationRepositoryImpl());
  locator.registerLazySingleton<CreateReservationUseCase>(
      () => CreateReservationUseCase());
}
