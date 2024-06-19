import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/widgets/doctor_item_shimmer.dart';

class DummyPage extends StatefulWidget {
  const DummyPage({super.key});

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: Center(child: DoctorItemShimmer()),
    );
  }
}
