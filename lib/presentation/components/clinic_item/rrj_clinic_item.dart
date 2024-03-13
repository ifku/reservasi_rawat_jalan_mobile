import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/style/color.dart';

class RRJClinicItem extends StatelessWidget {
  const RRJClinicItem(
      {super.key,
      required this.icon,
      required this.label,
      this.containerColor,
      required this.onTap});

  final String icon;
  final String label;
  final Color? containerColor;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          color: containerColor ?? RRJColors.grey500,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
              blurRadius: 1,
              blurStyle: BlurStyle.outer,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 37,
                width: 37,
                decoration: const BoxDecoration(
                    color: RRJColors.white, shape: BoxShape.circle),
                child: Center(
                  child: SvgPicture.network(
                    icon,
                    height: 28,
                    width: 28,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
