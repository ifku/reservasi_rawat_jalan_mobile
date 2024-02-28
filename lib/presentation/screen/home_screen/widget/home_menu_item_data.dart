import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/style/color.dart';

import '../../../../core/gen/assets.gen.dart';

class HomeMenuItemData {
  static final List<Map<String, dynamic>> _homeMenuItemData = [
    {
      'color': RRJColors.rose400,
      'icon': RRJAssets.icons.iconAppointment1.path,
      'label': LocaleKeys.homeScreen_appointment.tr(),
      'description': LocaleKeys.homeScreen_doReservationHere.tr(),
    },
    {
      'color': RRJColors.yellow400,
      'icon': RRJAssets.icons.iconAppointment2.path,
      'label': LocaleKeys.homeScreen_doctorSchedule.tr(),
      'description': LocaleKeys.homeScreen_seeDoctorSchedule.tr(),
    },
    {
      'color': RRJColors.teal400,
      'icon': RRJAssets.icons.iconMeeting.path,
      'label': LocaleKeys.homeScreen_queue.tr(),
      'description': LocaleKeys.homeScreen_seeQueueHere.tr(),
    },
    {
      'color': RRJColors.azure400,
      'icon': RRJAssets.icons.iconIdcard.path,
      'label': LocaleKeys.homeScreen_insurance.tr(),
      'description': LocaleKeys.chooseDoctorScreen_paymentMethod.tr(),
    },
  ];

  static Color getColor(int index) {
    return _homeMenuItemData[index]['color'];
  }

  static String getIcon(int index) {
    return _homeMenuItemData[index]['icon'];
  }

  static String getLabel(int index) {
    return _homeMenuItemData[index]['label'];
  }

  static String getDescription(int index) {
    return _homeMenuItemData[index]['description'];
  }
}
