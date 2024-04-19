import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_outlined_button.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/presentation/widgets/reservation_info_item.dart';

class RRJReservationListCard extends StatelessWidget {
  const RRJReservationListCard({
    super.key,
    required this.id,
    required this.date,
    required this.patientName,
    required this.clinic,
    required this.serviceHour,
    required this.doctorName,
    this.onPressed,
  });

  final String id;
  final String date;
  final String patientName;
  final String clinic;
  final String serviceHour;
  final String doctorName;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shadowColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 14.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ID Pemesanan",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.5),
                            ),
                      ),
                      Text(id, style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  Container(
                    height: 24.0,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    child: Row(
                      children: [
                        Assets.icons.iconCalendar.svg(
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn,
                          ),
                          width: 14.0,
                          height: 14.0,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          date,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LocaleKeys.reservationScreen_reservationInformation.tr(),
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReservationInfoItem(
                            title: "Nama Pasieasddddddddddddddddddddddasdn",
                            icon: Assets.icons.iconPerson3.path,
                            content: patientName),
                        const SizedBox(height: 12),
                        ReservationInfoItem(
                            title: "Poli Layanan",
                            icon: Assets.icons.iconLocation.path,
                            content: clinic),
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReservationInfoItem(
                            title: "Jam Pelayanan",
                            icon: Assets.icons.iconClock.path,
                            content: serviceHour),
                        const SizedBox(height: 12),
                        ReservationInfoItem(
                            title: "Jam Layanan",
                            icon: Assets.icons.iconPerson3.path,
                            content: doctorName),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            child: RRJOutlinedButton(
              onPressed: () {},
              width: MediaQuery.of(context).size.width,
              borderColor: Theme.of(context).colorScheme.primary,
              backgroundColor:
                  Theme.of(context).colorScheme.primary.withOpacity(0.1),
              child: Text(
                "Lihat E-TIKET",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
