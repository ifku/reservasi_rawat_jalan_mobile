import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/navigation/navigation.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_path.dart';
import 'package:reservasi_rawat_jalan_mobile/features/activity/presentation/pages/activity_page.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/presentation/pages/auth_page.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/presentation/pages/complete_profile/complete_profile_page.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/presentation/pages/onboarding/onboarding_page.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/presentation/pages/otp/otp_page.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/presentation/pages/sign_in/sign_in_page.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/presentation/pages/sign_up/sign_up_page.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/presentation/pages/current_reservation/current_reservation_page.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/presentation/pages/current_reservation_detail/current_reservation_detail_page.dart';
import 'package:reservasi_rawat_jalan_mobile/features/history/presentation/pages/history_page.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/presentation/pages/home_page.dart';
import 'package:reservasi_rawat_jalan_mobile/features/profile/presentation/pages/profile/profile_page.dart';
import 'package:reservasi_rawat_jalan_mobile/features/profile/presentation/pages/profile_detail/detail_profile_page.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/doctor_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/pages/choose_doctor/choose_doctor_page.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/pages/clinic/clinic_page.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/pages/create_reservation/create_reservation.dart';
import 'package:reservasi_rawat_jalan_mobile/features/splash/splash_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _historyNavigatorKey = GlobalKey<NavigatorState>();
  static final _activityNavigatorKey = GlobalKey<NavigatorState>();
  static final _accountNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: RoutePath.splash,
    debugLogDiagnostics: !kReleaseMode,
    routes: routes,
    navigatorKey: _rootNavigatorKey,
  );

  static final routes = [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
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
                child: const HomePage(),
                state: state,
              );
            },
            routes: [
              GoRoute(
                path: RoutePath.clinicList,
                name: RouteName.clinicList,
                pageBuilder: (context, state) {
                  return canvas(
                    child: const ClinicPage(),
                    state: state,
                  );
                },
                routes: [
                  GoRoute(
                      path: RoutePath.clinicDoctorList,
                      name: RouteName.clinicDoctorList,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) {
                        return canvas(
                          child:
                              ChooseDoctorPage(clinicId: state.extra! as String),
                          state: state,
                        );
                      },
                      routes: [
                        GoRoute(
                          path: RoutePath.createReservation,
                          name: RouteName.createReservation,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) {
                            return canvas(
                              child: CreateReservationPage(
                                doctor: state.extra! as DoctorEntity,
                              ),
                              state: state,
                            );
                          },
                        ),
                      ]),
                ],
              ),
              GoRoute(
                  path: RoutePath.currentReservation,
                  name: RouteName.currentReservation,
                  parentNavigatorKey: _rootNavigatorKey,
                  pageBuilder: (context, state) {
                    return canvas(
                      child: const CurrentReservationPage(),
                      state: state,
                    );
                  },
                  routes: [
                    GoRoute(
                      path: RoutePath.currentReservationDetail,
                      name: RouteName.currentReservationDetail,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) {
                        return canvas(
                          child: const CurrentReservationDetailPage(),
                          state: state,
                        );
                      },
                    )
                  ]),
            ],
          ),
        ]),
        StatefulShellBranch(navigatorKey: _historyNavigatorKey, routes: [
          GoRoute(
            path: RoutePath.history,
            name: RouteName.history,
            pageBuilder: (context, state) {
              return canvas(
                child: const HistoryPage(),
                state: state,
              );
            },
          ),
        ]),
        StatefulShellBranch(navigatorKey: _activityNavigatorKey, routes: [
          GoRoute(
            path: RoutePath.activity,
            name: RouteName.activity,
            pageBuilder: (context, state) {
              return canvas(
                child: const ActivityPage(),
                state: state,
              );
            },
          ),
        ]),
        StatefulShellBranch(navigatorKey: _accountNavigatorKey, routes: [
          GoRoute(
              path: RoutePath.account,
              name: RouteName.account,
              pageBuilder: (context, state) {
                return canvas(
                  child: const ProfilePage(),
                  state: state,
                );
              },
              routes: [
                GoRoute(
                  path: RoutePath.detailAccount,
                  name: RouteName.detailAccount,
                  pageBuilder: (context, state) {
                    return canvas(
                      child: const ProfileDetailPage(),
                      state: state,
                    );
                  },
                ),
              ]),
        ]),
      ],
    ),
    GoRoute(
        path: RoutePath.splash,
        name: RouteName.splash,
        pageBuilder: (context, state) {
          return canvas(
            child: const SplashPage(),
            state: state,
          );
        }),
    GoRoute(
        path: RoutePath.onboarding,
        name: RouteName.onboarding,
        pageBuilder: (context, state) {
          return canvas(
            child: OnboardingPage(),
            state: state,
          );
        }),
    GoRoute(
      path: RoutePath.auth,
      name: RouteName.auth,
      pageBuilder: (context, state) {
        return canvas(
          child: const AuthPage(),
          state: state,
        );
      },
      routes: [
        GoRoute(
            path: RoutePath.signIn,
            name: RouteName.signIn,
            pageBuilder: (context, state) {
              return canvas(
                child: const SignInPage(),
                state: state,
              );
            }),
        GoRoute(
            path: RoutePath.signUp,
            name: RouteName.signUp,
            pageBuilder: (context, state) {
              return canvas(
                child: const SignUpPage(),
                state: state,
              );
            }),
        GoRoute(
            path: RoutePath.otp,
            name: RouteName.otp,
            pageBuilder: (context, state) {
              final Map<String, String?> extraData =
                  state.extra! as Map<String, String?>;
              return canvas(
                child: OtpPage(
                  email: extraData['email'] as String,
                  nik: extraData['nik'],
                ),
                state: state,
              );
            }),
      ],
    ),
    GoRoute(
        path: RoutePath.completeProfile,
        name: RouteName.completeProfile,
        pageBuilder: (context, state) {
          final Map<String, String?> extraData =
              state.extra! as Map<String, String?>;
          return canvas(
            child: CompleteProfilePage(
              email: extraData['email'] as String,
              nik: extraData['nik'],
            ),
            state: state,
          );
        }),
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
