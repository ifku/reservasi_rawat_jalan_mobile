import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/fonts.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/style/color.dart';

class RRJPinTextField extends StatelessWidget {
  const RRJPinTextField({
    super.key,
    this.pinController,
    this.primaryColor,
    this.fillColor,
    this.borderColor,
    this.focusNode,
    this.errorColor,
    this.validator,
    this.onChanged,
    this.onCompleted,
    this.pinLength = 6,
    this.textInputAction = TextInputAction.done,
    this.errorBuilder,
    this.isObscure = false,
    this.isAutofocus = false,
    this.obscuringWidget,
    this.obscuringCharacter = '•',
    this.separatorBuilder,
    this.pinSize = const Size(64, 72),
    this.cornerRadius,
    this.isEnabled = true,
    this.pinFillColor
  });

  final TextEditingController? pinController;
  final Color? primaryColor;
  final Color? fillColor;
  final Color? borderColor;
  final Color? errorColor;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;
  final int pinLength;
  final TextInputAction textInputAction;
  final Widget Function(String?, String)? errorBuilder;
  final bool isAutofocus;
  final bool isObscure;
  final bool isEnabled;
  final Widget? obscuringWidget;
  final String obscuringCharacter;
  final Widget Function(int)? separatorBuilder;
  final Size pinSize;
  final double? cornerRadius;
  final Color? pinFillColor;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: pinSize.width,
      height: pinSize.height,
      textStyle: const TextStyle(
        fontSize: 22,
        fontFamily: FontFamily.sfPro,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius ?? 8),
        border: Border.all(color: borderColor ?? RRJColors.grey400),
        color: pinFillColor ?? Theme.of(context).colorScheme.background
      ),
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        controller: pinController,
        focusNode: focusNode,
        androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
        listenForMultipleSmsOnAndroid: true,
        defaultPinTheme: defaultPinTheme,
        validator: validator,
        hapticFeedbackType: HapticFeedbackType.mediumImpact,
        onCompleted: onCompleted,
        length: pinLength,
        onChanged: onChanged,
        pinAnimationType: PinAnimationType.fade,
        enableIMEPersonalizedLearning: true,
        enabled: isEnabled,
        textInputAction: textInputAction,
        errorBuilder: errorBuilder,
        closeKeyboardWhenCompleted: true,
        keyboardType: TextInputType.number,
        obscureText: isObscure,
        obscuringWidget: obscuringWidget,
        obscuringCharacter: obscuringCharacter,
        autofocus: isAutofocus,
        separatorBuilder:
            separatorBuilder ?? (index) => const SizedBox(width: 14),
        cursor: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 9),
              width: 22,
              height: 1,
              color: primaryColor ?? Theme.of(context).primaryColor,
            ),
          ],
        ),
        focusedPinTheme: defaultPinTheme.copyWith(
          textStyle: defaultPinTheme.textStyle!.copyWith(
            color: primaryColor ?? Theme.of(context).colorScheme.primary,
          ),
          decoration: defaultPinTheme.decoration!.copyWith(
            color: fillColor,
            border: Border.all(
              color: primaryColor ?? Theme.of(context).colorScheme.primary,
            ),
            boxShadow: [
              BoxShadow(
                color: primaryColor?.withOpacity(0.1) ?? Colors.transparent,
                blurRadius: 0,
                spreadRadius: 3,
                offset: const Offset(0, 0),
              ),
              BoxShadow(
                color: primaryColor?.withOpacity(0.05) ?? Colors.transparent,
                blurRadius: 2,
                spreadRadius: 0,
                offset: const Offset(0, 1),
              ),
            ],
          ),
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(
              color: primaryColor ?? Theme.of(context).colorScheme.primary,
            ),
            color: fillColor,
          ),
        ),
        errorPinTheme: defaultPinTheme.copyBorderWith(
          border: Border.all(color: errorColor ?? RRJColors.rose500),
        ),
        disabledPinTheme: defaultPinTheme.copyWith(
          textStyle: defaultPinTheme.textStyle!.copyWith(
            color: RRJColors.grey400,
          ),
          decoration: defaultPinTheme.decoration!.copyWith(
            color: RRJColors.grey100,
            border: Border.all(
              color: borderColor ?? RRJColors.grey400,
            ),
          ),
        ),
      ),
    );
  }
}
