import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/date_picker/special_day.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/fonts.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/style/color.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class RRJDatePicker extends StatelessWidget {
  const RRJDatePicker(
      {super.key,
      required this.controller,
      this.onSelectionChanged,
      required this.specialDays,
      this.primaryColor,
      this.specialDatesColor,
      this.weekendColor,
      this.secondaryColor,
      this.backgroundColor,
      this.height,
      this.width,
      this.isEnablePastDates = true,
      this.minimumDate,
      this.maximumDate,
      this.selectableDayPredicate,
      this.initialSelectedDate,
      this.initialSelectedDates,
      this.initialDisplayDate,
      this.selectionMode = DateRangePickerSelectionMode.single,
      this.elevation = 0,
      this.cornerRadius = 12,
      this.headerSize,
      this.monthViewHeaderSize,
      this.textSize,
      this.specialDaySize,
      this.viewHeaderHeight,
      this.locale,
      this.textColor,
      this.rangeTextColor,
      this.selectedTextColor,
      this.headerStyle});

  final DateRangePickerController controller;
  final void Function(
      DateRangePickerSelectionChangedArgs
          dateRangePickerSelectionChangedArgs)? onSelectionChanged;
  final List<SpecialDay> specialDays;
  final Color? primaryColor;
  final Color? specialDatesColor;
  final Color? weekendColor;
  final Color? secondaryColor;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final bool isEnablePastDates;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final DateTime? initialSelectedDate;
  final List<DateTime>? initialSelectedDates;
  final DateTime? initialDisplayDate;
  final bool Function(DateTime)? selectableDayPredicate;
  final DateRangePickerSelectionMode selectionMode;
  final double elevation;
  final double cornerRadius;
  final double? headerSize;
  final double? viewHeaderHeight;
  final double? monthViewHeaderSize;
  final double? textSize;
  final Color? textColor;
  final Color? rangeTextColor;
  final Color? selectedTextColor;
  final double? specialDaySize;
  final TextStyle? headerStyle;
  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? MediaQuery.sizeOf(context).height * 0.5,
      width: width ?? MediaQuery.sizeOf(context).width,
      child: Card(
        color: backgroundColor ?? RRJColors.grey100,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 8.0,
            left: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: SfDateRangePicker(
                  onSelectionChanged: onSelectionChanged,
                  enablePastDates: isEnablePastDates,
                  controller: controller,
                  initialSelectedDates: initialSelectedDates,
                  initialDisplayDate: initialDisplayDate,
                  initialSelectedDate: initialSelectedDate,
                  minDate: minimumDate,
                  maxDate: maximumDate,
                  toggleDaySelection: true,
                  selectableDayPredicate: selectableDayPredicate,
                  selectionMode: selectionMode,
                  selectionShape: DateRangePickerSelectionShape.rectangle,
                  headerStyle: DateRangePickerHeaderStyle(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    textStyle: headerStyle ??
                        Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: headerSize ?? 17,
                              letterSpacing: -0.41,
                            ),
                  ),
                  navigationMode: DateRangePickerNavigationMode.snap,
                  navigationDirection:
                      DateRangePickerNavigationDirection.horizontal,
                  showNavigationArrow: true,
                  selectionColor:
                      primaryColor ?? Theme.of(context).colorScheme.primary,
                  startRangeSelectionColor:
                      primaryColor ?? Theme.of(context).colorScheme.primary,
                  endRangeSelectionColor:
                      primaryColor ?? Theme.of(context).colorScheme.primary,
                  rangeSelectionColor:
                      secondaryColor ?? Theme.of(context).colorScheme.secondary,
                  todayHighlightColor:
                      primaryColor ?? Theme.of(context).colorScheme.primary,
                  selectionTextStyle: TextStyle(
                    color: selectedTextColor,
                    fontSize: textSize ?? 14,
                  ),
                  rangeTextStyle: TextStyle(
                    color: rangeTextColor,
                    fontSize: textSize ?? 14,
                  ),
                  monthViewSettings: DateRangePickerMonthViewSettings(
                    viewHeaderStyle: DateRangePickerViewHeaderStyle(
                      textStyle: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5),
                        fontSize: monthViewHeaderSize ?? 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    dayFormat: 'EEE',
                    viewHeaderHeight: viewHeaderHeight ?? 48,
                    showTrailingAndLeadingDates: true,
                    specialDates: specialDays
                        .map((specialDay) => DateTime(
                            specialDay.year, specialDay.month, specialDay.day))
                        .toList(),
                  ),
                  monthCellStyle: DateRangePickerMonthCellStyle(
                    todayTextStyle: TextStyle(
                      color:
                          primaryColor ?? Theme.of(context).colorScheme.primary,
                      fontSize: textSize ?? 14,
                      fontWeight: FontWeight.w500,
                    ),
                    trailingDatesTextStyle: TextStyle(
                      fontSize: textSize ?? 14,
                      fontWeight: FontWeight.w500,
                    ),
                    disabledDatesTextStyle: TextStyle(
                      fontSize: textSize ?? 14,
                      fontWeight: FontWeight.w500,
                    ),
                    leadingDatesTextStyle: TextStyle(
                      fontSize: textSize ?? 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textStyle: TextStyle(
                      color:
                          textColor ?? Theme.of(context).colorScheme.onSurface,
                      fontSize: textSize ?? 14,
                      fontWeight: FontWeight.w500,
                    ),
                    weekendTextStyle: TextStyle(
                      color:
                          weekendColor ?? Theme.of(context).colorScheme.primary,
                      fontSize: textSize ?? 14,
                      fontWeight: FontWeight.w500,
                    ),
                    blackoutDateTextStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: textSize ?? 14,
                      fontWeight: FontWeight.w500,
                    ),
                    specialDatesTextStyle: TextStyle(
                      color: specialDatesColor ??
                          Theme.of(context).colorScheme.primary,
                      fontSize: textSize ?? 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  yearCellStyle: DateRangePickerYearCellStyle(
                    todayTextStyle: TextStyle(
                      color:
                          primaryColor ?? Theme.of(context).colorScheme.primary,
                      fontSize: textSize ?? 14,
                      fontWeight: FontWeight.w500,
                    ),
                    disabledDatesTextStyle: TextStyle(
                      fontSize: textSize ?? 14,
                      fontWeight: FontWeight.w500,
                    ),
                    leadingDatesTextStyle: TextStyle(
                      fontSize: textSize ?? 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textStyle: TextStyle(
                      color:
                          textColor ?? Theme.of(context).colorScheme.onSurface,
                      fontSize: textSize ?? 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              if (specialDays.isNotEmpty) ...[
                SizedBox(
                  height: 20,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final specialDay = specialDays[index];
                      return Text(
                        '${specialDay.day} ${specialDay.holidayName}',
                        overflow: TextOverflow.ellipsis,
                        locale: locale,
                        style: TextStyle(
                          fontFamily: FontFamily.sfPro,
                          color: RRJColors.grey400,
                          fontSize: specialDaySize ?? 13,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '•',
                        style: TextStyle(
                          fontFamily: FontFamily.sfPro,
                          color: RRJColors.grey400,
                          fontSize: specialDaySize ?? 13,
                        ),
                      ),
                    ),
                    itemCount: specialDays.length,
                  ),
                ),
              ],
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
