import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reservasi_rawat_jalan_mobile/core/style/color.dart';

class RRJInputTextField extends StatelessWidget {
  const RRJInputTextField({
    super.key,
    this.hintText,
    this.controller,
    this.onTap,
    this.onChanged,
    this.margin,
    this.autofocus = false,
    this.prefixIcon,
    this.suffixIcon,
    this.label,
    this.labelStyle,
    this.maxLines,
    this.textInputAction,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
    this.isEnabled = true,
    this.textStyle,
    this.height,
    this.cornerRadius,
    this.action,
    this.focusNode,
    this.minLines,
    this.isExpand = true,
    this.isRequired = false,
    this.labelVerticalSpace = 4,
    this.disabledBorder,
    this.isFilled = false,
    this.fillColor,
    this.initialValue,
    this.isFixedHeight = true,
    this.textCapitalization = TextCapitalization.none,
    this.autocorrect = false,
    this.contentPadding,
    this.borderColor = RRJColors.grey500,
    this.focusedBorderColor = RRJColors.grey500,
    this.maxLength,
    this.counterText = '',
    this.validator,
  }) : assert(
          obscureText == true && maxLines == 1 || obscureText == false,
          'maxLines must be 1 if obscureText is true',
        );
  final String? hintText;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final EdgeInsetsGeometry? margin;
  final bool autofocus;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? label;
  final TextStyle? labelStyle;
  final int? maxLines;
  final int? minLines;
  final double? height;
  final double? cornerRadius;
  final bool readOnly;
  final bool isEnabled;
  final bool obscureText;
  final bool isExpand;
  final bool isRequired;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final Widget? action;
  final FocusNode? focusNode;
  final double labelVerticalSpace;
  final InputBorder? disabledBorder;
  final bool isFilled;
  final Color? fillColor;
  final String? initialValue;
  final bool isFixedHeight;
  final bool autocorrect;
  final TextCapitalization textCapitalization;
  final EdgeInsetsGeometry? contentPadding;
  final Color borderColor;
  final Color focusedBorderColor;
  final int? maxLength;
  final String? counterText;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: label ?? '',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.7)),
                    children: [
                      if (isRequired)
                        TextSpan(
                          text: ' *',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                        ),
                    ],
                  ),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                if (action != null) action!,
              ],
            ),
            SizedBox(height: labelVerticalSpace),
          ],
          if (isFixedHeight)
            SizedBox(
              height: height ?? 44,
              child: TextFormField(
                onTap: onTap,
                validator: validator,
                focusNode: focusNode,
                maxLines: maxLines,
                initialValue: initialValue,
                autofocus: autofocus,
                textCapitalization: textCapitalization,
                autocorrect: autocorrect,
                minLines: minLines,
                controller: controller,
                textInputAction: textInputAction,
                keyboardType: keyboardType,
                readOnly: readOnly,
                enabled: isEnabled,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                obscureText: obscureText,
                style: textStyle,
                maxLength: maxLength,
                expands: isExpand,
                decoration: InputDecoration(
                  hintText: hintText,
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  disabledBorder: disabledBorder,
                  counterText: counterText,
                  hintStyle: textStyle?.copyWith(
                        color: RRJColors.grey500,
                      ) ??
                      const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: RRJColors.grey500,
                      ),
                  contentPadding: contentPadding ??
                      const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                  filled: isFilled,
                  fillColor: fillColor,
                  enabled: isEnabled,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(cornerRadius ?? 8),
                    borderSide: BorderSide(
                      width: 1,
                      color: focusedBorderColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(cornerRadius ?? 8),
                    borderSide: BorderSide(
                      width: 1,
                      color: borderColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(cornerRadius ?? 8),
                    borderSide: BorderSide(
                      width: 1,
                      color: borderColor,
                    ),
                  ),
                ),
                onChanged: onChanged,
              ),
            )
          else
            TextFormField(
              onTap: onTap,
              validator: validator,
              focusNode: focusNode,
              maxLines: maxLines,
              initialValue: initialValue,
              autofocus: autofocus,
              minLines: minLines,
              controller: controller,
              textInputAction: textInputAction,
              keyboardType: keyboardType,
              readOnly: readOnly,
              enabled: isEnabled,
              obscureText: obscureText,
              style: textStyle,
              expands: isExpand,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                disabledBorder: disabledBorder,
                hintStyle: textStyle?.copyWith(
                      color: RRJColors.grey500,
                    ) ??
                    const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: RRJColors.grey500,
                    ),
                contentPadding: contentPadding ??
                    const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 8,
                    ),
                filled: isFilled,
                fillColor: fillColor,
                enabled: isEnabled,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(cornerRadius ?? 8),
                  borderSide: BorderSide(
                    width: 1,
                    color: focusedBorderColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(cornerRadius ?? 8),
                  borderSide: BorderSide(
                    width: 1,
                    color: borderColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(cornerRadius ?? 8),
                  borderSide: BorderSide(
                    width: 1,
                    color: borderColor,
                  ),
                ),
              ),
              onChanged: onChanged,
            ),
        ],
      ),
    );
  }
}
