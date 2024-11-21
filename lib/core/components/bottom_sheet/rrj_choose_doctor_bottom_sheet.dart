import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_primary_button.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/card/rrj_doctor_info_card.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/entities/doctor_entity.dart';

class RRJChooseDoctorBottomSheet extends StatelessWidget {
  const RRJChooseDoctorBottomSheet({
    super.key,
    this.onChooseDoctor,
    required this.doctor,
  });

  final DoctorEntity doctor;
  final void Function()? onChooseDoctor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      splashColor: Colors.transparent,
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.clear),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      LocaleKeys.detailDoctorScreen_detailDoctor.tr(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: doctor.doctorImage != null
                    ? CachedNetworkImage(
                        height: MediaQuery.of(context).size.width * 0.3,
                        width: MediaQuery.of(context).size.width * 0.3,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Assets.raw.loadingAnim.lottie(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        imageUrl: doctor.doctorImage!)
                    : Container(
                        height: MediaQuery.of(context).size.width * 0.3,
                        width: MediaQuery.of(context).size.width * 0.3,
                        color: Theme.of(context).colorScheme.onSurface,
                      )),
            const SizedBox(height: 16.0),
            Text(
              doctor.doctorName,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 8.0),
            Text(
              doctor.clinicName,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: 16.0),
            RRJDoctorInfoCard(
              icon: Assets.icons.iconBriefcase.path,
              title: LocaleKeys.detailDoctorScreen_strNumber.tr(),
              content: doctor.doctorSip,
            ),
            const SizedBox(height: 20.0),
            RRJDoctorInfoCard(
              icon: Assets.icons.iconHeroCheck.path,
              title: LocaleKeys.detailDoctorScreen_sipNumber.tr(),
              content: doctor.doctorStr,
            ),
            const SizedBox(height: 20.0),
            RRJDoctorInfoCard(
              icon: Assets.icons.iconPriceTag.path,
              title: LocaleKeys.detailDoctorScreen_paymentMethod.tr(),
              content: "-",
            ),
            const SizedBox(height: 24.0),
            RRJPrimaryButton(
              onPressed: onChooseDoctor,
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              child: Text(
                LocaleKeys.detailDoctorScreen_chooseDoctor.tr(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
