part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();
}

class OnboardingPageChangedEvent extends OnboardingEvent {
  const OnboardingPageChangedEvent();

  @override
  List<Object> get props => [];
}
