import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/onboard_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/save_token_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/send_otp_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/sign_in_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/use_cases/sign_up_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/presentation/pages/onboarding/bloc/onboarding_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/presentation/pages/otp/bloc/otp_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/presentation/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/presentation/pages/sign_up/bloc/sign_up_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/use_cases/patient/get_patient_by_userid_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/use_cases/user/get_user_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/use_cases/user/save_user_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/domain/use_cases/get_current_reservation_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/presentation/pages/current_reservation/bloc/current_reservation_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/domain/use_cases/get_news_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/domain/use_cases/get_upcoming_schedule_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/presentation/pages/bloc/home_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/use_cases/choose_doctor/get_doctor_by_available_date_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/use_cases/reservation/create_reservation_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/pages/choose_doctor/bloc/choose_doctor_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/pages/clinic/bloc/clinic_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/pages/create_reservation/bloc/create_reservation/create_reservation_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/pages/create_reservation/bloc/create_reservation_action/create_reservation_action_cubit.dart';

class BlocProviders {
  static List<BlocProvider> getBlocProviders() {
    return [
      BlocProvider<OnboardingBloc>(
        create: (context) => OnboardingBloc(
          locator.get<OnboardRepository>(),
        ),
      ),
      BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(
          locator.get<GetNewsUseCase>(),
          locator.get<GetUpcomingScheduleUseCase>(),
          locator.get<GetUserUseCase>(),
        ),
      ),
      BlocProvider<ClinicBloc>(
        create: (context) => ClinicBloc(),
      ),
      BlocProvider<ChooseDoctorBloc>(
        create: (context) => ChooseDoctorBloc(
          locator.get<GetDoctorByClinicIdUseCase>(),
        ),
      ),
      BlocProvider<OtpBloc>(
        create: (context) => OtpBloc(
          locator.get<SignInUseCase>(),
          locator.get<SaveUserUseCase>(),
          locator.get<SaveTokenUseCase>(),
        ),
      ),
      BlocProvider<SignInBloc>(
        create: (context) => SignInBloc(
          locator.get<SendOtpUseCase>(),
        ),
      ),
      BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(
          locator.get<SignUpUseCase>(),
        ),
      ),
      BlocProvider<CurrentReservationBloc>(
        create: (context) => CurrentReservationBloc(
          locator.get<GetCurrentReservationUseCase>(),
          locator.get<GetUserUseCase>(),
        ),
      ),
      BlocProvider<CreateReservationBloc>(
        create: (context) => CreateReservationBloc(
          locator.get<GetPatientByUserIdUseCase>(),
          locator.get<GetUserUseCase>(),
          locator.get<CreateReservationUseCase>(),
        ),
      ),
      BlocProvider<CreateReservationActionCubit>(
        create: (context) => CreateReservationActionCubit(),
      ),
    ];
  }
}
