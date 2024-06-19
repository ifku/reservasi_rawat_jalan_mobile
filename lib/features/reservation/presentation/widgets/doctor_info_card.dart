import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';

class DoctorInfoCard extends StatelessWidget {
  const DoctorInfoCard(
      {super.key,
      required this.doctorName,
      required this.doctorClinic,
      this.doctorImage});

  final String doctorName;
  final String doctorClinic;
  final String? doctorImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.05),
              blurRadius: 10,
              blurStyle: BlurStyle.outer,
              offset: const Offset(0, 0),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            doctorImage != null
                ? SizedBox(
                    height: 72,
                    width: 72,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                          placeholder: (context, url) =>
                              Assets.raw.loadingAnim.lottie(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          imageUrl: doctorImage!,
                          fit: BoxFit.cover),
                    ),
                  )
                : Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
            const SizedBox(width: 14.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctorName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        )),
                const SizedBox(height: 8.0),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: doctorClinic,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.5),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
