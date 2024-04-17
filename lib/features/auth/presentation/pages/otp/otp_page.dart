import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/dialog/rrj_confirmation_dialog.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/dialog/rrj_show_loading.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/dialog/show_rrj_dialog.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/input_field/rrj_pin_inputfield.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/presentation/pages/otp/bloc/otp_bloc.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, this.email});

  final String? email;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<OtpBloc, OtpState>(
          listener: (context, state) {
            if (state is VerifyOtpSuccess) {
              hideRRJLoading(context);
              context.goNamed(RouteName.home);
            }
            if (state is UserProfileIncomplete) {
              hideRRJLoading(context);
              context.goNamed(RouteName.completeProfile);
            }
            if (state is VerifyOtpLoading) {
              showRRJLoading(context,
                  barrierDismissible: true,
                  overlayColor:
                      Theme.of(context).colorScheme.surface.withOpacity(0.5),
                  loadingWidget: Assets.raw.loadingAnim.lottie(
                    height: 500,
                    width: 500,
                    alignment: Alignment.center,
                  ));
            }
            if (state is VerifyOtpFailure) {
              hideRRJLoading(context);
              showRRJDialog(
                context,
                child: RRJConfirmationDialog(
                    title: "Error",
                    message: state.error,
                    iconColor: Theme.of(context).colorScheme.error,
                    icon: Assets.icons.iconError.path),
              );
            }
          },
          builder: (context, state) {
            return Center(
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
                        LocaleKeys.auth_otpCode.tr(),
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        LocaleKeys.auth_otpCodeSent.tr(),
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
                          log("value $value");
                          context.read<OtpBloc>().add(
                                ValidateOtp(
                                  email: widget.email ?? "",
                                  otp: value,
                                ),
                              );
                        },
                        cooldownDuration: const Duration(seconds: 60),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
