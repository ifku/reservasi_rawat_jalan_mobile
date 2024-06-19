import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_outlined_button.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';
import 'package:reservasi_rawat_jalan_mobile/features/profile/presentation/widgets/profile_menu_item_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Positioned(
                top: 0,
                left: 16.0,
                right: 16.0,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.icons.iconUser.svg(
                          width: 84.0,
                          height: 84.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Muhammad Navis Nasrullah",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                  ),
                            ),
                            const SizedBox(height: 8.0),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Text(
                                    "21 Tahun",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface
                                              .withOpacity(0.5),
                                        ),
                                  ),
                                  VerticalDivider(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withOpacity(0.5),
                                    thickness: 1,
                                  ),
                                  Text(
                                    "Laki-laki",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface
                                              .withOpacity(0.5),
                                        ),
                                  ),
                                  VerticalDivider(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withOpacity(0.5),
                                    thickness: 1,
                                  ),
                                  Text(
                                    "Mahasiswa",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface
                                              .withOpacity(0.5),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            RRJOutlinedButton(
                                width: MediaQuery.of(context).size.width * 0.4,
                                onPressed: () {
                                  context.goNamed(RouteName.detailAccount);
                                },
                                borderColor:
                                    Theme.of(context).colorScheme.primary,
                                child: Text(
                                  "Lihat Profile",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 172.0,
                right: 16.0,
                left: 16.0,
                child: Column(
                  children: [
                    ProfileMenuItem(
                      icon: Assets.icons.iconUserGroup2.svg(
                        width: 28.0,
                        height: 28.0,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.5),
                          BlendMode.srcIn,
                        ),
                      ),
                      title: 'Daftar Keluarga',
                      onTap: () {},
                    ),
                    const SizedBox(height: 16.0),
                    ProfileMenuItem(
                      icon: Assets.icons.iconNotes.svg(
                        width: 28.0,
                        height: 28.0,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.5),
                          BlendMode.srcIn,
                        ),
                      ),
                      title: 'Rekam Medis',
                      onTap: () {},
                    ),
                    const SizedBox(height: 16.0),
                    ProfileMenuItem(
                      icon: Assets.icons.iconLogout.svg(
                        width: 24.0,
                        height: 24.0,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.5),
                          BlendMode.srcIn,
                        ),
                      ),
                      title: 'Keluar',
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
