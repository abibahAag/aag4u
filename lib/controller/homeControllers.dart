
// BACK UP NOTIFIKASI
// back up notifikasi terbaru



// import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:http/http.dart' as http;
// import 'package:rxdart/rxdart.dart';

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   LocalNotifications.init();

//   final notification = message.notification;
//   final imageUrl = message.data['image'];
//   final clickAction = message.data['click_action']; // Get the action

//   if (notification != null) {
//     await LocalNotifications._showFCMNotification(
//       title: notification.title ?? "Background Title",
//       body: notification.body ?? "Background Body",
//       imageUrl: imageUrl,
//       clickAction: clickAction,
//     );

//     // Check the click_action and perform the navigation logic
//     if (clickAction != null) {
//       LocalNotifications.onClickNotification.add(clickAction);
//     }
//   }
// }

// class LocalNotifications {
//   static final FlutterLocalNotificationsPlugin
//       _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   static final onClickNotification = BehaviorSubject<String>();
//   static final FirebaseMessaging _firebaseMessaging =
//       FirebaseMessaging.instance;

//   // on tap on any notification
//   static void onNotificationTap(NotificationResponse notificationResponse) {
//     onClickNotification.add(notificationResponse.payload!);
//     _navigateToPage(notificationResponse.payload!); // Navigate on click
//   }

//   // Initialize local notifications and FCM integration
//   static Future init() async {
//     await _firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: false,
//       criticalAlert: true,
//       sound: true,
//     );

//     // Initialize Firebase Messaging
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//     // Handle notifications in foreground
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       final clickAction = message.data['click_action']; // Get the action

//       if (message.notification != null) {
//         _showFCMNotification(
//           title: message.notification!.title ?? "Foreground Title",
//           body: message.notification!.body ?? "Foreground Body",
//           imageUrl: message.data['image'],
//           clickAction: clickAction,
//         );
//       }
//     });

//     // Handle notifications when the app is terminated
//     FirebaseMessaging.instance.getInitialMessage().then((message) {
//       final clickAction = message?.data['click_action']; // Get the action

//       if (message != null) {
//         _showFCMNotification(
//           title: message.notification?.title ?? "Terminated Title",
//           body: message.notification?.body ?? "Terminated Body",
//           imageUrl: message.data['image'],
//           clickAction: clickAction,
//         );
//       }
//     });

//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     final DarwinInitializationSettings initializationSettingsDarwin =
//         DarwinInitializationSettings(
//             onDidReceiveLocalNotification: (id, title, body, payload) => null);
//     final LinuxInitializationSettings initializationSettingsLinux =
//         LinuxInitializationSettings(defaultActionName: 'Open notification');
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//             android: initializationSettingsAndroid,
//             iOS: initializationSettingsDarwin,
//             linux: initializationSettingsLinux);

//     _flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: onNotificationTap,
//         onDidReceiveBackgroundNotificationResponse: onNotificationTap);
//   }

//   // Show in-app notification for foreground
//   static Future _showFCMNotification({
//     required String title,
//     required String body,
//     String? imageUrl,
//     String? clickAction, // Added clickAction
//   }) async {
//     BigPictureStyleInformation? bigPictureStyleInformation;

//     // If imageUrl is present, display in BigPictureStyle
//     if (imageUrl != null && imageUrl.isNotEmpty) {
//       try {
//         final response = await http.get(Uri.parse(imageUrl));
//         if (response.statusCode == 200) {
//           final byteArray = ByteArrayAndroidBitmap.fromBase64String(
//             base64Encode(response.bodyBytes),
//           );
//           bigPictureStyleInformation = BigPictureStyleInformation(
//             byteArray,
//             contentTitle: title,
//             summaryText: body,
//           );
//         }
//       } catch (e) {
//         print("Error fetching image: $e");
//       }
//     }

//     final androidNotificationDetails = AndroidNotificationDetails(
//       'fcm_channel',
//       'FCM Notifications',
//       channelDescription: 'This channel is used for FCM notifications',
//       importance: Importance.max,
//       priority: Priority.high,
//       styleInformation: bigPictureStyleInformation,
//     );

//     final notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);

//     await _flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       notificationDetails,
//       payload: jsonEncode({'click_action': clickAction}), // Add click_action
//     );
//   }

//   // Navigate to the target page based on click_action
//   static void _navigateToPage(String payload) {
//     final data = jsonDecode(payload);
//     final clickAction = data['click_action'];

//     if (clickAction == 'Artikelpage') {
//       // Navigate to a specific page (example: BlogPage)
//       print("Navigate to BlogPage");
//       // Navigator.pushNamed(context, '/blogPage');
//     }
//     // Add more conditions for other pages
//   }

//   // Show a simple notification
//   static Future showSimpleNotification({
//     required String title,
//     required String body,
//     required String payload,
//   }) async {
//     const AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails('your_channel_id', 'your_channel_name',
//             channelDescription: 'your channel description',
//             importance: Importance.max,
//             priority: Priority.high,
//             ticker: 'ticker');
//     const NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);
//     await _flutterLocalNotificationsPlugin
//         .show(0, title, body, notificationDetails, payload: payload);
//   }

//   // Cancel a specific channel notification
//   static Future cancel(int id) async {
//     await _flutterLocalNotificationsPlugin.cancel(id);
//   }

//   // Cancel all notifications
//   static Future cancelAll() async {
//     await _flutterLocalNotificationsPlugin.cancelAll();
//   }
// }
