import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_outlined_button.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_primary_button.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';

class RRJConfirmationDialog extends StatelessWidget {
  const RRJConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
    this.iconColor,
    this.contentPadding,
    this.onSubmit,
    this.onCancel,
    this.submitButtonColor,
    this.cancelTextColor,
    this.cancelBorderColor,
    this.submitButtonTitle,
    this.cancelButtonTitle,
  });

  final String title;
  final String message;
  final String icon;
  final Color? iconColor;
  final EdgeInsetsGeometry? contentPadding;
  final Color? submitButtonColor;
  final Color? cancelTextColor;
  final Color? cancelBorderColor;
  final String? submitButtonTitle;
  final String? cancelButtonTitle;
  final void Function()? onSubmit;
  final void Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 250.0,
      padding: contentPadding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            fit: BoxFit.contain,
            colorFilter: iconColor != null
                ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                : null,
            width: 76.0,
            height: 76.0,
          ),
          const SizedBox(height: 16),
          Text(title,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  )),
          const SizedBox(height: 8),
          Text(
            message,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                    child: RRJOutlinedButton(
                  onPressed: onCancel ?? () => context.pop(),
                  foregroundColor:
                      cancelTextColor ?? Theme.of(context).colorScheme.error,
                  borderColor:
                      cancelBorderColor ?? Theme.of(context).colorScheme.error,
                  child: Text(
                    LocaleKeys.dialog_cancel.tr(),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                  ),
                )),
                const SizedBox(width: 16.0),
                Expanded(
                    child: RRJPrimaryButton(
                  onPressed: onSubmit,
                  disabledBackgroundColor:
                      submitButtonColor ?? Theme.of(context).colorScheme.error,
                  disabledForegroundColor:
                      Theme.of(context).colorScheme.onError,
                  backgroundColor:
                      submitButtonColor ?? Theme.of(context).colorScheme.error,
                  child: Text(
                    submitButtonTitle ?? LocaleKeys.dialog_yes.tr(),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onError,
                        ),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
