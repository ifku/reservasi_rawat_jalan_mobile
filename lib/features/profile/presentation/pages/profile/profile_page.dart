import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_primary_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: RRJPrimaryButton(
      onPressed: () {},
      child: const Text("Logout"),
    )));
  }
}
