import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../core/style/color.dart';

class RRJMenuItemCard extends StatelessWidget {
  const RRJMenuItemCard(
      {super.key,
      required this.menuLabel,
      required this.menuDescription,
      this.menuIcon,
      this.onTap,
      this.iconContainerColor});

  final String menuLabel;
  final String menuDescription;
  final String? menuIcon;
  final Color? iconContainerColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: Container(
          padding: const EdgeInsets.all(12.0),
          height: 90.0,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 54.0,
                  width: 54.0,
                  decoration: BoxDecoration(
                    color: iconContainerColor ?? RRJColors.rose400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SvgPicture.asset(
                    menuIcon ?? RRJAssets.icons.iconAppointment1.path,
                    fit: BoxFit.contain,
                  )),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      menuLabel,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontSize: 14,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.7),
                          ),
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      menuDescription,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
