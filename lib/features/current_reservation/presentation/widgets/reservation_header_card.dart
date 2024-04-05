import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';

class ReservationHeaderCard extends StatelessWidget {
  const ReservationHeaderCard(
      {super.key,
      this.currentQueueNumber = "0",
      this.currentQueueEstimation = "00:00"});

  final String currentQueueNumber;
  final String currentQueueEstimation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.05),
            blurRadius: 2.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.reservationScreen_currentReservation.tr(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                      ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  currentQueueNumber,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 42.0,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ],
            ),
          ),
          VerticalDivider(
            indent: 38.0,
            endIndent: 38.0,
            width: 2,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.reservationScreen_estimatedTime.tr(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                      ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  currentQueueEstimation,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 42.0,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
