import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_primary_button.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/dialog/show_rrj_dialog.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/style/color.dart';
import 'package:reservasi_rawat_jalan_mobile/core/utils/date_formatter.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/domain/entities/reservation_detail_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/presentation/pages/current_reservation_detail/bloc/reservation_detail_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/presentation/widgets/reservation_detail_number.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/presentation/widgets/reservation_header_card.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/presentation/widgets/reservation_info_item.dart';

class CurrentReservationDetailPage extends StatefulWidget {
  final ReservationDetailEntity reservationDetail;

  const CurrentReservationDetailPage(
      {super.key, required this.reservationDetail});

  @override
  State<CurrentReservationDetailPage> createState() =>
      _CurrentReservationDetailPageState();
}

class _CurrentReservationDetailPageState
    extends State<CurrentReservationDetailPage> {

  @override
  void initState() {
    super.initState();
    context.read<ReservationDetailBloc>().add(
      ListenToQueueNumber(widget.reservationDetail.doctorId),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
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
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 60.0),
                  child: ReservationDetailNumber(
                    reservationId: widget.reservationDetail.idReservation,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.56,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: BlocBuilder<ReservationDetailBloc, ReservationDetailState>(
                  builder: (context, state) {
                    String currentQueueEstimation = "...";
                    if (state is QueueNumberUpdated) {
                      currentQueueEstimation = state.queueNumber.toString();
                    } else if (state is ReservationDetailError) {
                      currentQueueEstimation = "Error";
                    }

                    return ReservationHeaderCard(
                      currentQueueNumber: widget.reservationDetail.queueNumber.toString(),
                      currentQueueEstimation: currentQueueEstimation,
                    );
                  },
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
                          Text(
                              LocaleKeys
                                  .reservationScreen_reservationInformation
                                  .tr(),
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
                                      content:
                                          widget.reservationDetail.doctorName),
                                  const SizedBox(height: 12),
                                  ReservationInfoItem(
                                    title: "Poli Layanan",
                                    icon: Assets.icons.iconLocation.path,
                                    content:
                                        widget.reservationDetail.clinicName,
                                  ),
                                  const SizedBox(height: 12),
                                  ReservationInfoItem(
                                    title: "Nama Pasien",
                                    icon: Assets.icons.iconPerson3.path,
                                    content: widget
                                        .reservationDetail.patientFullName,
                                  ),
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
                                    content: widget.reservationDetail
                                        .reservationInsuranceType,
                                  ),
                                  const SizedBox(height: 12),
                                  ReservationInfoItem(
                                    title: "Status Layanan",
                                    icon: Assets.icons.iconClock.path,
                                    content: widget.reservationDetail.reservationStatus
                                  ),
                                  const SizedBox(height: 12),
                                  ReservationInfoItem(
                                    title: "Tanggal Pemesanan",
                                    icon: Assets.icons.iconCalendar.path,
                                    content: DateFormatter.formatDateTime(
                                      widget.reservationDetail.reservationDate,
                                    ),
                                  ),
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
              bottom: MediaQuery.of(context).size.height * 0.12,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: RRJPrimaryButton(
                  height: 48.0,
                  width: MediaQuery.of(context).size.width,
                  onPressed: () {
                    showRRJDialog(
                      context,
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              QrImageView(
                                data: widget.reservationDetail.idReservation,
                                version: QrVersions.auto,
                                errorStateBuilder: (cxt, err) {
                                  return Container(
                                    child: Center(
                                      child: Text(
                                        'Uh oh! Something went wrong...',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 14.0),
                              RRJPrimaryButton(
                                height: 48.0,
                                width: MediaQuery.of(context).size.width,
                                foregroundColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                side:
                                    const BorderSide(color: Colors.transparent),
                                onPressed: () {
                                  context.pop();
                                },
                                child: Text(
                                  LocaleKeys.reservationScreen_return.tr(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    LocaleKeys.reservationScreen_scanCode.tr(),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.04,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: RRJPrimaryButton(
                  height: 48.0,
                  width: MediaQuery.of(context).size.width,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  backgroundColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                  side: const BorderSide(color: Colors.transparent),
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    LocaleKeys.reservationScreen_return.tr(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
