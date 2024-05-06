import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/bottom_sheet/show_rrj_bottom_sheet.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/date_picker/rrj_date_picker.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/input_field/rrj_input_textfield.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/widgets/doctor_info_card.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateReservationPage extends StatefulWidget {
  const CreateReservationPage({super.key});

  @override
  State<CreateReservationPage> createState() => _CreateReservationPageState();
}

class _CreateReservationPageState extends State<CreateReservationPage> {
  final TextEditingController _patientController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final DateRangePickerController _datePickerController =
  DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.createReservation_reservationDetail.tr(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    LocaleKeys
                        .createReservation_selectTheDayAndDateForTheAppointment
                        .tr(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5)),
                  ),
                  const SizedBox(height: 16),
                  const DoctorInfoCard(
                    doctorName: "Tes",
                    doctorClinic: "Klinik Umum",
                  ),
                  const SizedBox(height: 36.0),
                  Container(
                    height: 190,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .surface,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Theme
                                .of(context)
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
                              label: LocaleKeys.createReservation_patient.tr(),
                              onTap: () {
                                showRRJBottomSheet(context, child: Container());
                              },
                              readOnly: true,
                              borderColor: Theme
                                  .of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.3),
                              focusedBorderColor: Theme
                                  .of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.5),
                              suffixIcon: Icon(
                                Icons.person_rounded,
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.4),
                              )),
                          const SizedBox(height: 16),
                          RRJInputTextField(
                              controller: _dateController,
                              label: LocaleKeys.createReservation_date.tr(),
                              onTap: () {
                                showRRJBottomSheet(
                                  context,
                                  showDragHandle: false,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Center(
                                        child: Text(
                                          LocaleKeys
                                              .createReservation_reservationDate
                                              .tr(),
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const Divider(thickness: 1),
                                      const SizedBox(height: 16.0),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0),
                                        child: Text(
                                            LocaleKeys
                                                .createReservation_selectDate
                                                .tr(),
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                              fontWeight: FontWeight.w600,
                                            )),
                                      ),
                                      const SizedBox(height: 16.0),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: RRJDatePicker(
                                            controller: _datePickerController,
                                            backgroundColor: Theme
                                                .of(context)
                                                .colorScheme
                                                .onSurface
                                                .withOpacity(0.1),
                                            headerStyle: Theme
                                                .of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                            specialDays: const []),
                                      )
                                    ],
                                  ),
                                );
                              },
                              readOnly: true,
                              borderColor: Theme
                                  .of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.3),
                              focusedBorderColor: Theme
                                  .of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.5),
                              suffixIcon: Icon(
                                Icons.calendar_month_rounded,
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.4),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
