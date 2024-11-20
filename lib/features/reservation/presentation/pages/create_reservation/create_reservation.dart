import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/bottom_sheet/show_rrj_bottom_sheet.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_primary_button.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/dialog/rrj_confirmation_dialog.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/dialog/rrj_info_dialog.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/dialog/rrj_show_loading.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/dialog/show_rrj_dialog.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/input_field/rrj_input_textfield.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/switch/rrj_text_switch.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/text/rrj_vertical_text.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';
import 'package:reservasi_rawat_jalan_mobile/core/utils/date_formatter.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/doctor_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/pages/create_reservation/bloc/create_reservation/create_reservation_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/pages/create_reservation/bloc/create_reservation_action/create_reservation_action_cubit.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/widgets/doctor_info_card.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/widgets/patien_search.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateReservationPage extends StatefulWidget {
  const CreateReservationPage(
      {super.key, required this.doctor, required this.date});

  final DoctorEntity doctor;
  final DateTime date;

  @override
  State<CreateReservationPage> createState() => _CreateReservationPageState();
}

class _CreateReservationPageState extends State<CreateReservationPage> {
  final TextEditingController _patientController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _patientIdController = TextEditingController();
  final TextEditingController _patientSearchController =
      TextEditingController();
  final DateRangePickerController _datePickerController =
      DateRangePickerController();

  @override
  void initState() {
    super.initState();
    log("Selected Date ${widget.date}");
    _dateController.text = DateFormatter.formatDateTime(widget.date);
    context.read<CreateReservationBloc>().add(const FetchPatientData());
  }

  @override
  void dispose() {
    _patientController.dispose();
    _dateController.dispose();
    _patientSearchController.dispose();
    _datePickerController.dispose();
    _patientIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<CreateReservationBloc, CreateReservationState>(
            listener: (context, state) {
              if (state is FetchPatientDataSuccess) {
                _patientIdController.text = state.patientData[0].idPatient;
                _patientController.text = state.patientData[0].patientFullname;
              }
              if (state is CreateReservationLoading) {
                showRRJLoading(
                  context,
                  loadingWidget: Center(
                    child: Assets.raw.loadingAnim.lottie(),
                  ),
                );
              }
              if (state is CreateReservationSuccess) {
                hideRRJLoading(context);
                showRRJDialog(
                  context,
                  barrierDismissible: false,
                  child: RRJInfoDialog(
                    title: LocaleKeys.createReservation_reservationSuccess.tr(),
                    message: LocaleKeys
                        .createReservation_reservationSavedMessage
                        .tr(),
                    closeButtonColor: Theme.of(context).colorScheme.secondary,
                    buttonTitle: LocaleKeys.createReservation_backToHome.tr(),
                    onClose: () {
                      context.goNamed(RouteName.home);
                    },
                    icon: Assets.icons.iconCheck.svg(
                      height: 96,
                      width: 96,
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.createReservation_reservationDetail.tr(),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        LocaleKeys
                            .createReservation_selectTheDayAndDateForTheAppointment
                            .tr(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.5)),
                      ),
                      const SizedBox(height: 16),
                      DoctorInfoCard(
                        doctorName: widget.doctor.doctorName,
                        doctorClinic: widget.doctor.clinicName,
                        doctorImage: widget.doctor.doctorImage,
                      ),
                      const SizedBox(height: 36.0),
                      Container(
                        height: 210,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .colorScheme
                                    .shadow
                                    .withOpacity(0.05),
                                blurRadius: 10,
                                blurStyle: BlurStyle.outer,
                                offset: const Offset(0, 0),
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RRJInputTextField(
                                  controller: _patientController,
                                  label:
                                      LocaleKeys.createReservation_patient.tr(),
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  onTap: () {
                                    showRRJBottomSheet(context,
                                        showDragHandle: false,
                                        child: SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 16.0,
                                                left: 16.0,
                                                bottom: 36.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Center(
                                                  child: Text(
                                                    LocaleKeys
                                                        .createReservation_patientDetail
                                                        .tr(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                const Divider(thickness: 1),
                                                const SizedBox(height: 16.0),
                                                ListView(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  children: [
                                                    RRJVerticalText(
                                                      title: LocaleKeys
                                                          .createReservation_fullname
                                                          .tr(),
                                                      value: state
                                                              is FetchPatientDataSuccess
                                                          ? state.patientData[0]
                                                              .patientFullname
                                                          : "-",
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 16),
                                                    ),
                                                    RRJVerticalText(
                                                      title: LocaleKeys
                                                          .createReservation_email
                                                          .tr(),
                                                      value: state
                                                              is FetchPatientDataSuccess
                                                          ? state.patientData[0]
                                                              .patientPhone
                                                          : "-",
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 16),
                                                    ),
                                                    RRJVerticalText(
                                                      title: LocaleKeys
                                                          .createReservation_phoneNumber
                                                          .tr(),
                                                      value: state
                                                              is FetchPatientDataSuccess
                                                          ? state.patientData[0]
                                                              .patientPhone
                                                          : "-",
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 16),
                                                    ),
                                                  ],
                                                ),
                                                BlocBuilder<
                                                    CreateReservationActionCubit,
                                                    CreateReservationActionState>(
                                                  builder: (context, state) {
                                                    return RRJTextSwitch(
                                                      label: LocaleKeys
                                                          .createReservation_addAsPatient
                                                          .tr(),
                                                      value: state
                                                              is AddAsPatient
                                                          ? state.isAddAsPatient
                                                          : true,
                                                      onChanged: (value) {
                                                        context
                                                            .read<
                                                                CreateReservationActionCubit>()
                                                            .addAsPatientChanged(
                                                                value);
                                                      },
                                                    );
                                                  },
                                                ),
                                                const SizedBox(height: 16.0),
                                                const Divider(
                                                    thickness: 1, height: 1),
                                                const SizedBox(height: 8.0),
                                                BlocBuilder<
                                                    CreateReservationActionCubit,
                                                    CreateReservationActionState>(
                                                  builder: (context, state) {
                                                    bool isAddAsPatient = state
                                                            is AddAsPatient
                                                        ? state.isAddAsPatient
                                                        : true;
                                                    if (isAddAsPatient) {
                                                      return RRJInputTextField(
                                                          controller:
                                                              _patientController,
                                                          label: LocaleKeys
                                                              .createReservation_patient
                                                              .tr(),
                                                          readOnly: true,
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                          borderColor: Theme.of(
                                                                  context)
                                                              .colorScheme
                                                              .onSurface
                                                              .withOpacity(0.3),
                                                          focusedBorderColor:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onSurface
                                                                  .withOpacity(
                                                                      0.5),
                                                          suffixIcon: Icon(
                                                            Icons
                                                                .person_rounded,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .onSurface
                                                                .withOpacity(
                                                                    0.4),
                                                          ));
                                                    }
                                                    return PatientSearch(
                                                        patientSearchController:
                                                            _patientSearchController,
                                                        onChanged: (id, name) {
                                                          _patientIdController
                                                              .text = id;
                                                          _patientController
                                                              .text = name;
                                                        });
                                                  },
                                                ),
                                                const SizedBox(height: 20.0),
                                                RRJPrimaryButton(
                                                    height: 48,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    onPressed: () {
                                                      _patientController
                                                          .text = state
                                                              is FetchPatientDataSuccess
                                                          ? state.patientData[0]
                                                              .patientFullname
                                                          : "-";
                                                      _patientIdController
                                                          .text = state
                                                              is FetchPatientDataSuccess
                                                          ? state.patientData[0]
                                                              .idPatient
                                                          : "-";
                                                      context.pop();
                                                    },
                                                    child: Text(LocaleKeys
                                                        .createReservation_choosePatient
                                                        .tr()))
                                              ],
                                            ),
                                          ),
                                        ));
                                  },
                                  readOnly: true,
                                  borderColor: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.3),
                                  focusedBorderColor: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.5),
                                  suffixIcon: Icon(
                                    Icons.person_rounded,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withOpacity(0.4),
                                  )),
                              const SizedBox(height: 16),
                              RRJInputTextField(
                                controller: _dateController,
                                label: LocaleKeys.createReservation_date.tr(),
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                                readOnly: true,
                                borderColor: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.3),
                                focusedBorderColor: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.5),
                                suffixIcon: Icon(
                                  Icons.calendar_month_rounded,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      RRJPrimaryButton(
                        height: 48,
                        width: MediaQuery.of(context).size.width,
                        onPressed: () {
                          context.read<CreateReservationBloc>().add(
                                CreateReservation(
                                  reservationInsuranceType: "Personal",
                                  reservationDate: DateFormatter.parseDateTime(
                                    _dateController.text,
                                  ),
                                  patientId: _patientIdController.text,
                                  doctorId: widget.doctor.idDoctor,
                                ),
                              );
                        },
                        child: Text(
                            LocaleKeys.createReservation_makeReservation.tr()),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

Future<bool> _onWillPop(BuildContext context) async {
  bool? shouldExit = await showRRJDialog<bool>(
    context,
    barrierDismissible: false,
    child: RRJConfirmationDialog(
      title: LocaleKeys.createReservation_cancelReservation.tr(),
      message: LocaleKeys.createReservation_cancelReservationMessage.tr(),
      icon: Assets.icons.iconTrash.svg(
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.error,
          BlendMode.srcIn,
        ),
        height: 96,
        width: 96,
      ),
      onSubmit: () {
        Navigator.pop(context, true);
      },
      onCancel: () {
        Navigator.pop(context, false);
      },
    ),
  );

  return shouldExit ?? false;
}
