import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_primary_button.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            title: Text(LocaleKeys.activityScreen_activity.tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 18.0, fontWeight: FontWeight.w600))),
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.images.imageHistory.svg(
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16.0),
                  Text(LocaleKeys.historyScreen_thereAreNoReservation.tr(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 18.0, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8.0),
                  Text(
                    LocaleKeys.historyScreen_youHaveNotBooked.tr(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.5),
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  const SizedBox(height: 24),
                  RRJPrimaryButton(
                    onPressed: () {},
                    height: 44.0,
                    width: MediaQuery.of(context).size.width,
                    child: Text(LocaleKeys.historyScreen_makeReservation.tr()),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
