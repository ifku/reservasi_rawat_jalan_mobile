import 'package:intl/intl.dart';

abstract class DateFormatter {
  static String formatDateTime(DateTime dateTime,
      {String format = 'EEEE, dd MMMM yyyy'}) {
    return DateFormat(format).format(dateTime);
  }

  static String formatDay(DateTime dateTime) {
    return DateFormat('EEEE').format(dateTime);
  }

  static String formatMinute(DateTime dateTime) {
    return DateFormat('mm').format(dateTime);
  }

  static String formatHour(DateTime dateTime) {
    return DateFormat('HH::mm').format(dateTime);
  }
}
