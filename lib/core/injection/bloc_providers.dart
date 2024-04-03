import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/auth_screen/features/otp/bloc/otp_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/auth_screen/features/sign-up/bloc/sign_up_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/choose_doctor_screen/bloc/choose_doctor_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/clinic_screen/bloc/clinic_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/home_screen/bloc/home_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/onboarding_screen/bloc/onboarding_bloc.dart';

import '../../presentation/screen/auth_screen/features/sign-in/bloc/sign_in_bloc.dart';

class BlocProviders {
  static List<BlocProvider> getBlocProviders() {
    return [
      BlocProvider<OnboardingBloc>(create: (context) => OnboardingBloc()),
      BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
      BlocProvider<ClinicBloc>(create: (context) => ClinicBloc()),
      BlocProvider<ChooseDoctorBloc>(create: (context) => ChooseDoctorBloc()),
      BlocProvider<OtpBloc>(create: (context) => OtpBloc()),
      BlocProvider<SignInBloc>(create: (context) => SignInBloc()),
      BlocProvider<SignUpBloc>(create: (context) => SignUpBloc()),
    ];
  }
}
