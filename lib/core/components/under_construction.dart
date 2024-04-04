import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';

class UnderConstruction extends StatelessWidget {
  const UnderConstruction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        direction: Axis.vertical,
        children: [
            Assets.raw.underConstructionAnim.lottie(
              width: 200,
              height: 200,
            ),
          const SizedBox(height: 20),
          Text(LocaleKeys.common_underConstruction.tr(),
              style: Theme.of(context).textTheme.headlineSmall)
        ],
      ),
    );
  }
}
