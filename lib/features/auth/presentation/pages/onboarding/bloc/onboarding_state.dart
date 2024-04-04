part of 'onboarding_bloc.dart';

class OnboardingState extends Equatable {
  int selectedIndex;

  OnboardingState({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];
}