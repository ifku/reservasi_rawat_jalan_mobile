import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../core/style/color.dart';

class RRJDoctorScheduleCard extends StatelessWidget {
  const RRJDoctorScheduleCard(
      {super.key,
      required this.doctorName,
      required this.doctorSchedule,
      required this.doctorTime,
      this.doctorImage,
      this.onTap});

  final String doctorName;
  final String doctorSchedule;
  final String doctorTime;
  final String? doctorImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(12.0),
        height: 120,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
                blurRadius: 10,
                blurStyle: BlurStyle.outer,
                offset: const Offset(0, 4),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              doctorImage != null
                  ? SizedBox(
                      height: 84,
                      width: 84,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                            imageUrl: doctorImage!, fit: BoxFit.cover),
                      ),
                    )
                  : Container(
                      height: 84,
                      width: 84,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
              const SizedBox(width: 14.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LocaleKeys.homeScreen_appointment.tr(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelLarge),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        RRJAssets.icons.iconPerson2.path,
                        color: RRJColors.grey200,
                        height: 12,
                      ),
                      const SizedBox(width: 6.0),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: doctorName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: RRJColors.grey200,
                                      fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        RRJAssets.icons.iconCalendar.path,
                        color: RRJColors.grey200,
                        height: 12,
                      ),
                      const SizedBox(width: 6.0),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: doctorSchedule,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: RRJColors.grey200,
                                      fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        RRJAssets.icons.iconClock.path,
                        color: RRJColors.grey200,
                        height: 12,
                      ),
                      const SizedBox(width: 6.0),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: doctorTime,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: RRJColors.grey200,
                                      fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                ],
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios,
                  color: RRJColors.grey200, size: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
