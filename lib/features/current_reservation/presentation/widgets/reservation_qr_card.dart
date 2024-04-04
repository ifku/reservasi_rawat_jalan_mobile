import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/dialog/show_rrj_dialog.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';

class ReservationQrCard extends StatelessWidget {
  const ReservationQrCard({super.key, this.qrCode});

  final String? qrCode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showRRJDialog(
          context,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
        );
      },
      child: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.reservationScreen_scanCode.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w300),
            ),
            qrCode != null
                ? CachedNetworkImage(
                    imageUrl: qrCode!,
                    height: 84,
                    width: 84,
                    placeholder: (context, url) =>
                        Assets.raw.loadingAnim.lottie())
                : Assets.icons.iconQrcode.svg(
                    height: 84,
                    width: 84,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
