import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget(
      {super.key,
      required this.images,
      required this.title,
      required this.subtitle});

  final String images;
  final String title;
  final String subtitle;

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  late String _currentLanguage;

  @override
  void initState() {
    super.initState();
    _currentLanguage = 'id';
  }

  String _getCurrentLanguage() {
    final locale = Localizations.localeOf(context);
    return locale.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    _currentLanguage = _getCurrentLanguage();
    return OrientationBuilder(
      builder: (context, orientation) {
        double imageHeight = orientation == Orientation.portrait
            ? MediaQuery.of(context).size.height * 0.65
            : MediaQuery.of(context).size.height * 3;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                widget.images,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.title.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 16.0),
              Text(
                widget.subtitle.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.4),
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
