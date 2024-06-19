import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_primary_button.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/dialog/rrj_info_dialog.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/dialog/rrj_show_loading.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/dialog/show_rrj_dialog.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/input_field/rrj_input_textfield.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/presentation/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            hideRRJLoading(context);
            context.goNamed(RouteName.otp, extra: {
              "email": _emailController.text,
            });
          }
          if (state is SignInLoading) {
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
          if (state is SignInFailure) {
            hideRRJLoading(context);
            showRRJDialog(
              context,
              child: RRJInfoDialog(
                  title: "Error",
                  message: state.error,
                  iconColor: Theme.of(context).colorScheme.error,
                  icon: Assets.icons.iconError.path),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  child: Assets.images.imageRegister.image(
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.7,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(36.0),
                      topRight: Radius.circular(36.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 42.0, 16.0, 36.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.auth_greeting.tr(),
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Mulai peduli kesehatanmu dengan LoremIpsum",
                            maxLines: 2,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withOpacity(0.5),
                                    ),
                          ),
                          const SizedBox(height: 16),
                          RRJInputTextField(
                            label: LocaleKeys.auth_email.tr(),
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            borderColor: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.2),
                            focusedBorderColor: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.5),
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 16),
                          RRJPrimaryButton(
                            onPressed: () {
                              context
                                  .read<SignInBloc>()
                                  .add(SignIn(email: _emailController.text));
                            },
                            height: 44.0,
                            width: MediaQuery.of(context).size.width,
                            child: Text(LocaleKeys.auth_signIn.tr()),
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  LocaleKeys.auth_dontHaveAnAccount.tr(),
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.goNamed(RouteName.signUp);
                                  },
                                  child: Text(
                                    LocaleKeys.auth_here.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
