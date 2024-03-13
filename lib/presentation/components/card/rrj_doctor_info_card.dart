import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RRJDoctorInfoCard extends StatelessWidget {
  const RRJDoctorInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
  });

  final String icon;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onSurface, BlendMode.srcIn),
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: 16.0),
            Wrap(
              direction: Axis.vertical,
              children: [
                Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w400)),
                const SizedBox(height: 4.0),
                Text(content, style: Theme.of(context).textTheme.bodyMedium)
              ],
            )
          ],
        ),
      ),
    );
  }
}
