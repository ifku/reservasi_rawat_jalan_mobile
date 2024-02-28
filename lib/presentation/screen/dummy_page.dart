import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/card/rrj_menu_item_card.dart';

import '../../core/gen/assets.gen.dart';

class DummyPage extends StatefulWidget {
  const DummyPage({super.key});

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RRJMenuItemCard(
          menuLabel: 'label',
          menuDescription: 'description',
          menuIcon: RRJAssets.icons.iconIdcard.path,
        ),
      ),
    );
  }
}
