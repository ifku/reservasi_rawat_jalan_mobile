import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_outlined_button.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_primary_button.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: Assets.images.imageLogin.image(
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.7,
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(36.0),
                  topRight: Radius.circular(36.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 42.0, 16.0, 16.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LocaleKeys.auth_greeting.tr(),
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      Text("Mulai peduli kesehatanmu dengan LoremIpsum",
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.5))),
                      const SizedBox(height: 16),
                      RRJPrimaryButton(
                        onPressed: () {
                          context.goNamed(RouteName.signIn);
                        },
                        height: 44.0,
                        width: MediaQuery.of(context).size.width,
                        child: Text(LocaleKeys.auth_signIn.tr()),
                      ),
                      const SizedBox(height: 12.0),
                      RRJPrimaryButton(
                        onPressed: () {
                          context.goNamed(RouteName.signUp);
                        },
                        height: 44.0,
                        width: MediaQuery.of(context).size.width,
                        backgroundColor:
                            Theme.of(context).colorScheme.surfaceVariant,
                        side: BorderSide.none,
                        child: Text(LocaleKeys.auth_signUp.tr(),
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSurface)),
                      ),
                      const SizedBox(height: 12.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Divider(
                                  thickness: 1,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.5),
                                )),
                            const SizedBox(width: 18.0),
                            Text(LocaleKeys.auth_orContinueWithEmail.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withOpacity(0.5))),
                            const SizedBox(width: 18.0),
                            Expanded(
                                flex: 2,
                                child: Divider(
                                  thickness: 1,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.5),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      RRJOutlinedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Coming soon!"),
                          ));
                        },
                        height: 44.0,
                        width: MediaQuery.of(context).size.width,
                        icon: Assets.icons.iconGoogle.svg(),
                        borderColor:
                            Theme.of(context).colorScheme.surfaceVariant,
                        label: Text(LocaleKeys.auth_signInWithGoogle.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withOpacity(0.5))),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
