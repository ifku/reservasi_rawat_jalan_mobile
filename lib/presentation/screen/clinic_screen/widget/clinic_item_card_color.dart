import 'dart:math';
import 'dart:ui';

import 'package:reservasi_rawat_jalan_mobile/core/style/color.dart';

class ClinicItemCardColor {
  static final List<Color> _clinicCardItemColor = [
    RRJColors.azure200,
    RRJColors.rose200,
    RRJColors.teal200,
    RRJColors.yellow200,
  ];

  static Color getRandomColor() {
    int randomIndex = Random().nextInt(_clinicCardItemColor.length);
    return _clinicCardItemColor[randomIndex];
  }
}
