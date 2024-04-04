import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState(selectedIndex: 0)) {
    on<OnboardingPageChangedEvent>((event, emit) {
      emit(OnboardingState(selectedIndex: state.selectedIndex));
    });
  }
}
