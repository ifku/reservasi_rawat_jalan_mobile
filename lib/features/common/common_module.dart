import 'package:get_it/get_it.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/data_sources/patient_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/data_sources/remote/patient_remote_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/repositories/patient_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/repositories/patient_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/use_cases/patient/get_patient_by_userid_usecase.dart';

final locator = GetIt.instance;

void commonModule() {
  locator.registerLazySingleton<PatientDataSource>(
    () => PatientRemoteDataSource(
      locator.get<AppHttpClient>(),
    ),
  );
  locator.registerLazySingleton<PatientRepository>(
    () => PatientRepositoryImpl(
      locator.get<PatientDataSource>(),
    ),
  );
  locator.registerLazySingleton<GetPatientByUserIdUseCase>(
    () => GetPatientByUserIdUseCase(
      locator.get<PatientRepository>(),
    ),
  );
}
