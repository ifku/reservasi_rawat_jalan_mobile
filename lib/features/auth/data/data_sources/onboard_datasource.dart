abstract class OnboardDataSource {
  Future<void> saveOnboardStatus({required bool isOnboarded});

  Future<bool> getOnboardStatus();
}
