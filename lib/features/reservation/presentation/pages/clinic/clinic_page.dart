import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/bottom_sheet/show_rrj_bottom_sheet.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/clinic_item/rrj_clinic_item.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/pages/clinic/bloc/clinic_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/widgets/select_date_bottom_sheet.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ClinicPage extends StatefulWidget {
  const ClinicPage({super.key});

  @override
  State<ClinicPage> createState() => _ClinicPageState();
}

class _ClinicPageState extends State<ClinicPage> {
  final TextEditingController _dateController = TextEditingController();
  final DateRangePickerController _datePickerController =
      DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.clinicScreen_clinicList.tr(),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocBuilder<ClinicBloc, ClinicState>(
                builder: (context, state) {
                  if (state is GetClinicLoading) {
                    return Expanded(child: Assets.raw.loadingAnim.lottie());
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
                            maxCrossAxisExtent: 200,
                          ),
                          itemCount: state.clinics.length,
                          itemBuilder: (context, index) {
                            return RRJClinicItem(
                              onTap: () {
                                showRRJBottomSheet(
                                  context,
                                  showDragHandle: false,
                                  child: SelectDateBottomSheet(
                                    datePickerController: _datePickerController,
                                    dateController: _dateController,
                                    onSubmit: () {
                                      context.goNamed(
                                        RouteName.clinicDoctorList,
                                        extra: {
                                          'clinicId': state.clinics
                                              .elementAt(index)
                                              .idClinic,
                                          'date':
                                              _datePickerController.selectedDate?.toIso8601String()
                                        },
                                      );
                                    },
                                  ),
                                );
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
