import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/input_field/rrj_pin_inputfield.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, this.email});

  final String? email;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Assets.images.imageOtp.svg(
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    'Kode OTP',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Kode OTP telah dikirimkan ke email Anda. Mohon periksa kotak masuk Anda dan masukkan kode tersebut di sini untuk melanjutkan',
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.6),
                        ),
                  ),
                  const SizedBox(height: 14),
                  RRJPinInputField(
                    sendDestination: widget.email ?? "",
                    submitButtonHeight: 44.0,
                    initialCoolingDown: true,
                    subtitle: LocaleKeys.auth_otpSendCode.tr(),
                    resendLabel: LocaleKeys.auth_otpDidntReceive.tr(),
                    resendText: LocaleKeys.auth_otpResendCode.tr(),
                    submitButtonLabel: LocaleKeys.auth_otpVerify.tr(),
                    padding: EdgeInsets.zero,
                    onChanged: (value) {},
                    onCompleted: (value) {
                      context.goNamed(RouteName.home);
                    },
                    cooldownDuration: const Duration(seconds: 60),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
