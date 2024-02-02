import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/home_screen/home_screen.dart';

import 'core/gen/codegen_loader.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
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
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      title: 'Reservasi Rawat Jalan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homescreen(),
    );
  }
}
