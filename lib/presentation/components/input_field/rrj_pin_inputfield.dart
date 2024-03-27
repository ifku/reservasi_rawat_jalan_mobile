import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/fonts.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/style/color.dart';
import 'package:reservasi_rawat_jalan_mobile/core/utils/string_extensions.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/button/rrj_primary_button.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/input_field/rrj_pin_textfield.dart';

class RRJPinInputField extends StatefulWidget {
  const RRJPinInputField({
    super.key,
    this.padding,
    this.crossAxisAlignment,
    this.textAlign,
    this.title,
    this.subtitle,
    this.expiredLabel,
    required this.sendDestination,
    this.onResendCode,
    this.onCompleted,
    this.onChanged,
    this.isEnabled = true,
    this.isObscure = false,
    this.autofocus = true,
    this.cooldownDuration,
    this.enableCooldown = false,
    this.resendLabel,
    this.resendText,
    this.validator,
    this.submitButtonLabel,
    this.titleStyle,
    this.expiredLabelStyle,
    this.resendLabelStyle,
    this.sendDestinationStyle,
    this.subtitleStyle,
    this.submitButtonHeight,
    this.pinPrimaryColor,
    this.pinLength = 5,
    this.pinFillColor,
    this.initialCoolingDown = false,
    this.pinSubmitBackgroundColor,
  });

  final EdgeInsetsGeometry? padding;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextAlign? textAlign;
  final String? title;
  final String? subtitle;
  final String? expiredLabel;
  final String sendDestination;
  final ValueChanged<String>? onResendCode;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onChanged;
  final bool isEnabled;
  final bool isObscure;
  final bool autofocus;
  final Duration? cooldownDuration;
  final bool enableCooldown;
  final String? resendLabel;
  final String? resendText;
  final String? Function(String?)? validator;
  final String? submitButtonLabel;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final TextStyle? expiredLabelStyle;
  final TextStyle? resendLabelStyle;
  final TextStyle? sendDestinationStyle;
  final double? submitButtonHeight;
  final Color? pinPrimaryColor;
  final Color? pinFillColor;
  final int pinLength;
  final bool initialCoolingDown;
  final Color? pinSubmitBackgroundColor;

  @override
  State<RRJPinInputField> createState() => _RRJPinInputFieldState();
}

class _RRJPinInputFieldState extends State<RRJPinInputField> {
  late final TextEditingController _pinController;
  late final GlobalKey<FormState> _formKey;
  late final String displayedSendDestination;
  late bool _isCoolingdown;

  @override
  void initState() {
    super.initState();
    _isCoolingdown = widget.initialCoolingDown;
    _formKey = GlobalKey<FormState>();
    _pinController = TextEditingController();
    displayedSendDestination = widget.isObscure
        ? widget.sendDestination.obfuscateLastCharacters(5)
        : widget.sendDestination;
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment:
            widget.crossAxisAlignment ?? CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: widget.subtitle ?? 'We have sent a code to ',
                    style: widget.subtitleStyle ??
                        Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: displayedSendDestination,
                  style: widget.sendDestinationStyle ??
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                ),
              ],
            ),
            style: widget.subtitleStyle ??
                Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.sfPro,
                    ),
            textAlign: widget.textAlign ?? TextAlign.left,
          ),
          if (widget.enableCooldown) ...[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.expiredLabel ?? 'This code will expired in ',
                  style: widget.expiredLabelStyle ??
                      Theme.of(context).textTheme.bodyMedium,
                  textAlign: widget.textAlign ?? TextAlign.left,
                ),
                TweenAnimationBuilder<int>(
                  tween: IntTween(
                      begin: widget.cooldownDuration?.inSeconds, end: 0),
                  duration:
                      widget.cooldownDuration ?? const Duration(seconds: 0),
                  onEnd: () {
                    setState(() {
                      _isCoolingdown = false;
                    });
                  },
                  builder: (context, value, child) {
                    return Text(
                      '$value'.convertSecondsToMinutesAndSeconds(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      textAlign: widget.textAlign ?? TextAlign.left,
                    );
                  },
                ),
              ],
            ),
          ],
          const SizedBox(height: 14),
          Align(
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: RRJPinTextField(
                pinController: _pinController,
                isAutofocus: widget.autofocus,
                pinLength: widget.pinLength,
                borderColor: Colors.transparent,
                pinFillColor:
                    Theme.of(context).colorScheme.surfaceVariant.withOpacity(1),
                fillColor: widget.pinFillColor ??
                    Theme.of(context).colorScheme.background,
                primaryColor: widget.pinPrimaryColor ??
                    Theme.of(context).colorScheme.primary,
                onCompleted: (value) {
                  if (_formKey.currentState?.validate() == true) {
                    widget.onCompleted?.call(value);
                  }
                },
                isObscure: widget.isObscure,
                onChanged: widget.onChanged,
                isEnabled: widget.isEnabled,
                validator: widget.validator,
                errorBuilder: (message, p1) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        message ?? "Error",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.error,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 18),
          RRJPrimaryButton(
            backgroundColor: widget.pinSubmitBackgroundColor,
            width: MediaQuery.sizeOf(context).width,
            height: widget.submitButtonHeight,
            onPressed: () {
              if (_formKey.currentState?.validate() == true) {
                widget.onCompleted?.call(_pinController.text);
              }
            },
            child: Text(widget.submitButtonLabel ?? 'VERIFY'),
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.resendLabel ?? "Didn't receive the code?",
                  style: widget.resendLabelStyle ??
                      Theme.of(context).textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: _isCoolingdown
                      ? null
                      : () {
                          widget.onResendCode?.call(widget.sendDestination);
                          setState(() {
                            _isCoolingdown = true;
                          });
                        },
                  child: _isCoolingdown
                      ? TweenAnimationBuilder<int>(
                          tween: IntTween(
                              begin: widget.cooldownDuration?.inSeconds,
                              end: 0),
                          duration: widget.cooldownDuration ??
                              const Duration(seconds: 0),
                          onEnd: () {
                            setState(() {
                              _isCoolingdown = false;
                            });
                          },
                          builder: (context, value, child) {
                            return Text(
                              '$value'.convertSecondsToMinutesAndSeconds(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: RRJColors.grey400,
                                  ),
                              textAlign: TextAlign.left,
                            );
                          },
                        )
                      : Text(
                          widget.resendText ?? "Resend Code",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
