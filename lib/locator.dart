import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/clinic_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/repository/clinic_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/clinic_screen/bloc/clinic_bloc.dart';

import 'core/network/http_client.dart';
import 'data/data_sources/remote/clinic_remote_datasource.dart';
import 'data/repository/clinic_repository_impl.dart';

final locator = GetIt.instance;

Future<void> setupServiceLocator() async {
  /*Network*/
  locator.registerSingleton<Dio>( Dio());
  locator.registerSingleton<AppHttpClient>(AppHttpClient(dio: locator<Dio>()));
  /*Clinic*/
  locator.registerSingleton<ClinicDataSource>(ClinicRemoteDatasource(client: locator<AppHttpClient>()));
  locator.registerSingleton<ClinicRepository>(ClinicRepositoryImpl(locator<ClinicDataSource>()));
  locator.registerFactory(() => ClinicBloc(locator<ClinicRepository>()));


}
