import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_primary_button.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';

class ReservationConfirmation extends StatelessWidget {
  const ReservationConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
      children: <Widget>[
        RRJPrimaryButton(
            child:
                Text(LocaleKeys.reservationConfirmationScreen_backToHome.tr()))
      ],
    ))));
  }
}
