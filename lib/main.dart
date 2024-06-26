import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/codegen_loader.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/bloc_providers.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/style/theme.dart';
import 'package:reservasi_rawat_jalan_mobile/core/utils/app_database.dart';
import 'package:reservasi_rawat_jalan_mobile/firebase_options.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await AppDatabase().initialize();
  await setupServiceLocator();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    EasyLocalization(
      path: 'assets/langs',
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('id', 'ID'),
      ],
      startLocale: const Locale('id', 'ID'),
      fallbackLocale: const Locale('id', 'ID'),
      assetLoader: const CodegenLoader(),
      child: DevicePreview(
        // enabled: !kReleaseMode,
        enabled: false,
        builder: (context) => MultiBlocProvider(
          providers: BlocProviders.getBlocProviders(),
          child: const MyApp(),
        ),
      ),
    ),
  );
  // child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = context.locale.toString();
    return MaterialApp.router(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      routerConfig: AppRouter.router,
      title: 'Reservasi Rawat Jalan',
      debugShowCheckedModeBanner: false,
      theme: RRJThemeData.lightTheme,
      darkTheme: RRJThemeData.darkTheme,
    );
   /* return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      theme: RRJThemeData.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const DummyPage(),
    );*/
  }
}
