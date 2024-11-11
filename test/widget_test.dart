import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reservasi_rawat_jalan_mobile/main.dart';

void main() {
  setUpAll(() async {
    // Initialize Firebase for tests
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    // Ensure EasyLocalization is initialized
    await EasyLocalization.ensureInitialized();
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Wrap the app in EasyLocalization
    await tester.pumpWidget(
      EasyLocalization(
        path: 'assets/langs',
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('id', 'ID'),
        ],
        startLocale: const Locale('id', 'ID'),
        fallbackLocale: const Locale('id', 'ID'),
        child: const MyApp(),
      ),
    );

    // Verify the initial state of the counter is '0'
    expect(find.text('0'), findsOneWidget);

    // Tap the increment button
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(); // Rebuild the widget tree after the state change

    // Verify the counter increments to '1'
    expect(find.text('1'), findsOneWidget);
  });
}
