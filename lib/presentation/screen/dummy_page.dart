import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/bottom_sheet/show_rrj_bottom_sheet.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/bottom_sheet/rrj_choose_doctor_bottom_sheet.dart';

class DummyPage extends StatefulWidget {
  const DummyPage({Key? key}) : super(key: key);

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              showRRJBottomSheet(
                context,
                showDragHandle: false,
                child: const RRJChooseDoctorBottomSheet(
                  doctorName: 'dr. Navis Nasrullah',
                  doctorSpecialist: 'General Doctor',
                  doctorSIP: '64822947393297',
                  doctorSTR: '320374527291',
                  doctorImage: "https://images.unsplash.com/photo-1537368910025-700350fe46c7?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  doctorPayment: 'Umum, Asuransi, BPJS',
                ),
              );
            },
            child: const Text("Show bottom sheet"),
          ),
        ),
      ),
    );
  }
}
