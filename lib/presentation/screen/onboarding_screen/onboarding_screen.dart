import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/onboarding_screen/bloc/onboarding_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/onboarding_screen/widgets/onboarding_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final pageController = PageController();

  final List<String> images = [
    Assets.images.imageOnboarding1.path,
    Assets.images.imageOnboarding2.path,
    Assets.images.imageOnboarding3.path,
    Assets.images.imageOnboarding4.path,
  ];

  final List<String> title = [
    LocaleKeys.onboardingScreen_onboarding4Title,
    LocaleKeys.onboardingScreen_onboarding4Title,
    LocaleKeys.onboardingScreen_onboarding4Title,
    LocaleKeys.onboardingScreen_onboarding4Title,
  ];
  final List<String> subtitle = [
    LocaleKeys.onboardingScreen_onboarding1Subtitle,
    LocaleKeys.onboardingScreen_onboarding2Subtitle,
    LocaleKeys.onboardingScreen_onboarding3Subtitle,
    LocaleKeys.onboardingScreen_onboarding4Subtitle,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 36.0, 0, 36.0),
          child: BlocBuilder<OnboardingBloc, OnboardingState>(
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: pageController,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return OnboardingWidget(
                          images: images[index],
                          title: title[index],
                          subtitle: subtitle[index],
                        );
                      },
                      onPageChanged: (value) {
                        state.selectedIndex = value;
                        context
                            .read<OnboardingBloc>()
                            .add(const OnboardingPageChangedEvent());
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        state.selectedIndex != 0
                            ? GestureDetector(
                                onTap: () {
                                  if (state.selectedIndex > 0) {
                                    pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: Assets.icons.iconArrowCircleLeft.svg(
                                  colorFilter: ColorFilter.mode(
                                    Theme.of(context).colorScheme.primary,
                                    BlendMode.srcIn,
                                  ),
                                  width: 56.0,
                                  height: 56.0,
                                ),
                              )
                            : const SizedBox(
                                width: 56.0,
                                height: 56.0,
                              ),
                        SmoothPageIndicator(
                          controller: pageController,
                          count: images.length,
                          axisDirection: Axis.horizontal,
                          effect: SlideEffect(
                            spacing: 12.0,
                            radius: 16.0,
                            type: SlideType.normal,
                            paintStyle: PaintingStyle.fill,
                            dotColor: Theme.of(context)
                                .colorScheme
                                .primaryContainer
                                .withOpacity(0.5),
                            activeDotColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (state.selectedIndex < images.length - 1) {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              context.goNamed(RouteName.home);
                            }
                          },
                          child: Assets.icons.iconArrowCircleRight.svg(
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.primary,
                              BlendMode.srcIn,
                            ),
                            width: 56.0,
                            height: 56.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
