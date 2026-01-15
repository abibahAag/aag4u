// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class LocalNotificationsService {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static void initilize() {
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//             android: AndroidInitializationSettings("@mipmap/ic_launcher"));
//     _notificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse:
//           (NotificationResponse notificationResponse) {
//         if (notificationResponse.payload != null) {
//           print('Notification payload: ${notificationResponse.payload}');
//         }
//       },
//     );
//   }

//   static void showNotificationOnForeground(RemoteMessage message) {
//     final NotificationDetails notificationDetails = NotificationDetails(
//         android: AndroidNotificationDetails("com.flutter.AAG4U", "AAG4U",
//             importance: Importance.max, priority: Priority.high));

//     //    if (message.notification != null) {
//     //   final String? imageUrl = message.notification!.android?.imageUrl;

//     //   if (imageUrl != null) {
//     //   _showBigPictureNotification(
//     //     message.notification!.title,
//     //     message.notification!.body,
//     //     imageUrl,
//     //   );
//     // } else {
//     //   _notificationsPlugin.show(
//     //     DateTime.now().microsecond,
//     //     message.notification!.title,
//     //     message.notification!.body,
//     //     notificationDetails,
//     //   );
//     // }
//     if (message.notification != null) {
//       _notificationsPlugin.show(
//           DateTime.now().microsecond,
//           message.notification!.title,
//           message.notification!.body,
//           notificationDetails);
//     }
//   }
// }



// //   static void _showBigPictureNotification(
// //       String? title, String? body, String imageUrl) {
// //     final BigPictureStyleInformation bigPictureStyleInformation =
// //         BigPictureStyleInformation(
// //        NetworkImage(imageUrl) as AndroidBitmap<Object>,
// //       contentTitle: title,
// //       htmlFormatContentTitle: true,
// //       summaryText: body,
// //       htmlFormatSummaryText: true,
// //     );

// //     final NotificationDetails notificationDetails = NotificationDetails(
// //         android: AndroidNotificationDetails(
// //       "com.flutter.AAG4U",
// //       "AAG4U",
// //       importance: Importance.max,
// //       priority: Priority.high,
// //       styleInformation: bigPictureStyleInformation,
// //     ));

// //     _notificationsPlugin.show(
// //       DateTime.now().microsecond,
// //       title,
// //       body,
// //       notificationDetails,
// //     );
// //   }
// // }
