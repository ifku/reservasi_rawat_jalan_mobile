import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/button/rrj_primary_button.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/dialog/rrj_confirmation_dialog.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/dialog/show_rrj_dialog.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/input_field/rrj_input_textfield.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/auth_screen/features/sign-up/bloc/sign_up_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nikController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nikController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            context.goNamed(RouteName.otp, extra: _emailController.text);
          }
          if (state is SignUpFailure) {
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
          if (state is SignUpLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

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
                          RRJInputTextField(
                            label: LocaleKeys.auth_id.tr(),
                            controller: _nikController,
                            keyboardType: TextInputType.number,
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
                              context.read<SignUpBloc>().add(
                                    SignUp(
                                      email: _emailController.text,
                                      nik: _nikController.text,
                                    ),
                                  );
                            },
                            height: 44.0,
                            width: MediaQuery.of(context).size.width,
                            child: Text(LocaleKeys.auth_signUp.tr()),
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  LocaleKeys.auth_haveAnAccount.tr(),
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.goNamed(RouteName.signIn);
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
