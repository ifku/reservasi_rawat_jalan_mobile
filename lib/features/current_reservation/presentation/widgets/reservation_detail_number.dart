import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/style/color.dart';

class ReservationDetailNumber extends StatelessWidget {
  final String reservationId;

  const ReservationDetailNumber({
    super.key,
    this.reservationId = "0",
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.reservationScreen_yourReservationNumber.tr(),
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 14.0),
          Text(
            '$reservationId',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 40,
                ),
          ),
          const SizedBox(height: 14.0),
          Container(
            height: 24,
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
              color: RRJColors.blueDark,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                width: 1,
              ),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.info,
                        size: 14.0,
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                    const SizedBox(width: 4.0),
                    Text(
                      LocaleKeys.reservationScreen_pleaseArrive.tr(),
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
