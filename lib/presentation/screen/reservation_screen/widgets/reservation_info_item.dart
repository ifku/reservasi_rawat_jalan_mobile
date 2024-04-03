import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReservationInfoItem extends StatelessWidget {
  const ReservationInfoItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.content});

  final String title;
  final String icon;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
              ),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            SvgPicture.asset(icon,
                height: 18.0,
                width: 18.0,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onSurface, BlendMode.srcIn)),
            const SizedBox(width: 4.0),
            Text(content, style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
      ],
    );
  }
}
