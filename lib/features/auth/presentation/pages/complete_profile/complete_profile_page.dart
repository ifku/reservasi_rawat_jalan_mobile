import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_primary_button.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key});

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () => context.goNamed(RouteName.home),
                  child: const Text("Lewati"),
                ),
              ],
            ),
            const Spacer(),
            RRJPrimaryButton(
              width: MediaQuery.of(context).size.width,
              onPressed: () {},
              child: const Text(
                "Complete Profile",
              ),
            ),
          ],
        ),
      )),
    );
  }
}
