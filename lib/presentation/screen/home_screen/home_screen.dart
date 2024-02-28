import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/card/rrj_menu_item_card.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/home_screen/widget/home_menu_item_data.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Halo, Ifku Syoba!"),
              SizedBox(height: 12),
              Text("Apa yang ingin kamu lakukan hari ini? "),
              SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 100,
                  crossAxisCount: 2,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return RRJMenuItemCard(
                      menuLabel: HomeMenuItemData.getLabel(index),
                      menuDescription: HomeMenuItemData.getDescription(index),
                      menuIcon: HomeMenuItemData.getIcon(index),
                      iconContainerColor: HomeMenuItemData.getColor(index),
                      onTap: () {});
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
