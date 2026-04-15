// import 'dart:developer';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_aag4u/Notification/local_notification_service.dart';

// class PushNotificationsService {
//   static FirebaseMessaging messaging = FirebaseMessaging.instance;

//   static Future init() async {
//     await messaging.requestPermission();
//     String? token = await messaging.getToken();
//     log(token ?? 'null');

//     FirebaseMessaging.onBackgroundMessage(handlebackgroundMessage);
//     handleForegroundMessage();
//   }

//   static Future<void> handlebackgroundMessage(RemoteMessage message) async {
//     await Firebase.initializeApp();
//     log(message.notification?.title ?? 'null');
//   }

//   static void handleForegroundMessage() {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       //show local notification
//       LocalNotificationService.showBasicNotification(message);
//     });
//   }
// }
