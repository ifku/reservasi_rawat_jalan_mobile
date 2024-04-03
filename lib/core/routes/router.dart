import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_path.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/navigation/navigation.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/activity_screen/activity_screen.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/auth_screen/auth_screen.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/auth_screen/features/otp/otp_screen.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/auth_screen/features/sign-in/sign_in_screen.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/auth_screen/features/sign-up/sign_up_screen.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/choose_doctor_screen/choose_doctor_screen.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/clinic_screen/clinic_screen.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/history_screen/history_screen.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/home_screen/home_screen.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/onboarding_screen/onboarding_screen.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/profile_screen/profile_screen.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/reservation_screen/features/reservation_detail_screen.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/reservation_screen/reservation_screen.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/splash_screen/splash_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: RoutePath.splash,
    debugLogDiagnostics: !kReleaseMode,
    routes: routes,
    navigatorKey: _rootNavigatorKey,
  );

  static final routes = [
    StatefulShellRoute.indexedStack(
      pageBuilder: (context, state, navigationShell) {
        return canvas(
          child: Navigation(
            navigationShell: navigationShell,
          ),
          state: state,
        );
      },
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: RoutePath.home,
            name: RouteName.home,
            pageBuilder: (context, state) {
              return canvas(
                child: const HomeScreen(),
                state: state,
              );
            },
            routes: [
              GoRoute(
                path: RoutePath.clinicList,
                name: RouteName.clinicList,
                pageBuilder: (context, state) {
                  return canvas(
                    child: const ClinicScreen(),
                    state: state,
                  );
                },
                routes: [
                  GoRoute(
                    path: RoutePath.clinicDoctorList,
                    name: RouteName.clinicDoctorList,
                    pageBuilder: (context, state) {
                      return canvas(
                        child:
                            ChooseDoctorScreen(clinicId: state.extra as String),
                        state: state,
                      );
                    },
                  ),
                ],
              ),
              GoRoute(
                  path: RoutePath.reservation,
                  name: RouteName.reservation,
                  pageBuilder: (context, state) {
                    return canvas(
                      child: const ReservationScreen(),
                      state: state,
                    );
                  },
                  routes: [
                    GoRoute(
                      path: RoutePath.reservationDetail,
                      name: RouteName.reservationDetail,
                      pageBuilder: (context, state) {
                        return canvas(
                          child: const ReservationDetailScreen(),
                          state: state,
                        );
                      },
                    )
                  ]),
            ],
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: RoutePath.history,
            name: RouteName.history,
            pageBuilder: (context, state) {
              return canvas(
                child: const HistoryScreen(),
                state: state,
              );
            },
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: RoutePath.activity,
            name: RouteName.activity,
            pageBuilder: (context, state) {
              return canvas(
                child: const ActivityScreen(),
                state: state,
              );
            },
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: RoutePath.account,
            name: RouteName.account,
            pageBuilder: (context, state) {
              return canvas(
                child: const ProfileScreen(),
                state: state,
              );
            },
          ),
        ]),
      ],
    ),
    GoRoute(
        path: RoutePath.splash,
        name: RouteName.splash,
        pageBuilder: (context, state) {
          return canvas(
            child: const SplashScreen(),
            state: state,
          );
        }),
    GoRoute(
        path: RoutePath.onboarding,
        name: RouteName.onboarding,
        pageBuilder: (context, state) {
          return canvas(
            child: OnboardingScreen(),
            state: state,
          );
        }),
    GoRoute(
      path: RoutePath.auth,
      name: RouteName.auth,
      pageBuilder: (context, state) {
        return canvas(
          child: const AuthScreen(),
          state: state,
        );
      },
      routes: [
        GoRoute(
            path: RoutePath.signIn,
            name: RouteName.signIn,
            pageBuilder: (context, state) {
              return canvas(
                child: const SignInScreen(),
                state: state,
              );
            }),
        GoRoute(
            path: RoutePath.signUp,
            name: RouteName.signUp,
            pageBuilder: (context, state) {
              return canvas(
                child: const SignUpScreen(),
                state: state,
              );
            }),
        GoRoute(
            path: RoutePath.otp,
            name: RouteName.otp,
            pageBuilder: (context, state) {
              return canvas(
                child: OtpScreen(
                  email: state.extra as String,
                ),
                state: state,
              );
            }),
      ],
    ),
  ];

  static Page canvas({
    required Widget child,
    required GoRouterState state,
  }) {
    if (Platform.isAndroid) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
                parent: animation, curve: Curves.easeInOutCubic)),
            child: child,
          );
        },
      );
    }
    return CupertinoPage(
      key: state.pageKey,
      child: child,
    );
  }
}
