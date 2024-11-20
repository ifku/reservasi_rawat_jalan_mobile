import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_primary_button.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';

class RRJInfoDialog extends StatelessWidget {
  const RRJInfoDialog({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
    this.buttonTitle,
    this.contentPadding,
    this.onClose,
    this.closeButtonColor,
    this.buttonTextColor,
    this.cancelBorderColor,
  });

  final String title;
  final String message;
  final String? buttonTitle;
  final Widget icon;
  final EdgeInsetsGeometry? contentPadding;
  final Color? closeButtonColor;
  final Color? buttonTextColor;
  final Color? cancelBorderColor;
  final void Function()? onClose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: contentPadding ?? const EdgeInsets.all(14.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Adjust height based on content
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                maxLines: 2,
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
                      child: RRJPrimaryButton(
                        onPressed: onClose ?? () => Navigator.of(context).pop(),
                        disabledBackgroundColor: closeButtonColor ??
                            Theme.of(context).colorScheme.error,
                        disabledForegroundColor:
                            Theme.of(context).colorScheme.onError,
                        backgroundColor: closeButtonColor ??
                            Theme.of(context).colorScheme.error,
                        child: Text(
                          buttonTitle ?? LocaleKeys.dialog_close.tr(),
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: buttonTextColor ??
                                        Theme.of(context).colorScheme.onError,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
