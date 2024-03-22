import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/button/rrj_primary_button.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/card/rrj_user_info_card.dart';

class DetailProfileScreen extends StatefulWidget {
  const DetailProfileScreen({super.key});

  @override
  State<DetailProfileScreen> createState() => _DetailProfileScreenState();
}

class _DetailProfileScreenState extends State<DetailProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 36.0, 18.0, 16.0),
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Assets.icons.iconInformation.svg(
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  const SizedBox(width: 14.0),
                  Expanded(
                    child: Text(
                      LocaleKeys.detailProfileScreen_completeInformation.tr(),
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.5),
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              RRJUserInfoCard(
                nik: '35183625289374932',
                fullName: 'Muhammad Navis Nasrullah',
                email: 'muhnavis@gmail.com',
                phoneNumber: '081234536753234',
                dateOfBirth: DateTime.parse('1999-12-12'),
                gender: true,
                address: 'Jalan. Gebang Lor  No.73. Sukolilo. Surabaya. 61485',
                occupation: 'Pelajar/Mahasiswa',
              ),
              const SizedBox(height: 24.0),
              RRJPrimaryButton(
                onPressed: () {},
                height: 48.0,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  LocaleKeys.detailProfileScreen_save.tr(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
