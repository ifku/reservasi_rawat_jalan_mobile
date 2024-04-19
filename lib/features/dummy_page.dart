import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/card/rrj_reservation_list_card.dart';

class DummyPage extends StatefulWidget {
  const DummyPage({super.key});

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: RRJReservationListCard(
          id: 'A00000',
          doctorName: "dr. John Doe",
          clinic: "Dokter Bedah",
          patientName: "Sugeng",
          date: "14 April 2023",
          serviceHour: "00.00 - 00:00",
        ),
      ),
    );
  }
}
