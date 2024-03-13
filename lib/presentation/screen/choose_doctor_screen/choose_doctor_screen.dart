import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/common/base_shimmer.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/bottom_sheet/rrj_choose_doctor_bottom_sheet.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/bottom_sheet/show_rrj_bottom_sheet.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/card/rrj_doctor_card.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/choose_doctor_screen/bloc/choose_doctor_bloc.dart';

class ChooseDoctorScreen extends StatefulWidget {
  const ChooseDoctorScreen({super.key, required this.clinicId});

  final String clinicId;

  @override
  State<ChooseDoctorScreen> createState() => _ChooseDoctorScreenState();
}

class _ChooseDoctorScreenState extends State<ChooseDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    if (state is GetDoctorByClinicIdSuccess) {
                      return Text(
                        state.doctor[0].clinicName,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 18),
                BlocBuilder<ChooseDoctorBloc, ChooseDoctorState>(
                  builder: (context, state) {
                    if (state is GetDoctorByClinicIdLoading) {
                      return BaseShimmer(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            height: 130,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      );
                    }
                    if (state is GetDoctorByClinicIdSuccess) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.doctor.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => RRJDoctorCard(
                          doctorName: state.doctor[index].doctorName,
                          doctorClinic: state.doctor[index].clinicName,
                          doctorAge: state.doctor[index].doctorAge,
                          doctorRating:
                              double.parse(state.doctor[index].doctorRating),
                          doctorImage: state.doctor[index].doctorImage,
                          onTap: () => showRRJBottomSheet(context,
                              showDragHandle: false,
                              child: RRJChooseDoctorBottomSheet(
                                doctorName: state.doctor[index].doctorName,
                                doctorSpecialist:
                                    state.doctor[index].clinicName,
                                doctorSIP: state.doctor[index].doctorSip,
                                doctorSTR: state.doctor[index].doctorStr,
                                doctorImage: state.doctor[index].doctorImage,
                                doctorPayment: "",
                                onChooseDoctor: () {},
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
    );
  }

  @override
  void initState() {
    super.initState();
    context
        .read<ChooseDoctorBloc>()
        .add(GetDoctorByClinicId(clinicId: widget.clinicId));
  }
}
