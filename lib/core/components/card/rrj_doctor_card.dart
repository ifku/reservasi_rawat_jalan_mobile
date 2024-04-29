import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/style/color.dart';

class RRJDoctorCard extends StatelessWidget {
  const RRJDoctorCard(
      {super.key,
      required this.doctorName,
      required this.doctorClinic,
      required this.doctorAge,
      required this.doctorRating,
      this.doctorImage,
      this.onTap,
      this.margin});

  final String doctorName;
  final String doctorClinic;
  final int doctorAge;
  final double doctorRating;
  final String? doctorImage;
  final EdgeInsetsGeometry? margin;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: Container(
        margin: margin,
        height: 120,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
                blurRadius: 0.1,
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
                            placeholder: (context, url) => Assets.raw.loadingAnim.lottie(),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctorName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 12.0),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: doctorClinic,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: RRJColors.grey200,
                                  fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: "  |  ",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: RRJColors.grey200,
                                  fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: "$doctorAge ${LocaleKeys.chooseDoctorScreen_years.tr()}",
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
                  const SizedBox(height: 4.0),
                  Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Assets.icons.iconStar.svg(
                        colorFilter: const ColorFilter.mode(
                            RRJColors.yellow500, BlendMode.srcIn),
                        height: 18,
                      ),
                      const SizedBox(width: 4.0),
                      Text(doctorRating.toString(),
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: RRJColors.grey200,
                                    fontWeight: FontWeight.w400,
                                  )),
                    ],
                  ),
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
