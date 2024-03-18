import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/clinic_screen/bloc/clinic_bloc.dart';

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
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
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
                  if (state is GetClinicLoading) {
                    return Expanded(
                        child: Lottie.asset(RRJAssets.raw.loadingAnim.path));
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
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: 2,
                                  maxCrossAxisExtent: 200),
                          itemCount: state.clinics.length,
                          itemBuilder: (context, index) {
                            return RRJClinicItem(
                              onTap: () {
                                context.goNamed(RouteName.clinicDoctorList,
                                    extra: state.clinics
                                        .elementAt(index)
                                        .idClinic);
                              },
                              icon: state.clinics.elementAt(index).clinicIcon,
                              label: state.clinics.elementAt(index).clinicName,
                              containerColor:
                                  Theme.of(context).colorScheme.surface,
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
