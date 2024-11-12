import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/onboard_datasource.dart';

class OnboardLocalDataSource implements OnboardDataSource {
  final FlutterSecureStorage _storage;
  OnboardLocalDataSource(this._storage);

  final isOnboardedKey = 'is_onboarded';

  @override
  Future<void> saveOnboardStatus({required bool isOnboarded}) async {
    await _storage.write(key: isOnboardedKey, value: isOnboarded.toString());
  }

  @override
  Future<bool> getOnboardStatus() async {
    String? isOnboarded = await _storage.read(key: isOnboardedKey);
    if (isOnboarded != null) {
      return isOnboarded == 'true';
    } else {
      return false;
    }
  }
}
