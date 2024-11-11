import 'package:get_it/get_it.dart';
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

final locator = GetIt.instance;

void homeModule() {
  locator.registerLazySingleton<NewsDataSource>(() => NewsFakeDataSource());
  locator.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl());
  locator.registerLazySingleton<GetNewsUseCase>(() => GetNewsUseCase());

  locator.registerLazySingleton<UpcomingScheduleDatasource>(
          () => UpcomingScheduleFakeDataSource());
  locator.registerLazySingleton<UpcomingScheduleRepository>(
          () => UpcomingScheduleRepositoryImpl());
  locator.registerLazySingleton<GetUpcomingScheduleUseCase>(
          () => GetUpcomingScheduleUseCase());
}