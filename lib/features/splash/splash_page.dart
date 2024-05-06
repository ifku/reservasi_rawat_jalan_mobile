import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/onboard_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/token_repository.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final OnboardRepository onboardRepository = locator<OnboardRepository>();
  final TokenRepository tokenRepository = locator<TokenRepository>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      _redirectToNextScreen();
    });
  }

  Future<void> _redirectToNextScreen() async {
    final isOnboarded = await onboardRepository.getOnboardStatus();
    final token = await tokenRepository.getAccessToken();
    if (mounted) {
      if (isOnboarded) {
        token.fold((l) => context.goNamed(RouteName.auth),
            (r) => context.goNamed(RouteName.home));
        /*context.goNamed(RouteName.auth);*/
      } else {
        context.goNamed(RouteName.onboarding);
      }
    }
  }
}
