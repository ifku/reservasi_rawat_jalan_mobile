import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_primary_button.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/card/rrj_reservation_list_card.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';
import 'package:reservasi_rawat_jalan_mobile/features/current_reservation/presentation/pages/current_reservation/bloc/current_reservation_bloc.dart';

class CurrentReservationPage extends StatefulWidget {
  const CurrentReservationPage({super.key});

  @override
  State<CurrentReservationPage> createState() => _CurrentReservationPageState();
}

class _CurrentReservationPageState extends State<CurrentReservationPage> {
  @override
  void initState() {
    super.initState();
    context.read<CurrentReservationBloc>().add(const GetCurrentReservation(
        patientId: '0dbdbfc0-c881-44e5-b460-7ee48566bf3a'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.onSurface,
          title: Text(LocaleKeys.reservationScreen_reservation.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: 18.0, fontWeight: FontWeight.w600))),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocConsumer<CurrentReservationBloc, CurrentReservationState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is CurrentReservationLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CurrentReservationAvailable) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: state.data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return RRJReservationListCard(
                      id: state.data[index].idReservation.substring(10),
                      date: state.data[index].reservationDate
                          .toString()
                          .substring(10),
                      patientName: state.data[index].patientFullName,
                      clinic: state.data[index].clinicName,
                      serviceHour: state.data[index].reservationStatus,
                      doctorName: state.data[index].doctorName,
                      onPressed: () {
                        context.pushNamed(RouteName.currentReservationDetail);
                      },
                    );
                  },
                ),
              );
            }
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Assets.images.imageAttendance.svg(
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 16.0),
                    Text(LocaleKeys.reservationScreen_noReservation.tr(),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 18.0, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8.0),
                    Text(
                      LocaleKeys.reservationScreen_noBook.tr(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.5),
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                    const SizedBox(height: 24),
                    RRJPrimaryButton(
                      onPressed: () {},
                      height: 44.0,
                      width: MediaQuery.of(context).size.width,
                      child:
                          Text(LocaleKeys.activityScreen_makeAReservation.tr()),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
