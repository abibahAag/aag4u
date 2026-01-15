// import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_aag4u/main.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';

// class PushNotificationController {
//   static final FirebaseMessaging _firebaseMessaging =
//       FirebaseMessaging.instance;
//   static final FlutterLocalNotificationsPlugin
//       _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   // Initialize notifications
//   static Future<void> init(FirebaseMessaging instance) async {
//     // Request notification permissions
//     await _firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: false,
//       criticalAlert: true,
//       sound: true,
//     );

//     // Initialize settings for Android and iOS
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     final DarwinInitializationSettings initializationSettingsDarwin =
//         DarwinInitializationSettings(
//       onDidReceiveLocalNotification: (id, title, body, payload) => null,
//     );
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsDarwin,
//     );

//     // Initialize local notifications
//     await _flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: onNotificationTap,
//     );

//     // Create notification channel for Android
//     await _createNotificationChannel();

//     // Set up Firebase background message handler
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//     // Handle messages when app is in foreground
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       _handleMessage(message);
//     });
//   }

//   // Create notification channel for Android
//   static Future<void> _createNotificationChannel() async {
//     if (Platform.isAndroid) {
//       const AndroidNotificationChannel channel = AndroidNotificationChannel(
//         'your_channel_id', // channel id
//         'your_channel_name', // channel name
//         description: 'your_channel_description', // channel description
//         importance: Importance
//             .high, // Allow notifications to be high importance (floating)
//         playSound: true,
//         enableVibration: true,
//         showBadge: true,
//         // Enable other channel settings if necessary
//       );

//       await _flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>()
//           ?.createNotificationChannel(channel);
//     }
//   }

//   // Display notification with optional image
//   static Future<void> showNotification({
//     required String title,
//     required String body,
//     required String payload,
//     String? imageUrl,
//   }) async {
//     AndroidNotificationDetails androidNotificationDetails;

//     if (imageUrl != null && imageUrl.isNotEmpty) {
//       // Download and set image for notification
//       final bigPicture = await _downloadAndSaveImage(imageUrl, 'bigPicture');
//       androidNotificationDetails = AndroidNotificationDetails(
//         'your_channel_id',
//         'your_channel_name',
//         channelDescription: 'your_channel_description',
//         styleInformation: BigPictureStyleInformation(
//           FilePathAndroidBitmap(bigPicture),
//           contentTitle: title,
//           summaryText: body,
//         ),
//         importance: Importance.high,
//         priority: Priority.high,
//       );
//     } else {
//       // Default notification without image
//       androidNotificationDetails = AndroidNotificationDetails(
//         'your_channel_id',
//         'your_channel_name',
//         channelDescription: 'your_channel_description',
//         importance: Importance.high,
//         priority: Priority.high,
//       );
//     }

//     NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);
//     await _flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       notificationDetails,
//       payload: payload,
//     );
//   }

//   // Download and save image
//   static Future<String> _downloadAndSaveImage(
//       String url, String fileName) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final filePath = '${directory.path}/$fileName';
//     final response = await http.get(Uri.parse(url));
//     final file = File(filePath);
//     await file.writeAsBytes(response.bodyBytes);
//     return filePath;
//   }

//   // Handle message to display notification
//   static void _handleMessage(RemoteMessage message) {
//     final imageUrl = message.data['imageUrl'];
//     showNotification(
//       title: message.notification?.title ?? "No Title",
//       body: message.notification?.body ?? "No Body",
//       payload: message.data.toString(),
//       imageUrl: imageUrl,
//     );
//   }

//   // Handle notification tap event
//   static void onNotificationTap(NotificationResponse notificationResponse) {
//     // Replace with navigation logic
//     navigatorKey.currentState!
//         .pushNamed("/message", arguments: notificationResponse.payload);
//   }

//   static localNotiInit() {}
// }

// // Background message handler for Firebase
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   PushNotificationController._handleMessage(message);
// }

// //////////////////////////////////////////////////////////////////////////////////////////////////
// import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_aag4u/main.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class PushNotificationController {
//   static final FirebaseMessaging _firebaseMessaging =
//       FirebaseMessaging.instance;
//   static final FlutterLocalNotificationsPlugin
//       _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   // Initialize notifications
//   static Future<void> init(FirebaseMessaging instance) async {
//     await _firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: false,
//       criticalAlert: true,
//       sound: true,
//     );

//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     final DarwinInitializationSettings initializationSettingsDarwin =
//         DarwinInitializationSettings(
//       onDidReceiveLocalNotification: (id, title, body, payload) => null,
//     );
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsDarwin,
//     );

//     await _flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: onNotificationTap,
//     );

//     await _createNotificationChannel();

//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       _handleMessage(message);
//     });
//   }

//   static Future<void> _createNotificationChannel() async {
//     if (Platform.isAndroid) {
//       const AndroidNotificationChannel channel = AndroidNotificationChannel(
//         'your_channel_id',
//         'your_channel_name',
//         description: 'your_channel_description',
//         importance: Importance.high,
//         playSound: true,
//         enableVibration: true,
//         showBadge: true,
//       );

//       await _flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>()
//           ?.createNotificationChannel(channel);
//     }
//   }

//   static Future<void> showNotification({
//     required String title,
//     required String body,
//     required String payload,
//   }) async {
//     AndroidNotificationDetails androidNotificationDetails;

//     androidNotificationDetails = AndroidNotificationDetails(
//       'your_channel_id',
//       'your_channel_name',
//       channelDescription: 'your_channel_description',
//       importance: Importance.high,
//       priority: Priority.high,
//     );

//     NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);
//     await _flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       notificationDetails,
//       payload: payload,
//     );
//   }

//   static void _handleMessage(RemoteMessage message) {
//     showNotification(
//       title: message.notification?.title ?? "No Title",
//       body: message.notification?.body ?? "No Body",
//       payload:
//           message.data['page'] ?? 'HomePage', // Gunakan 'page' sebagai payload
//     );
//   }

//   // Menangani klik pada notifikasi
//   static void onNotificationTap(NotificationResponse notificationResponse) {
//     final String? payload = notificationResponse.payload;

//     if (payload != null) {
//       // Gunakan nilai 'page' untuk menentukan tujuan navigasi
//       if (payload == 'BlogPage') {
//         navigatorKey.currentState!
//             .pushNamed('/BlogPage'); // Navigasi ke BlogPage
//       } else {
//         navigatorKey.currentState!
//             .pushNamed('/'); // Navigasi ke HomePage sebagai default
//       }
//     } else {
//       navigatorKey.currentState!
//           .pushNamed('/'); // Navigasi ke HomePage jika payload kosong
//     }
//   }

//   static localNotiInit() {}
// }

// // Background message handler untuk Firebase
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   PushNotificationController._handleMessage(message);
// }

////////////////////////////////////////////////////////////////////////////////////////////////////

import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Blog/ArtikelPage.dart';
import 'package:flutter_aag4u/main.dart';
import 'package:flutter_aag4u/pages/homepage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:permission_handler/permission_handler.dart';


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(); // Firebase initialization

}


class LocalNotifications {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static final onClickNotification = BehaviorSubject<String>();
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

    static bool _hasNavigated = false;

      static Future<void> navigateFromInitialMessage(String payload) async {
    if (navigatorKey.currentState == null) {
      print('[ERROR] navigatorKey belum siap!');
      return;
    }

    // await _navigateToPage(payload);
  }

  // on tap on any notification
  static void onNotificationTap(NotificationResponse notificationResponse) {
    // onClickNotification.add(notificationResponse.payload!);
    // _navigateToPage(notificationResponse.payload!); // Navigate on click

    final payload = notificationResponse.payload;
    if (payload != null && payload.isNotEmpty && !_hasNavigated) {
      _hasNavigated = true;
      print("Notification event: $payload");
      _navigateToPage(payload);

      // Reset flag setelah beberapa detik
      Future.delayed(Duration(seconds: 2), () {
        _hasNavigated = false;
        print("Reset flag navigasi");
      });
    }
   
  }

  // Initialize local notifications and FCM integration
  static Future init() async {
    // Initialize Firebase if not already initialized
    // 🔐 Tambahkan flag agar tidak double navigate
    bool hasNavigatedFromNotification = false;
    
    try {
      await Firebase.initializeApp();
    } catch (e) {
      print('Firebase already initialized');
    }

    try {
      await Firebase.initializeApp();
    } catch (e) {
      print('Firebase already initialized');
    }

    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      sound: true,
    );

    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }

    final androidChannel = AndroidNotificationChannel(
      'fcm_default_channel', // ✅ Harus cocok dengan ID di atas
      'FCM Notifications',
      description: 'This channel is used for FCM notifications',
      importance: Importance.max,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);



    // Initialize Firebase Messaging
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   final clickAction = message.data['click_action'];
    //   if (clickAction != null) {
    //     LocalNotifications._navigateToPage(
    //         jsonEncode({'click_action': clickAction}));
    //   }
    // });

    
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final title = message.notification?.title ?? message.data['title'] ?? '';
      final body = message.notification?.body ?? message.data['body'] ?? '';
      // final imageUrl = message.data['image'] ?? '';
      final imageUrl = message.notification?.android?.imageUrl ??
          message.notification?.apple?.imageUrl ??
          message.data['image'] ??
          '';
      final clickAction = message.data['click_action'];

      // if (message.notification != null) {
      await _showFCMNotification(
        title: title,
        body: body,
        imageUrl: imageUrl,
        clickAction: clickAction,
      );
    // }
    });

    bool isNotificationHandled = false;

    // Handle notification when app is terminated
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
      // if (initialMessage != null && !hasNavigatedFromNotification) {
      //   final clickAction = initialMessage.data['click_action'];
      //   if (clickAction != null) {
      //     hasNavigatedFromNotification = true;
      //     _navigateToPage(jsonEncode({'click_action': clickAction}));
      //   }
      
      // }

      if (initialMessage != null && !_hasNavigated) {
      final clickAction = initialMessage.data['click_action'];
      if (clickAction != null) {
        _hasNavigated = true;
        _navigateToPage(jsonEncode({'click_action': clickAction}));

        Future.delayed(Duration(seconds: 2), () {
          _hasNavigated = false;
        });
      }
    }

      // Handle notification click when app is in background
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        // if (!hasNavigatedFromNotification){
        //   final clickAction = message.data['click_action']; // Extract action
        //   if (clickAction != null) {
        //     _navigateToPage(jsonEncode({'click_action': clickAction}));
        //   }
        // }

        if (!_hasNavigated) {
          final clickAction = message.data['click_action'];
          if (clickAction != null) {
            _hasNavigated = true;
            _navigateToPage(jsonEncode({'click_action': clickAction}));

            Future.delayed(Duration(seconds: 2), () {
              _hasNavigated = false;
            });
          }
        }
      });

      // Local notifications initialization
      final initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      final initializationSettingsDarwin = DarwinInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) async {
          print("Notification received: $payload");
        },
      );

      final initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsDarwin,
      );

      await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: onNotificationTap,
      );
  }
  


  // Show in-app notification for foregroundd
  static Future _showFCMNotification({
    required String title,
    required String body,
    String? imageUrl,
    String? clickAction, // Added clickAction
  }) async {
    BigPictureStyleInformation? bigPictureStyleInformation;

    // If imageUrl is present, display in BigPictureStyle
    if (imageUrl != null && imageUrl.isNotEmpty) {
      try {
        final response = await http.get(Uri.parse(imageUrl));
        if (response.statusCode == 200) {
          final byteArray = ByteArrayAndroidBitmap.fromBase64String(
            base64Encode(response.bodyBytes),
          );
          bigPictureStyleInformation = BigPictureStyleInformation(
            byteArray,
            contentTitle: title,
            summaryText: body,
          );
        }
      } catch (e) {
        print("Error fetching image: $e");
      }
    }

    final androidNotificationDetails = AndroidNotificationDetails(
      'fcm_default_channel',
      'FCM Notifications',
      channelDescription: 'This channel is used for FCM notifications',
      importance: Importance.max,
      priority: Priority.high,
        visibility: NotificationVisibility.public,
      styleInformation: bigPictureStyleInformation,
    );

    final notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
      payload: jsonEncode({'click_action': clickAction}), // Add click_action

    );
      print('[NOTIF] Payload dikirim: ${jsonEncode({'click_action': clickAction})}');
  }

  // Navigate to the target page based on click_action
  static Future<void> _navigateToPage(String payload) async {
    
    final data = jsonDecode(payload);
    final clickAction = data['click_action'];

    if (clickAction != null) {
      print("Click action: $payload");

      // Navigate based on the 'click_action'
      if (clickAction == "surveyPage") {
        print("ini action $payload");
        // navigatorKey.currentState?.pushNamed('/surveyPage', arguments: payload);
        final currentRoute =
            ModalRoute.of(navigatorKey.currentContext!)?.settings.name;
        if (currentRoute != '/surveyPage') {
          navigatorKey.currentState?.push(
            MaterialPageRoute(
              builder: (context) => homePage(
                isRegistered: false,
                isLoggedIn: false,
                initialTabIndex: 1,
              ),
              settings: RouteSettings(name: '/surveyPage'), // beri nama unik
            ),
          );
        }
      } else if (clickAction == "profilePage") {
        // navigatorKey.currentState
        //     ?.pushNamed('/profilePage', arguments: payload);
        final currentRoute =
            ModalRoute.of(navigatorKey.currentContext!)?.settings.name;
        if (currentRoute != '/profilePage') {
          navigatorKey.currentState?.push(
            MaterialPageRoute(
              builder: (context) => homePage(
                isRegistered: false,
                isLoggedIn: false,
                initialTabIndex: 4,
              ),
              settings:
                  RouteSettings(name: '/profilePage'), // beri nama unik
            ),
          );
        }

      } else if (clickAction.startsWith("PromoPage" )) {
        // navigatorKey.currentState?.pushNamed('/PromoPage', arguments: payload);
        final currentRoute =
            ModalRoute.of(navigatorKey.currentContext!)?.settings.name;
        if (currentRoute != '/PromoPage') {
          navigatorKey.currentState?.push(
            MaterialPageRoute(
              builder: (context) => homePage(
                isRegistered: false,
                isLoggedIn: false,
                initialTabIndex: 2,
              ),
              settings: RouteSettings(name: '/PromoPage'), // beri nama unik
            ),
          );
        }
      } else if (clickAction == "TreatmentPage") {
        navigatorKey.currentState
            ?.pushNamed('/TreatmentPage', arguments: payload);
      } else if (clickAction == "EventPage") {
        // navigatorKey.currentState?.pushNamed('/EventPage', arguments: payload);
        final currentRoute =
            ModalRoute.of(navigatorKey.currentContext!)?.settings.name;
        if (currentRoute != '/EventPage') {
          navigatorKey.currentState?.push(
            MaterialPageRoute(
              builder: (context) => homePage(
                isRegistered: false,
                isLoggedIn: false,
                initialTabIndex: 3,
              ),
              settings: RouteSettings(name: '/EventPage'), // beri nama unik
            ),
          );
        }
      } else if (clickAction.startsWith("artikelPage/")) {
        try {
          // Ekstrak ID dari clickAction
          final blogId = clickAction.split('/')[1];

          // Ambil artikel berdasarkan blogId
          final blog = await getBlogBy(blogId);

          if (blog != null) {
            // Periksa apakah rute saat ini bukan ArtikelPage
            if (ModalRoute.of(navigatorKey.currentContext!)?.settings.name !=
                '/artikelPage/$blogId') {
              navigatorKey.currentState?.push(
                MaterialPageRoute(
                  builder: (context) => Artikelpage(
                    id: blog.id,
                    title: blog.title,
                    photo: blog.photo,
                    body: blog.body,
                    category: blog.toString(),
                  ),
                  settings: RouteSettings(name: '/artikelPage/$blogId'),
                ),
              );
            }
          } else {
            // Gunakan ScaffoldMessenger untuk menampilkan SnackBar jika artikel tidak ditemukan
            ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
              SnackBar(content: Text('Artikel tidak ditemukan')),
            );
          }
        } catch (e) {
          // Tampilkan error jika ada masalah
          ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
            SnackBar(content: Text('Terjadi kesalahan: $e')),
          );
        }
      } else {
        print("Unknown click action");
      }
    } else {
      print("No click_action found in payload");
    }
    // Add more conditions for other pages;
  }

  // Show a simple notification
  static Future showSimpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your_channel_id', 'your_channel_name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }

  // Cancel a specific channel notification
  static Future cancel(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }
  
}


