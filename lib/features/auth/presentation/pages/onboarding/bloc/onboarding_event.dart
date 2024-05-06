part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();
}

class OnboardingPageChangedEvent extends OnboardingEvent {
  const OnboardingPageChangedEvent();

  @override
  List<Object> get props => [];
}

class OnboardingFinished extends OnboardingEvent {
  final bool isOnboarded;

  const OnboardingFinished({required this.isOnboarded});

  @override
  List<Object> get props => [isOnboarded];
}
