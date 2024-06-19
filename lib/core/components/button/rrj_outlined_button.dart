import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/style/color.dart';

class RRJOutlinedButton extends OutlinedButton {
  RRJOutlinedButton({
    super.key,
    required super.onPressed,
    required super.child,
    Color? foregroundColor,
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    Color borderColor = RRJColors.grey300,
    Color? shadowColor = const Color.fromARGB(60, 24, 24, 27),
    double elevation = 0,
    double borderWidth = 1,
    double? height,
    double? width,
    double? cornerRadius,
    EdgeInsetsGeometry? padding,
  }) : super(
          style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.transparent,
            foregroundColor: foregroundColor ?? RRJColors.blue500,
            side: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: BorderStyle.solid,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cornerRadius ?? 5),
            ),
            padding: padding,
            fixedSize: width != null
                ? Size(width, height ?? 40)
                : Size.fromHeight(height ?? 40),
            splashFactory: InkSparkle.splashFactory,
            elevation: elevation,
            shadowColor: shadowColor,
            surfaceTintColor: Colors.transparent,
          ),
        );

  factory RRJOutlinedButton.icon({
    Key? key,
    required VoidCallback? onPressed,
    required Widget icon,
    required Widget label,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    Color? borderColor,
    Color? shadowColor,
    double? elevation,
    double? borderWidth,
    double? height,
    double? width,
    double? cornerRadius,
    EdgeInsetsGeometry? padding,
  }) = _RRJOutlinedButtonWithIcon;
}

class _RRJOutlinedButtonWithIcon extends RRJOutlinedButton {
  _RRJOutlinedButtonWithIcon({
    super.key,
    required super.onPressed,
    required Widget icon,
    required Widget label,
    super.backgroundColor,
    super.foregroundColor,
    super.disabledBackgroundColor,
    super.disabledForegroundColor,
    Color? borderColor,
    Color? shadowColor,
    double? elevation,
    double? borderWidth,
    double? width,
    super.height,
    super.cornerRadius,
    super.padding,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(width: 8),
              label,
            ],
          ),
          width: width ?? 250,
          borderColor: borderColor ?? RRJColors.grey300,
          shadowColor: shadowColor ?? const Color.fromARGB(60, 24, 24, 27),
          elevation: elevation ?? 0,
          borderWidth: borderWidth ?? 1,
        );
}
