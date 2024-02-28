import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/clinic_screen/bloc/clinic_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/clinic_screen/widget/clinic_item_card_color.dart';

import '../../../core/gen/assets.gen.dart';
import '../../components/clinic_item/rrj_clinic_item.dart';

class ClinicScreen extends StatefulWidget {
  const ClinicScreen({super.key});

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.clinicScreen_clinicList.tr(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              Text(
                LocaleKeys.clinicScreen_findYourClinic.tr(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 18),
              BlocBuilder<ClinicBloc, ClinicState>(
                builder: (context, state) {
                  log(state.toString());
                  if (state is GetClinicLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is GetClinicFailure) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  if (state is GetClinicSuccess) {
                    return Expanded(
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: 2,
                                  maxCrossAxisExtent: 200),
                          itemCount: state.clinics.length,
                          itemBuilder: (context, index) {
                            return RRJClinicItem(
                              onTap: () {},
                              icon: RRJAssets.icons.iconFetus.path,
                              label: state.clinics.elementAt(index).clinicName,
                              containerColor:
                                  ClinicItemCardColor.getRandomColor(),
                            );
                          }),
                    );
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<ClinicBloc>().add(GetAllClinic());
  }
}
