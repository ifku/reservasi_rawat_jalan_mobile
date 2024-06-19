import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/onboard_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/onboard_repository.dart';

class OnboardRepositoryImpl implements OnboardRepository {
  final OnboardDataSource _onboardDataSource = locator<OnboardDataSource>();

  @override
  Future<void> saveOnboardStatus({required bool isOnboarded}) async {
    await _onboardDataSource.saveOnboardStatus(isOnboarded: isOnboarded);
  }

  @override
  Future<bool> getOnboardStatus() async {
    return await _onboardDataSource.getOnboardStatus();
  }
}
