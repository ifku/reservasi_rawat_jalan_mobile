import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:reservasi_rawat_jalan_mobile/core/style/theme.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/clinic_screen/bloc/clinic_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/clinic_screen/clinic_screen.dart';
import 'package:reservasi_rawat_jalan_mobile/locator.dart';

import 'core/gen/codegen_loader.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupServiceLocator();
  await dotenv.load(fileName: ".env");
  runApp(EasyLocalization(
      path: 'assets/langs',
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('id', 'ID'),
      ],
      fallbackLocale: const Locale('id', 'ID'),
      assetLoader: const CodegenLoader(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClinicBloc(
        locator(),
      ),
      child: MaterialApp(
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        title: 'Reservasi Rawat Jalan',
        debugShowCheckedModeBanner: false,
        theme: RRJThemeData.lightTheme,
        darkTheme: RRJThemeData.darkTheme,
        home: const ClinicScreen(),
      ),
    );
  }
}
