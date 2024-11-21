import 'package:get_it/get_it.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/features/doctor_schedule/data/data_sources/doctor_list_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/doctor_schedule/data/data_sources/remote/doctor_list_remote_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/doctor_schedule/data/repositories/doctor_list_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/doctor_schedule/domain/repositories/doctor_list_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/doctor_schedule/domain/usecase/get_all_doctor_usecase.dart';

final locator = GetIt.instance;

void doctorScheduleModule() {
  locator.registerLazySingleton<DoctorListDataSource>(
    () => DoctorListRemoteDataSource(
      locator.get<AppHttpClient>(),
    ),
  );
  locator.registerLazySingleton<DoctorListRepository>(
    () => DoctorListRepositoryImpl(
      locator.get<DoctorListDataSource>(),
    ),
  );
  locator.registerLazySingleton<GetAllDoctorUseCase>(
    () => GetAllDoctorUseCase(
      locator.get<DoctorListRepository>(),
    ),
  );
}
