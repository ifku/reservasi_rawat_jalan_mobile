import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/base_shimmer.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/bottom_sheet/rrj_choose_doctor_bottom_sheet.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/bottom_sheet/show_rrj_bottom_sheet.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/card/rrj_doctor_card.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/pages/choose_doctor/bloc/choose_doctor_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/widgets/doctor_item_shimmer.dart';

class ChooseDoctorPage extends StatefulWidget {
  const ChooseDoctorPage(
      {super.key, required this.clinicId, required this.date});

  final String clinicId;
  final DateTime date;

  @override
  State<ChooseDoctorPage> createState() => _ChooseDoctorPageState();
}

class _ChooseDoctorPageState extends State<ChooseDoctorPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<ChooseDoctorBloc>()
        .add(GetDoctorByClinicId(clinicId: widget.clinicId, date: widget.date));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<ChooseDoctorBloc>().add(
                  GetDoctorByClinicId(
                    clinicId: widget.clinicId,
                    date: widget.date,
                  ),
                );
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<ChooseDoctorBloc, ChooseDoctorState>(
                    builder: (context, state) {
                      if (state is GetDoctorByClinicIdLoading) {
                        return BaseShimmer(
                          child: Container(
                            height: 24,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      }
                      if (state is GetDoctorByClinicIdFailed) {
                        return Text(
                          state.message,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        );
                      }
                      if (state is GetDoctorByClinicIdSuccess) {
                        if (state.doctor.isEmpty) {
                          return Text(
                            LocaleKeys.chooseDoctorScreen_doctorNotFound.tr(),
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                          );
                        }
                        return Text(
                          state.doctor[0].clinicName,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  const SizedBox(height: 8),
                  Text(
                    LocaleKeys.chooseDoctorScreen_findDoctor.tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  const SizedBox(height: 18),
                  BlocBuilder<ChooseDoctorBloc, ChooseDoctorState>(
                    builder: (context, state) {
                      if (state is GetDoctorByClinicIdLoading) {
                        return const DoctorItemShimmer();
                      }
                      if (state is GetDoctorByClinicIdSuccess) {
                        if (state.doctor.isEmpty) {
                          return Align(
                            child: Text(
                              LocaleKeys.chooseDoctorScreen_doctorNotFound.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                            ),
                          );
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.doctor.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => RRJDoctorCard(
                            doctor: state.doctor[index],
                            onTap: () => showRRJBottomSheet(context,
                                showDragHandle: false,
                                child: RRJChooseDoctorBottomSheet(
                                  doctor: state.doctor[index],
                                  onChooseDoctor: () {
                                    context.pushNamed(
                                      RouteName.createReservation,
                                      extra: {
                                        'doctor': state.doctor[index],
                                        'date': widget.date.toIso8601String(),
                                      },
                                    );
                                  },
                                )),
                            margin: const EdgeInsets.only(bottom: 16),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
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
