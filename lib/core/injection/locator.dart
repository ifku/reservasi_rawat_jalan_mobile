import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/dio_client.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/core/utils/app_database.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/auth_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/clinic_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/doctor_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/fake/choose_doctor_fake_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/fake/clinic_fake_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/fake/news_fake_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/fake/upcoming_schedule_fake_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/news_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/remote/auth_remote_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/upcoming_schedule_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/repository/auth_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/data/repository/clinic_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/data/repository/doctor_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/data/repository/news_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/data/repository/upcoming_schedule_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/repository/auth_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/repository/clinic_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/repository/doctor_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/repository/news_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/repository/upcoming_schedule_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/usecases/auth/sign_in_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/usecases/auth/sign_up_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/usecases/choose_doctor/get_doctor_by_clinic_id_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/usecases/clinic/get_all_clinic_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/usecases/home/get_news_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/usecases/home/get_upcoming_schedule_usecase.dart';

final locator = GetIt.instance;

Future<void> setupServiceLocator() async {
  /*Network*/
  locator.registerSingleton<Dio>(
      DioClient("${dotenv.env['API_BASE_URL']}").create());
  locator
      .registerSingleton<AppHttpClient>(AppHttpClient(dio: locator.get<Dio>()));

  /*Local Database*/
  locator.registerSingleton(AppDatabase());

  /*Clinic*/
  // locator.registerSingleton<ClinicDataSource>(ClinicRemoteDatasource());
  locator.registerSingleton<ClinicDataSource>(ClinicFakeDataSource());
  locator.registerSingleton<ClinicRepository>(ClinicRepositoryImpl());
  locator.registerSingleton<GetAllClinicUseCase>(GetAllClinicUseCase());

  locator.registerSingleton<NewsDataSource>(NewsFakeDataSource());
  locator.registerSingleton<NewsRepository>(NewsRepositoryImpl());
  locator.registerSingleton<GetNewsUseCase>(GetNewsUseCase());

  locator.registerSingleton<UpcomingScheduleDatasource>(
      UpcomingScheduleFakeDataSource());
  locator.registerSingleton<UpcomingScheduleRepository>(
      UpcomingScheduleRepositoryImpl());
  locator.registerSingleton<GetUpcomingScheduleUseCase>(
      GetUpcomingScheduleUseCase());

  // locator.registerSingleton<DoctorDatasource>(DoctorRemoteDataSource());
  locator.registerSingleton<DoctorDatasource>(ChooseDoctorFakeDatasource());
  locator.registerSingleton<DoctorRepository>(DoctorRepositoryImpl());
  locator.registerSingleton<GetDoctorByClinicIdUseCase>(
      GetDoctorByClinicIdUseCase());

  /*Authentication*/
  locator.registerSingleton<AuthDataSource>(AuthRemoteDataSource());
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  locator.registerSingleton<SignUpUseCase>(SignUpUseCase());
  locator.registerSingleton<SignInUseCase>(SignInUseCase());
}
