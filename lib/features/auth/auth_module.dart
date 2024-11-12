import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
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

final locator = GetIt.instance;

void authModule() {
  locator.registerLazySingleton<AuthDataSource>(
    () => AuthRemoteDataSource(
      locator.get<AppHttpClient>(),
    ),
  );
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      locator.get<AuthDataSource>(),
    ),
  );
  locator.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(
      locator.get<AuthRepository>(),
    ),
  );
  locator.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(
      locator.get<AuthRepository>(),
    ),
  );
  locator.registerLazySingleton<SendOtpUseCase>(
    () => SendOtpUseCase(
      locator.get<AuthRepository>(),
    ),
  );
  locator.registerLazySingleton<OnboardDataSource>(
    () => OnboardLocalDataSource(
      locator.get<FlutterSecureStorage>(),
    ),
  );
  locator.registerLazySingleton<OnboardRepository>(
    () => OnboardRepositoryImpl(
      locator.get<OnboardDataSource>(),
    ),
  );

  locator.registerLazySingleton<TokenDataSource>(
    () => TokenLocalDataSource(
      locator.get<FlutterSecureStorage>(),
    ),
  );
  locator.registerLazySingleton<TokenRepository>(
    () => TokenRepositoryImpl(
      locator.get<TokenDataSource>(),
    ),
  );
  locator.registerLazySingleton<GetTokenUseCase>(
    () => GetTokenUseCase(
      locator.get<TokenRepository>(),
    ),
  );
  locator.registerLazySingleton<SaveTokenUseCase>(
    () => SaveTokenUseCase(
      locator.get<TokenRepository>(),
    ),
  );
  locator.registerLazySingleton<DeleteTokenUseCase>(
    () => DeleteTokenUseCase(
      locator.get<TokenRepository>(),
    ),
  );
}
