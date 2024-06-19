import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/onboard_repository.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final OnboardRepository _onboardRepository = locator<OnboardRepository>();

  OnboardingBloc() : super(OnboardingState(selectedIndex: 0)) {
    on<OnboardingPageChangedEvent>((event, emit) {
      emit(OnboardingState(selectedIndex: state.selectedIndex));
    });

    on<OnboardingFinished>((event, emit) async {
      await _onboardRepository.saveOnboardStatus(isOnboarded: true);
    });
  }
}
