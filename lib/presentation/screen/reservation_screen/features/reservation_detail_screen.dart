import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/style/color.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/button/rrj_primary_button.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/reservation_screen/widgets/reservation_info_item.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/reservation_screen/widgets/reservation_queue_card.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/reservation_screen/widgets/reservation_detail_number.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/reservation_screen/widgets/reservation_qr_card.dart';

class ReservationDetailScreen extends StatefulWidget {
  const ReservationDetailScreen({super.key});

  @override
  State<ReservationDetailScreen> createState() =>
      _ReservationDetailScreenState();
}

class _ReservationDetailScreenState extends State<ReservationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: RRJColors.blueDark,
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 60.0),
                  child: ReservationDetailNumber(),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.56,
              left: 0,
              right: 0,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ReservationQrCard(),
                    ReservationQueueCard(),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.2,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.33,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .shadow
                            .withOpacity(0.05),
                        blurRadius: 2.0,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Informasi Pelayanan",
                              style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(height: 16.0),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReservationInfoItem(
                                      title: "Dokter Pemeriksa",
                                      icon: Assets.icons.iconPerson3.path,
                                      content: "Dr. John Doe"),
                                  const SizedBox(height: 12),
                                  ReservationInfoItem(
                                      title: "Poli Layanan",
                                      icon: Assets.icons.iconLocation.path,
                                      content: "Dokter Umum"),
                                  const SizedBox(height: 12),
                                  ReservationInfoItem(
                                      title: "Nama Pasien",
                                      icon: Assets.icons.iconPerson3.path,
                                      content: "Mochammad Rizky"),
                                ],
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReservationInfoItem(
                                      title: "Jenis Asuransi",
                                      icon: Assets.icons.iconWallet.path,
                                      content: "BPJS"),
                                  const SizedBox(height: 12),
                                  ReservationInfoItem(
                                      title: "Jam Layanan",
                                      icon: Assets.icons.iconClock.path,
                                      content: "00:00"),
                                  const SizedBox(height: 12),
                                  ReservationInfoItem(
                                      title: "Tanggal Pemesanan",
                                      icon: Assets.icons.iconCalendar.path,
                                      content: "14 April 2024"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: MediaQuery.of(context).size.height * 0.1,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: RRJPrimaryButton(
                      width: MediaQuery.of(context).size.width,
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(LocaleKeys.reservationScreen_return.tr())),
                ))
          ],
        ),
      ),
    );
  }
}
