import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/data_sources/onboard_datasource.dart';

class OnboardLocalDataSource implements OnboardDataSource {
  final storage = locator<FlutterSecureStorage>();
  final isOnboardedKey = 'is_onboarded';

  @override
  Future<void> saveOnboardStatus({required bool isOnboarded}) async {
    await storage.write(key: isOnboardedKey, value: isOnboarded.toString());
  }

  @override
  Future<bool> getOnboardStatus() async {
    String? isOnboarded = await storage.read(key: isOnboardedKey);
    if (isOnboarded != null) {
      return isOnboarded == 'true';
    } else {
      return false;
    }
  }
}
