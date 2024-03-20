import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/choose_doctor_screen/bloc/choose_doctor_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/clinic_screen/bloc/clinic_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/home_screen/bloc/home_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/onboarding_screen/bloc/onboarding_bloc.dart';

class BlocProviders {
  static List<BlocProvider> getBlocProviders() {
    return [
      BlocProvider<OnboardingBloc>(create: (context) => OnboardingBloc()),
      BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
      BlocProvider<ClinicBloc>(create: (context) => ClinicBloc()),
      BlocProvider<ChooseDoctorBloc>(create: (context) => ChooseDoctorBloc()),
    ];
  }
}
