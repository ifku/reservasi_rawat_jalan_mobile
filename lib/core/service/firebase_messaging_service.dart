import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:reservasi_rawat_jalan_mobile/firebase_options.dart';

class FirebaseMessagingService {
  static Future<void> initNotification() async {
    await FirebaseMessaging.instance.requestPermission();
    await _initPushNotification();
  }

  void subscribeToTopic(String topic) async {
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  void unsubscribeFromTopic(String topic) async {
    await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
  }

  static Future<void> _initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);

    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);

    FirebaseMessaging.instance.onTokenRefresh.listen((event) {
      log('onTokenRefresh: $event', name: 'FirebaseMessagingService');
      // TODO: Send updated fcm token to server
    });
    log(
      "FirebaseMessagingService initialized successfully with token: \n${await FirebaseMessaging.instance.getToken()}",
      name: "FirebaseMessagingService",
    );
  }
}

@pragma('vm:entry-point')
Future<void> backgroundMessageHandler(RemoteMessage message) async {
  log(
    'backgroundMessageHandler: ${message.data}',
    name: 'FirebaseMessagingService',
  );
  // await DefaultNotificationService().initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await DefaultNotificationService().show(message: message);
}
