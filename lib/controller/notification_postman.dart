// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;

//   @override
//   void initState() {
//     super.initState();

//     // Meminta izin notifikasi untuk iOS
//     messaging.requestPermission();

//     // Mendapatkan token FCM
//     messaging.getToken().then((token) {
//       print("FCM Token: $token");
//     });

//     // Mendengarkan pesan masuk saat aplikasi berada di foreground
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print(
//           'Received a message: ${message.notification?.title}, ${message.notification?.body}');

//       // Memunculkan pop-up saat notifikasi diterima
//       if (message.notification != null) {
//         _showNotificationDialog(
//           message.notification!.title ?? 'No Title',
//           message.notification!.body ?? 'No Body',
//         );
//       }
//     });
//   }

//   // Method untuk menampilkan dialog saat notifikasi diterima
//   void _showNotificationDialog(String title, String body) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(title),
//           content: Text(body),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Menutup dialog
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter FCM Demo'),
//       ),
//       body: Center(
//         child: Text('Waiting for notifications...'),
//       ),
//     );
//   }
// }
