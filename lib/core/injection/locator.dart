import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/dio_client.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/core/utils/app_database.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/auth_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/local/token_local_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/local/user_local_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/remote/auth_remote_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/token_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/user_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/repositories/token_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/repositories/user_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/token_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/user_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/delete_token_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/get_token_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/get_user_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/save_token_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/save_user_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/send_otp_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/sign_in_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/sign_up_usecase.dart';
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
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/repositories/clinic_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/repositories/doctor_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/repositories/clinic_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/repositories/doctor_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/use_cases/choose_doctor/get_doctor_by_clinic_id_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/use_cases/clinic/get_all_clinic_usecase.dart';

final locator = GetIt.instance;

Future<void> setupServiceLocator() async {
  /*Network*/
  locator.registerSingleton<Dio>(
      DioClient("${dotenv.env['API_BASE_URL']}").create());
  locator
      .registerSingleton<AppHttpClient>(AppHttpClient(dio: locator.get<Dio>()));

  /*Local Database*/
  final appDatabase = AppDatabase();
  await appDatabase.initialize();
  locator.registerSingleton<AppDatabase>(appDatabase);
  locator.registerSingleton<Isar>(appDatabase.isar);
  locator.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());

  /*Authentication*/
  locator.registerSingleton<AuthDataSource>(AuthRemoteDataSource());
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  locator.registerSingleton<SignUpUseCase>(SignUpUseCase());
  locator.registerSingleton<SignInUseCase>(SignInUseCase());
  locator.registerSingleton<SendOtpUseCase>(SendOtpUseCase());

  locator.registerSingleton<TokenDataSource>(TokenLocalDataSource());
  locator.registerSingleton<TokenRepository>(TokenRepositoryImpl());
  locator.registerSingleton<GetTokenUseCase>(GetTokenUseCase());
  locator.registerSingleton<SaveTokenUseCase>(SaveTokenUseCase());
  locator.registerSingleton<DeleteTokenUseCase>(DeleteTokenUseCase());

  /*Clinic*/
  locator.registerSingleton<ClinicDataSource>(ClinicRemoteDatasource());
  locator.registerSingleton<ClinicRepository>(ClinicRepositoryImpl());
  locator.registerSingleton<GetAllClinicUseCase>(GetAllClinicUseCase());

  /*News*/
  locator.registerSingleton<NewsDataSource>(NewsFakeDataSource());
  locator.registerSingleton<NewsRepository>(NewsRepositoryImpl());
  locator.registerSingleton<GetNewsUseCase>(GetNewsUseCase());

  /*Upcoming Schedule*/
  locator.registerSingleton<UpcomingScheduleDatasource>(
      UpcomingScheduleFakeDataSource());
  locator.registerSingleton<UpcomingScheduleRepository>(
      UpcomingScheduleRepositoryImpl());
  locator.registerSingleton<GetUpcomingScheduleUseCase>(
      GetUpcomingScheduleUseCase());

  /*Doctor*/
  locator.registerSingleton<DoctorDatasource>(DoctorRemoteDataSource());
  locator.registerSingleton<DoctorRepository>(DoctorRepositoryImpl());
  locator.registerSingleton<GetDoctorByClinicIdUseCase>(
      GetDoctorByClinicIdUseCase());

  /*User*/
  locator.registerSingleton<UserDataSource>(UserLocalDataSource());
  locator.registerSingleton<UserRepository>(UserRepositoryImpl());
  locator.registerSingleton<SaveUserUseCase>(SaveUserUseCase());
  locator.registerSingleton<GetUserUseCase>(GetUserUseCase());
}
