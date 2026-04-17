// // import 'dart:async';

// // import 'package:firebase_messaging/firebase_messaging.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// // class LocalNotificationService {
// //   static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //       FlutterLocalNotificationsPlugin();
// //   static StreamController<NotificationResponse> streamController =
// //       StreamController();
// //   static onTap(NotificationResponse notificationResponse) {
// //     // log(notificationResponse.id!.toString());
// //     // log(notificationResponse.payload!.toString());
// //     streamController.add(notificationResponse);
// //     // Navigator.push(context, route);
// //   }

// //   static Future init() async {
// //     InitializationSettings settings = const InitializationSettings(
// //       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
// //       iOS: DarwinInitializationSettings(),
// //     );
// //     flutterLocalNotificationsPlugin.initialize(
// //       settings,
// //       onDidReceiveNotificationResponse: onTap,
// //       onDidReceiveBackgroundNotificationResponse: onTap,
// //     );
// //   }

// //   //basic Notification
// //   static void showBasicNotification(RemoteMessage message) async {
// //     AndroidNotificationDetails android = AndroidNotificationDetails(
// //         'id 1', 'basic notification',
// //         importance: Importance.max,
// //         priority: Priority.high,
// //         sound:
// //             RawResourceAndroidNotificationSound('sound.wav'.split('.').first));
// //     NotificationDetails details = NotificationDetails(
// //       android: android,
// //     );
// //     await flutterLocalNotificationsPlugin.show(
// //       0,
// //       message.notification?.title,
// //       message.notification?.body,
// //       details,
// //     );
// //   }

// // }
// import 'dart:async';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class LocalNotificationService {
//   static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   static StreamController<NotificationResponse> streamController =
//       StreamController();
//   static FirebaseMessaging messaging = FirebaseMessaging.instance;
//   static String? fcmToken;

//   static void onTap(NotificationResponse notificationResponse) {
//     streamController.add(notificationResponse);
//   }

//   static Future init() async {
//     InitializationSettings settings = const InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//       iOS: DarwinInitializationSettings(),
//     );
//     flutterLocalNotificationsPlugin.initialize(
//       settings,
//       onDidReceiveNotificationResponse: onTap,
//       onDidReceiveBackgroundNotificationResponse: onTap,
//     );

//     // Fetch FCM token
//     fcmToken = await messaging.getToken();
//     print("FCM Token: $fcmToken");

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       showBasicNotification(message);
//     });
//   }

//   static void showBasicNotification(RemoteMessage message) async {
//     AndroidNotificationDetails android = AndroidNotificationDetails(
//         'id 1', 'basic notification',
//         importance: Importance.max,
//         priority: Priority.high,
//         sound: RawResourceAndroidNotificationSound('sound'));

//     NotificationDetails details = NotificationDetails(
//       android: android,
//     );

//     // await flutterLocalNotificationsPlugin.show(
//     //   0,
//     //   message.notification?.title,
//     //   message.notification?.body,
//     //   details,
//     // );
//   }
// }
