import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_primary_button.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';

class CurrentReservationPage extends StatefulWidget {
  const CurrentReservationPage({super.key});

  @override
  State<CurrentReservationPage> createState() => _CurrentReservationPageState();
}

class _CurrentReservationPageState extends State<CurrentReservationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.onSurface,
          title: Text("Reservasi",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: 18.0, fontWeight: FontWeight.w600))),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                Text("Belum Ada Reservasi",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 18.0, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8.0),
                Text(
                  "Anda belum memesan layanan. \n Silakan mulai untuk melanjutkan penjadwalan",
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
                  onPressed: () {
                    context.pushNamed(RouteName.currentReservationDetail);
                  },
                  height: 44.0,
                  width: MediaQuery.of(context).size.width,
                  child: const Text("LAKUKAN RESERVASI"),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
