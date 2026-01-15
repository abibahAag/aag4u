// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationService {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   // Inisialisasi local notification
//   // Future<void> initNotification() async {
//   //   const AndroidInitializationSettings initializationSettingsAndroid =
//   //       AndroidInitializationSettings('@mipmap/ic_launcher');

//   //   const InitializationSettings initializationSettings =
//   //       InitializationSettings(
//   //     android: initializationSettingsAndroid,
//   //   );

//   //   await _flutterLocalNotificationsPlugin.initialize(
//   //     initializationSettings,
//   //   );
//   // }

//   // Setup Firebase Messaging
//   void setupFirebase() {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       // Ketika menerima pesan, tampilkan notifikasi popup
//       if (message.notification != null) {
//         _showNotification(
//           message.notification!.title!,
//           message.notification!.body!,
//         );
//       }
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       // Ketika pesan dibuka dari notifikasi
//       print('Message clicked!');
//     });
//   }

//   // Tampilkan notifikasi
//   Future<void> _showNotification(String title, String body) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your_channel_id', // Ganti dengan channel ID Anda
//       'your_channel_name', // Ganti dengan nama channel Anda
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     await _flutterLocalNotificationsPlugin.show(
//       0, // ID notifikasi
//       title,
//       body,
//       platformChannelSpecifics,
//       payload: 'data', // Optional, bisa diisi sesuai kebutuhan
//     );
//   }

//   Future<void> initNotification() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);

//     await _flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//     );

//     // Buat Notification Channel di Android 8.0+
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'high_importance_channel', // ID channel
//       'High Importance Notifications', // Nama channel
//       description: 'This channel is used for important notifications.',
//       importance: Importance.high,
//     );

//     final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();

//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//   }
// }

import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> subscribeToTopic(String topik) async {
  await FirebaseMessaging.instance.subscribeToTopic(topik);
  print("Berlangganan ke $topik ");
}

// await subscribeToTopic('all_devices');
