import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/style/color.dart';

class RRJPrimaryButton extends ElevatedButton {
  RRJPrimaryButton(
      {super.key,
      required super.onPressed,
      required super.child,
      Color? backgroundColor,
      Color? foregroundColor,
      Color? disabledBackgroundColor,
      Color? disabledForegroundColor,
      Color? shadowColor,
      double elevation = 0,
      double? height,
      double? width,
      EdgeInsetsGeometry? padding,
      BorderSide? side,
      OutlinedBorder? shape,
      InteractiveInkFeatureFactory? splashFactory})
      : super(
            style: ElevatedButton.styleFrom(
          side: side ??
              BorderSide(
                color: backgroundColor ?? Colors.transparent,
                width: 1,
                style: BorderStyle.solid,
              ),
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
          padding: padding,
          fixedSize: width != null
              ? Size(width, height ?? 40)
              : Size.fromHeight(height ?? 40),
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          disabledBackgroundColor: disabledBackgroundColor ?? RRJColors.grey100,
          disabledForegroundColor: disabledForegroundColor ?? RRJColors.grey400,
          splashFactory: splashFactory ?? InkSparkle.splashFactory,
          foregroundColor: foregroundColor,
        ));

  factory RRJPrimaryButton.icon({
    Key? key,
    required VoidCallback? onPressed,
    required Widget icon,
    required Widget label,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    Color? shadowColor,
    double? elevation,
    double? height,
    double? width,
    EdgeInsetsGeometry? padding,
    BorderSide? side,
    OutlinedBorder? shape,
    InteractiveInkFeatureFactory? splashFactory,
  }) = _RRJPrimaryButtonWithIcon;
}

class _RRJPrimaryButtonWithIcon extends RRJPrimaryButton {
  _RRJPrimaryButtonWithIcon({
    super.key,
    required super.onPressed,
    required Widget icon,
    required Widget label,
    super.backgroundColor,
    super.foregroundColor,
    super.disabledBackgroundColor,
    super.disabledForegroundColor,
    super.shadowColor,
    double? elevation,
    super.height,
    super.width,
    super.padding,
    super.side,
    super.shape,
    super.splashFactory,
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
          elevation: elevation ?? 0,
        );
}
