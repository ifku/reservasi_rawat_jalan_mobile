abstract class OnboardRepository {
  Future<void> saveOnboardStatus({required bool isOnboarded});

  Future<bool> getOnboardStatus();
}
