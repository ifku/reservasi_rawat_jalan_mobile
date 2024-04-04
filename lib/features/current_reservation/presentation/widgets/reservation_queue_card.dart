import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';

class ReservationQueueCard extends StatelessWidget {
  const ReservationQueueCard({
    super.key,
    this.current = 0,
    this.time = "00:00",
  });

  final int current;
  final String time;

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  LocaleKeys.reservationScreen_currentReservation.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Text(current.toString(),
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12.0),
            Text(
              LocaleKeys.reservationScreen_estimatedTime.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w300),
            ),
            Text(time, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
