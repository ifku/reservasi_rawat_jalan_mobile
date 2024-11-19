import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_primary_button.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/date_picker/rrj_date_picker.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/utils/date_formatter.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/pages/create_reservation/bloc/create_reservation_action/create_reservation_action_cubit.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SelectDateBottomSheet extends StatelessWidget {
  const SelectDateBottomSheet({
    super.key,
    required DateRangePickerController datePickerController,
    required TextEditingController dateController,
    required this.onSubmit,
  })  : _datePickerController = datePickerController,
        _dateController = dateController;

  final DateRangePickerController _datePickerController;
  final TextEditingController _dateController;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            LocaleKeys.createReservation_reservationDate.tr(),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Divider(thickness: 1),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(LocaleKeys.createReservation_selectDate.tr(),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              )),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RRJDatePicker(
            controller: _datePickerController,
            isEnablePastDates: false,
            initialSelectedDate: DateTime.now(),
            backgroundColor:
            Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            headerStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            specialDays: const [],
            onSelectionChanged: (date) {
              context
                  .read<CreateReservationActionCubit>()
                  .selectedDateChanged(date.value);
            },
          ),
        ),
        const SizedBox(height: 16.0),
        const Divider(thickness: 1),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0),
          child: BlocBuilder<CreateReservationActionCubit,
              CreateReservationActionState>(
            builder: (context, state) {
              return Text(
                  state is SelectedDate
                      ? DateFormatter.formatDateTime(state.selectedDate)
                      : DateFormatter.formatDateTime(DateTime.now()),
                  style: Theme.of(context).textTheme.bodyLarge);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: RRJPrimaryButton(
            height: 48.0,
            width: MediaQuery.of(context).size.width,
            onPressed: () {
              _dateController.text = DateFormatter.formatDateTime(
                  _datePickerController.selectedDate!);
              onSubmit();
            },
            child: Text(LocaleKeys.createReservation_selectDate.tr()),
          ),
        ),
      ],
    );
  }
}
