// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_aag4u/Menu_Promo/MenuPromoWidget.dart';
// import 'package:flutter_aag4u/Menu_Promo/promoPage.dart';
// import 'package:flutter_aag4u/Notification/message.dart';
// import 'package:flutter_aag4u/pages/SplashScreenPage.dart';
// import 'package:flutter_aag4u/pages/berandaPage.dart';
// import 'package:flutter_aag4u/pages/chatPage.dart';
// // import 'package:flutter_aag4u/pages/promoPage.dart';
// import 'package:flutter_aag4u/pages/surveyPage.dart';
// import 'package:flutter_aag4u/widgets/access_firebase_token.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// ///////////message_notification/////
// final navigatorKey = GlobalKey<NavigatorState>();

// //function to lisen to background changes
// Future _firebaseBackgroundMessage(RemoteMessage message) async {
//   await Firebase.initializeApp();

//   if (message.notification != null) {
//     print('Some notification Received in background....');
//   }
// }

// ///////////////akhir message_notification///////////

// Future<void> backgroundHandler(RemoteMessage message) async {
//   print("This is message frome background");
//   print(message.notification!.title);
//   print(message.notification!.body);
// }

// final GlobalKey<NavigatorState> nevegatorkey = GlobalKey();
// Future _bg_notification(RemoteMessage message) async {
//   if (message.notification != null) {
//     print('message received in bg');
//   }
// }

// // Future<void> _backgroundMessageHandler(RemoteMessage message) async {
// //   await Firebase.initializeApp();
// //   LocalNotificationsService.showNotificationOnForeground(message);
// // }
// Future<void> _backgroundMessageHandler(RemoteMessage message) async {
//   await Firebase
//       .initializeApp(); // Initialize Firebase when app is in background or terminated
//   print("Handling a background message: ${message.messageId}");
//   // LocalNotificationsService.showNotificationOnForeground(message);
// }

// ///login with google
// GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: <String>['email'],
// );

// ////////////////////////NotificationService/////////
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   // Log pesan yang diterima di background
//   print('Handling a background message: ${message.messageId}');
// }

// //////////////////////////akhir///////////////////

// void main() async {
// //////////NotificationService//////////
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   // Register handler untuk pesan background
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
// //////////////AKHIR////////////////////
// ////////////pushnotificationController///////////////////
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp();
//   // await Hive.initFlutter(); // Initialize Hive
//   // // Initialize Firebase Messaging and handle background notifications
//   // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   // // Initialize the push notification controller
//   // FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   // await pushnotificationController.init(_firebaseMessaging);
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp();
//   // // Initialize local notifications
//   // pushnotificationController.localNotiInit();
//   // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   // // Handle notification when the app is launched from a terminated state
//   // FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
//   //   if (message != null) {
//   //     // This means the app was launched by a notification
//   //     pushnotificationController.onNotificationTap(
//   //       NotificationResponse(
//   //         id: 0,
//   //         payload: message.data.toString(),
//   //         notificationResponseType:
//   //             NotificationResponseType.selectedNotification,
//   //       ),
//   //     );
//   //   }
//   // });
//   // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   //   // Show a local pop-up notification when the message is received in the foreground
//   //   if (message.notification != null) {
//   //     pushnotificationController.showSimpleNotification(
//   //       title: message.notification!.title ?? "No Title",
//   //       body: message.notification!.body ?? "No Body",
//   //       payload: message.data.toString(), // You can pass additional data here
//   //     );
//   //   }
//   // });
//   // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//   //   if (message.notification != null) {
//   //     pushnotificationController.onNotificationTap(
//   //       NotificationResponse(
//   //         id: 0,
//   //         payload: message.data.toString(),
//   //         notificationResponseType: NotificationResponseType
//   //             .selectedNotification, // Add the required argument
//   //       ),
//   //     );
//   //   }
//   // });

// ////////////////////////////////////

// /////////NotificationService/////////

//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp();

//   // Inisialisasi Notification Service
//   // final NotificationService notificationService = NotificationService();
//   // notificationService.initNotification();
//   // notificationService.setupFirebase();

// /////////AKHIR POSTMAN//////////

//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Hive.initFlutter(); // Inisialisasi Hive dengan Hive Flutter
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp(); // Initialize Firebase
//   // Inisialisasi Hive dan notifikasi lokal
//   // await Hive.initFlutter();
//   // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   // await Future.wait([]);
//   // await PushNotificationsService.init(); //2
//   // await LocalNotificationService.init(); //3
//   // FirebaseApi firebaseApi = FirebaseApi();
//   // await FirebaseApi().initNotifications();
//   String? token = await FirebaseMessaging.instance.getToken();
//   print('token $token');
//   // FirebaseMessaging.onBackgroundMessage(_bg_notification);

//   final AccessFirebaseToken accessFirebaseToken = AccessFirebaseToken();
//   String tokenbearer = await accessFirebaseToken.getAccessToken();
//   print("barir token $tokenbearer");

// /////////NotificationController ///////////////
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await NotificationController.initializeLocalNotifications();

//   ////////////////////////////////////////////////////////

//   // FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);
//   // FirebaseMessaging.onBackgroundMessage(handlebackgroundMessage);
//   // LocalNotificationsService.initilize();
//   // final message = await FirebaseMessaging.instance.getInitialMessage();
//   // if (message != null) {
//   //   Future.delayed(Duration(seconds: 5), () {
//   //     nevegatorkey.currentState!.pushNamed("/message", arguments: message);
//   //   });
//   // }

//   /// untuk menyimpan data login ke dalam hive box
//   await Hive.initFlutter();
//   await Hive.openBox('loginBox'); // Buka Hive box untuk menyimpan data login

//   // await NotificationController.initializeLocalNotifications();
//   // await NotificationController.initializeIsolateReceivePort();

// //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
// //   await Firebase.initializeApp();
// //   FirebaseMessaging.onMessage.listen(_firebaseMessagingOnMessage);
// //   FirebaseMessaging.onMessageOpenedApp
// //       .listen(_firebaseMessagingOnMessageOpenedApp);

// //   FirebaseMessaging messaging = FirebaseMessaging.instance;

// // // Minta izin untuk menerima notifikasi di Android
// //   NotificationSettings settings = await messaging.requestPermission(
// //     alert: true,
// //     badge: true,
// //     sound: true,
// //   );

//   ////////////////message_notification //////////////////////
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp(
//   //   options: DefaultFirebaseOptions.currentPlatform,
//   // );
//   // await PushNotifications.init();
//   // await PushNotifications.localNotiInit();
//   // //listen to background notification
//   // FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);
//   // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//   //   if (message.notification != null) {
//   //     print("Background Notification Tapped");
//   //     navigatorKey.currentState!.pushNamed("/message", arguments: message);
//   //   }
//   // });
//   // //to handle foreground notification
//   // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   //   String payloadData = jsonEncode(message.data);
//   //   print(" got a message in foreground");
//   //   if (message.notification != null) {
//   //     PushNotifications.showSimpleNotification(
//   //         title: message.notification!.title!,
//   //         body: message.notification!.body!,
//   //         payload: payloadData);
//   //   }
//   // });
//   // //for handling in terminates state
//   // final RemoteMessage? message =
//   //     await FirebaseMessaging.instance.getInitialMessage();
//   // if (message != null) {
//   //   print("Lunched from terminated state");
//   //   Future.delayed(Duration(seconds: 1), () {
//   //     navigatorKey.currentState!.pushNamed("/message", arguments: message);
//   //   });
//   // }

// ////////////////////////akhir/////////////////////////////
//   runApp(const MyApp());
// }

// // Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
// //   await Firebase.initializeApp();
// //   print("Handling a background message: ${message.messageId}");
// //   // Handle background messages
// // }
// // void _firebaseMessagingOnMessage(RemoteMessage message) {
// //   print("On message: ${message.notification?.title}");
// //   // Handle foreground messages
// // }
// // void _firebaseMessagingOnMessageOpenedApp(RemoteMessage message) {
// //   print("On message opened app: ${message.notification?.title}");
// //   // Handle when the app is opened from a notification
// // }

// class MyApp extends StatefulWidget {
//   // static var navigatorKey;

//   const MyApp({super.key});
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   // This widget is the root of your application.
//   @override
//   static final GlobalKey<NavigatorState> navigatorKey =
//       GlobalKey<NavigatorState>();

// /////////////////////NotificationService////////////
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   @override
//   void initState() {
//     super.initState();
//     // Setup notifikasi lokal dan Firebase Messaging
//     setupNotifications();
//   }

//   Future<void> setupNotifications() async {
//     // Setup untuk notifikasi lokal
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//     );

//     // Buat channel untuk notifikasi background
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'high_importance_channel', // ID channel
//       'High Importance Notifications', // Nama channel
//       description: 'This channel is used for important notifications.',
//       importance: Importance.high,
//     );

//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);

//     // Daftarkan listener untuk pesan di foreground
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Got a message in the foreground!');
//       _showNotification(message);
//     });

//     // Daftarkan listener untuk pesan saat notifikasi dibuka dari background
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('Message clicked!');
//     });
//   }

//   Future<void> _showNotification(RemoteMessage message) async {
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;

//     if (notification != null && android != null) {
//       const AndroidNotificationDetails androidPlatformChannelSpecifics =
//           AndroidNotificationDetails(
//         'high_importance_channel', // ID channel harus sama
//         'High Importance Notifications',
//         importance: Importance.high,
//         priority: Priority.high,
//         icon: '@mipmap/ic_launcher',
//       );
//       const NotificationDetails platformChannelSpecifics =
//           NotificationDetails(android: androidPlatformChannelSpecifics);

//       await flutterLocalNotificationsPlugin.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         platformChannelSpecifics,
//       );
//     }
//   }
// /////////////////////AKHIR////////

//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   //     // print("onMessage: $message ");
//   //     String payloadData = jsonEncode(message.data);
//   //     if (message.notification != null) {
//   //       pushnotificationController.showSimpleNotification(
//   //           title: message.notification!.title!,
//   //           body: message.notification!.body!,
//   //           payload: payloadData);
//   //     }
//   //   });
//   //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//   //     // print("on MessageOpenedApp: $message");
//   //   });
//   // }

//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
//       ),
//       // navigatorKey: nevegatorkey,
//       navigatorKey: navigatorKey,
//       routes: {
//         "/": (context) => SplashScreenPage(),
//         // "homePage": (context) => homePage(isRegistered: false, isLoggedIn: false),
//         "/BerandaPage": (context) => berandaPage(),
//         "/surveyPage": (context) => SurveyPage(),
//         "/promoPage": (context) => promoPage(),
//         "/message": (context) => message(),
//         // "profilePage": (context) =>
//         //     Pekerjaanwidget(email: '', name: '', phoneNumber: ''),
//         // "blogPage": (context) => BlogPage(),
//         "/chatPage": (context) => ChatPage(),
//         // "PushNotifications": (context) => PushNotifications(),
//       },
//     );
//   }
// }

import 'dart:async';
import 'dart:convert';

import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Blog/ArtikelPage.dart';
import 'package:flutter_aag4u/Menu_Blog/BlogPage.dart';
// import 'package:flutter_aag4u/Menu_Promo/MenuPromoWidget.dart';
import 'package:flutter_aag4u/Menu_Promo/promoPage.dart';
import 'package:flutter_aag4u/controller/pushnotificationController.dart';
import 'package:flutter_aag4u/pages/EventPage.dart';
import 'package:flutter_aag4u/pages/SplashScreenPage.dart';
import 'package:flutter_aag4u/pages/TreatmentPage.dart';
import 'package:flutter_aag4u/pages/berandaPage.dart';
import 'package:flutter_aag4u/pages/homepage.dart';
import 'package:flutter_aag4u/pages/profilePage.dart';
// import 'package:flutter_aag4u/pages/promoPage.dart';
import 'package:flutter_aag4u/pages/surveyPage.dart';
import 'package:flutter_aag4u/widgets/access_firebase_token.dart';
import 'package:flutter_aag4u/widgets/tokenBearer.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path_provider/path_provider.dart';
import 'package:workmanager/workmanager.dart';
import 'package:googleapis_auth/auth_io.dart';

final storage = FlutterSecureStorage();

// Future<void> backgroundHandler(RemoteMessage message) async {
//   print("This is message frome background");
//   print(message.notification!.title);
//   print(message.notification!.body);
// }

final GlobalKey<NavigatorState> nevegatorkey = GlobalKey();
Future _bg_notification(RemoteMessage message) async {
  if (message.notification != null) {
    print('message received in bg');
  }
}

// Future<void> _backgroundMessageHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   LocalNotificationsService.showNotificationOnForeground(message);
// }

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   var PushNotificationController;
//   PushNotificationController.showNotification(
//       message); // Panggilan fungsi yang benar
// }

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // Initialize the notification settings if not already initialized
//   await LocalNotifications.init();

//   // Show notification when app is in the terminated state
//   await LocalNotifications.showFCMNotification(
//     title: message.notification?.title ?? 'Notification Title',
//     body: message.notification?.body ?? 'Notification Body',
//   );
// }

///login with google
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>['email'],
);

Future<void> saveToken(String token, String tokenbearer) async {
  var box = await Hive.openBox('tokenBox'); // Open the box
  await box.put(
    'token',
    token,
  ); // Save the token with a key
  await box.put(
    'tokenbearer',
    tokenbearer,
  ); // Save the token with a key

  // Ambil token dan token bearer
  String? tokenn = box.get('token');
  String? tokenBearer = box.get('tokenbearer');

  // print('hive Token: $tokenn');
  // print('hive Token Bearer: $tokenBearer');
}

/// Save token bearer ke api
// Future<void> updateBearer(String tokenbearer) async {
//   var box = await Hive.openBox('tokenBox'); // Open the box
//   String? tokenBearer = box.get('tokenbearer');
//   // print("menyimpan token 1 ke API: ${tokenBearer}");

//   final response = await http.post(
//     Uri.parse('https://app.aag4u.co.id/api/updateBearer'),
//     body: jsonEncode({
//       'bearer': tokenBearer,
//     }),
//     headers: {'Content-Type': 'application/json'},
//   );
//   // print("menyimpan token ke API: $body");
//   if (response.statusCode == 200) {
//     //   print("Token berhasil disimpan ke API");
//     // } else {
//     print("menyimpan token BEARER ke API: ${response.statusCode}");
//   }
// }

/// sampai sini  ////////////////////
//
///

final navigatorKey = GlobalKey<NavigatorState>();
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inisialisasi Firebase
  await Hive.initFlutter();



  // await Hive.openBox<Message>('messages');

  // Set background message handler untuk menangani pesan di background
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // await PushNotificationController
  //     .localNotiInit(); // Inisialisasi notifikasi lokal

  // await PushNotificationController.init(
  // FirebaseMessaging.instance); // Initialize FCM

  ///////////////////////////////////// update token bearer ///////////

  // Inisialisasi Hive
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  // Buka Hive Box
  await Hive.openBox('bearerBox');

  ////////////////////////////////////////////akhir  update token bearer ///////////
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();

  

  
  ///

//  handle in terminated state

 

  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   if (message.notification != null) {
  //     LocalNotifications.showSimpleNotification(
  //       title: message.notification!.title ?? "No Title",
  //       body: message.notification!.body ?? "No Body",
  //       payload: message.data['payload'] ?? "No Payload",
  //     );
  //   }
  // });

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // await LocalNotifications.instance.initialize();

// Handle background messages when the app is in the background
  // FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);

  // Handle foreground messages when the app is in the foreground
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   String payloadData = jsonEncode(message.data);

  //   if (message.notification != null) {
  //     String? title = message.notification?.title;
  //     String? body = message.notification?.body;

  //     if (title != null && body != null) {
  //       LocalNotifications.showSimpleNotification(
  //         title: title,
  //         body: body,
  //         payload: payloadData,
  //       );
  //     }
  //   }
  // });

  ////

  // WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Inisialisasi Hive dengan Hive Flutter

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Future.wait([]);
  // await PushNotificationsService.init(), //2
  // await LocalNotificationService.init(); //3
  // await pushnotificationController.init(); //2

  // FirebaseApi firebaseApi = FirebaseApi();
  // await FirebaseApi().initNotifications();
  // FirebaseMessaging.onBackgroundMessage(_bg_notification);

  String? token = await FirebaseMessaging.instance.getToken();
  print('main token :: $token');

  // final AccessFirebaseToken accessFirebaseToken = AccessFirebaseToken();
  // String tokenbearer = await accessFirebaseToken.getAccessToken();
  // print("barir token $tokenbearer");

  // // Memanggil fungsi untuk menyimpan token ke API
  // await saveTokenToApi(token, tokenbearer);

  /// untuk menyimpan data login ke dalam hive box
  await Hive.initFlutter();
  await Hive.openBox('loginBox'); // Buka Hive box untuk menyimpan data login
  await Hive.openBox('tokenBox'); // Buka Hive box untuk menyimpan data login

  final AccessFirebaseToken accessFirebaseToken = AccessFirebaseToken();
  String? tokenbearer = await accessFirebaseToken.getAccessToken();
  print("bearer token: $tokenbearer");

  if (tokenbearer != null) {
    // Memanggil fungsi untuk menyimpan token ke API hanya jika tokenbearer tidak null
    await saveTokenToApi(token, tokenbearer);
  } else {
    print("Tidak ada token yang diambil karena tidak ada koneksi internet.");
  }
  if (tokenbearer != null) {
    // Memanggil fungsi untuk menyimpan token ke API hanya jika tokenbearer tidak null
    await saveToken(token!, tokenbearer);
  } else {
    print("Tidak ada token yang diambil karena tidak ada koneksi internet.");
  }

  // pushnotificationController.localNotiInit();
  // await NotificationController.initializeLocalNotifications();

  // FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);
  // // FirebaseMessaging.onBackgroundMessage(handlebackgroundMessage);
  // LocalNotificationsService.initilize();

  // final message = await FirebaseMessaging.instance.getInitialMessage();

  // if (message != null) {
  //   Future.delayed(Duration(seconds: 5), () {
  //     nevegatorkey.currentState!.pushNamed("/message", arguments: message);
  //   });
  // }

//   await Firebase.initializeApp();
//   await NotificationController.initializeLocalNotifications();
//   await NotificationController.initializeIsolateReceivePort();

//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   FirebaseMessaging.onMessage.listen(_firebaseMessagingOnMessage);
//   FirebaseMessaging.onMessageOpenedApp
//       .listen(_firebaseMessagingOnMessageOpenedApp);

  // FirebaseMessaging messaging = FirebaseMessaging.instance;

// // Minta izin untuk menerima notifikasi di Android
//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     badge: true,
//     sound: true,
//   );

// Inisialisasi Hive
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  // // Check apakah notifikasi ada di initialMessage saat aplikasi dimulai
  // FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
  //   if (message != null) {
  //     _handleNotificationClick( message); // Buka halaman saat aplikasi di-launch dari notifikasi
  //   }
  // });
  final RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();
  // if (initialMessage != null) {
  //   final topicId = initialMessage.data['topicId'];
  //   if (topicId != null) {
  //     navigatorKey.currentState?.push(
  //       MaterialPageRoute(
  //         builder: (context) => PromoPage(),
  //       ),
  //     );
  //   }
  // }

  if (initialMessage != null) {
    final clickAction = initialMessage.data['click_action'];
    if (clickAction != null) {
      // Delay pendek agar navigatorKey siap
      Future.delayed(Duration(seconds: 2), () {
        LocalNotifications.navigateFromInitialMessage(
          jsonEncode({'click_action': clickAction}),
        );
      });
    }
  }

  runApp(const MyApp());
  // runApp(
  //   DevicePreview(
  //     builder: (context) => MyApp(), // Aplikasi utama Anda
  //   ),
  // );


  var initialNotification =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  // if (initialNotification?.didNotificationLaunchApp == true) {
    LocalNotifications.onClickNotification.stream.listen((event) {
      Future.delayed(Duration(seconds: 2), () async {
        String payload = event; // The payload is a string
        print("Received Payload: $payload");

        // Attempt to parse the payload as JSON
        try {
          var payloadData = jsonDecode(payload);

          // Extract the 'click_action' from the parsed payload (if it exists)
          String? clickAction = payloadData['click_action'];
          if (clickAction != null) {
            print("Click action: $payload");

            // Navigate based on the 'click_action'
            if (clickAction == "surveyPage") {
              print("ini action $payload");
              navigatorKey.currentState
                  ?.pushNamed('/surveyPage', arguments: payload);
            } else if (clickAction == "profilePage") {
              // navigatorKey.currentState
              //     ?.pushNamed('/profilePage', arguments: payload);

              final currentRoute =
                ModalRoute.of(navigatorKey.currentContext!)?.settings.name;
              if (currentRoute != '/homeProfilePage') {
                navigatorKey.currentState?.push(
                  MaterialPageRoute(
                    builder: (context) => homePage(
                      isRegistered: false,
                      isLoggedIn: false,
                      initialTabIndex: 4,
                    ),
                    settings:
                        RouteSettings(name: '/homeProfilePage'), // beri nama unik
                  ),
                );
              }
            } else if (clickAction.startsWith("PromoPage")) {
              navigatorKey.currentState
                  ?.pushNamed('/PromoPage', arguments: payload);
            } else if (clickAction == "treatmentPage") {
              navigatorKey.currentState
                  ?.pushNamed('/TreatmentPage', arguments: payload);
            } else if (clickAction == "EventPage") {
              navigatorKey.currentState
                  ?.pushNamed('/EventPage', arguments: payload);
            } else if (clickAction.startsWith("artikelPage/")) {
              // Ekstrak ID dari clickAction
              final blogId = clickAction.split('/')[1];

              // Ambil artikel berdasarkan blogId
              final blog = await getBlogBy(blogId);

              if (blog != null) {
                // Navigasikan ke halaman ArtikelPage dengan data artikel
                navigatorKey.currentState?.push(
                  MaterialPageRoute(
                    builder: (context) => Artikelpage(
                      id: blog.id,
                      title: blog.title,
                      photo: blog.photo,
                      body: blog.body,
                      category: blog.toString(),
                    ),
                  ),
                );
              } else {
                // Gunakan ScaffoldMessenger untuk menampilkan SnackBar
                ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
                  SnackBar(content: Text('Artikel tidak ditemukan')),
                );
              }
            } else {
              print("Unknown click action");
            }
          } else {
            print("No click_action found in payload");
          }
        } catch (e) {
          print("Error parsing payload: $e");
        }
      });
    });
  // }
}

///////// UPDATE TOKEN BEARER  ////////////////////

// Future<void> startTokenUpdater() async {
//   const updateInterval = Duration(minutes: 2); // Perbarui setiap 15 menit
//   final AccessFirebaseToken accessFirebaseToken = AccessFirebaseToken();
//   String? tokenbearer = await accessFirebaseToken.getAccessToken();
//   // print("bearer token: $tokenbearer");

//   Timer.periodic(updateInterval, (Timer timer) async {
//     // final newToken = generateBearerToken();
//     await storeBearerToken(tokenbearer!);
//     print("Token updated: $tokenbearer"); // Log token yang diperbarui

//     // Kirim token terbaru ke API
//     await sendTokenToApi(tokenbearer);
//   });
// }

// // Fungsi untuk menyimpan token Bearer ke Secure Storage
// Future<void> storeBearerToken(String tokenbearer) async {
//   await storage.write(key: 'bearer_token', value: tokenbearer);
// }

// // Fungsi untuk mendapatkan token Bearer dari Secure Storage
// Future<String?> getBearerToken() async {
//   final tokenbearer = await storage.read(key: 'bearer_token');
//   if (tokenbearer != null) {
//     print("Fetched Token: $tokenbearer"); // Log token yang diambil
//   }
//   return tokenbearer;
// }

// // Fungsi untuk mengirim token ke API
// Future<void> sendTokenToApi(String tokenbearer) async {
//   final url = Uri.parse(
//       'https://app.aag4u.co.id/api/updateBearer'); // Ganti dengan endpoint API Anda
//   final headers = {
//     'Content-Type': 'application/json',
//     'Authorization':
//         'bearer $tokenbearer', // Opsional: Jika API butuh autentikasi
//   };
//   final body = jsonEncode({
//     'bearer': tokenbearer, // Sesuaikan dengan parameter yang diterima oleh API
//   });

//   try {
//     final response = await http.post(url, headers: headers, body: body);

//     if (response.statusCode == 200) {
//       print(
//           "Token successfully sent to API :  ${response.statusCode} - ${response.body}");
//     } else {
//       print(
//           "Failed to send token to API: ${response.statusCode} - ${response.body}");
//     }
//   } catch (e) {
//     print("Error sending token to API: $e");
//   }
// }

//////// SAMPAI SINI UPDATE TOKEN BEARER //////////

void _handleNotificationTap(param0) {}

/// Save token, token bearer, & email user login ///////////////////////////
Future<void> saveTokenToApi(String? token, String tokenbearer) async {
  final isibox = await Hive.openBox('loginBox');
  final email = isibox.get('email');

  if (email != null) {
    final url = Uri.parse('https://app.aag4u.co.id/api/updateToken');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $tokenbearer',
    };
    final data = {
      'email': email,
      'token': token,
      'bearer': tokenbearer,
    };

    print("Token akan disimpan ke API : $tokenbearer");

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        //   print("Token berhasil disimpan ke API");
        // } else {
        print("menyimpan token ke API: ${response.statusCode}");
      }
    } catch (e) {
      print("Error saat mengirim token ke API: $e");
    }
  } else {
    print("Email tidak tersedia, token tidak akan disimpan.");
  }
}

/// Sampai sini Save token, token bearer, & email user login ///

/// API untuk Menampilkan Notifikasi Detail Blog ///
Future<Blog?> getBlogBy(String blogId) async {
  try {
    final response = await http.get(
      Uri.parse('https://app.aag4u.co.id/api/getPostBy/$blogId'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Blog.fromJson(data);
    } else {
      print('Error: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}

///  Sampai Sini  API untuk Menampilkan Notifikasi Detail Blog //

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print("Handling a background message: ${message.messageId}");
//   // Handle background messages
// }

// void _firebaseMessagingOnMessage(RemoteMessage message) {
//   print("On message: ${message.notification?.title}");
//   // Handle foreground messages
// }

// void _firebaseMessagingOnMessageOpenedApp(RemoteMessage message) {
//   print("On message opened app: ${message.notification?.title}");
//   // Handle when the app is opened from a notification
// }

class MyApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  var pushnotificationController;

  late FirebaseMessaging _firebaseMessaging;
  late FirebaseMessaging messaging;

  @override
  void initState() {
    super.initState();
    _firebaseMessaging = FirebaseMessaging.instance;
    // subscribe();

    // Setup notifikasi klik saat aplikasi berjalan di background atau terminated
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   _handleNotificationClick(message);
    // });

    Future<void> berlangganan(String topic) async {
      await FirebaseMessaging.instance.subscribeToTopic(topic);
      // print("langganan ke $topic");
    }

////////////////  Start broadcastAAG ////////////////////////
    messaging = FirebaseMessaging.instance;

    // Request permission for iOS (optional, but recommended)
    messaging.requestPermission();

    // Subscribe to a topic (e.g., "all")
    // messaging.subscribeToTopic("all");
    berlangganan('broadcastAAG');

    // Get device token for testing (you can log this for reference)
    messaging.getToken().then((token) {
      // print("Device token: $token");
    });

    /////////////// End broadcastAAG /////////////////////////

    ////////////////////////// Start update token bearer ///////////
    WidgetsBinding.instance.addObserver(this);

    // Mulai pembaruan token di foreground
    _startForegroundTokenUpdater();

    // Inisialisasi WorkManager untuk background
    Workmanager().initialize(callbackDispatcher, isInDebugMode: false);

    // Daftarkan tugas periodik untuk background
    Workmanager().registerPeriodicTask(
      "tokenUpdater",
      tokenUpdateTask,
      frequency: const Duration(minutes: 2), // Interval minimal Android
      existingWorkPolicy: ExistingWorkPolicy.replace,
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
      backoffPolicy: BackoffPolicy.linear,
      backoffPolicyDelay: const Duration(minutes: 1),
      inputData: {'silent': true},
    );
    ////////////////////////// end update token bearer ///////////
  }

  /////////////////////////////////// Start update token bearer ///////////
  Timer? _foregroundTimer;

  void _startForegroundTokenUpdater() {
    const updateInterval = Duration(minutes: 2);
    _foregroundTimer = Timer.periodic(updateInterval, (Timer timer) async {
      await updateToken();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Jalankan pembaruan token saat aplikasi kembali ke foreground
      _startForegroundTokenUpdater();
    } else if (state == AppLifecycleState.paused) {
      // Hentikan timer saat aplikasi masuk ke background
      _foregroundTimer?.cancel();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _foregroundTimer?.cancel();
    super.dispose();
  }
  /////////////////////////////////// End  update token bearer ///////////

  // void _handleNotificationClick(RemoteMessage message) {
  //   if (message.data['BlogPage'] == 'BlogPage') {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => BlogPage()),
  //     );
  //   }
  // }

  ///

  ///
  // This widget is the root of your application.
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     // print("onMessage: $message ");
  //     String payloadData = jsonEncode(message.data);
  //     if (message.notification != null) {
  //       pushnotificationController.showSimpleNotification(
  //           title: message.notification!.title!,
  //           body: message.notification!.body!,
  //           payload: payloadData);
  //     }
  //   });
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     // print("on MessageOpenedApp: $message");
  //   });
  // }

  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
// Function to handle background messages
  // Future<void> _firebaseBackgroundMessage(RemoteMessage message) async {
  //   // Encode data payload to a string
  //   String payloadData = jsonEncode(message.data);

  //   // Check if the message does not have a notification payload but has title and body in the data payload
  //   if (message.notification == null &&
  //       message.data.containsKey("title") &&
  //       message.data.containsKey("body")) {
  //     String? title = message.data["title"];
  //     String? body = message.data["body"];

  //     // Display a simple notification if title and body are available
  //     if (title != null && body != null) {
  //       LocalNotifications.showSimpleNotification(
  //         title: title,
  //         body: body,
  //         payload: payloadData,
  //       );
  //     }
  //   }
  // }

  void _handleMessage(RemoteMessage message) {
    if (message.data['route'] != null) {
      String route = message.data['route'];
      Navigator.of(context).pushNamed(route, arguments: message.data);
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //       seedColor: const Color.fromARGB(255, 0, 255, 8)),
      // ),
      navigatorKey: navigatorKey,
      routes: {
        "/": (context) => SplashScreenPage(),
        "/homePage": (context) =>
            homePage(isRegistered: false, isLoggedIn: false),
        "BerandaPage": (context) => berandaPage(),
        "/surveyPage": (context) => SurveyPage(
              isRegistered: false,
              login: false,
            ),
        "promoPage": (context) => PromoPage(),
        "/profilePage": (context) =>
            ProfilePage(isRegistered: false, login: false),
        // "chatPage": (context) => ChatPage(),
        "/BlogPage": (context) => BlogPage(),
        "/PromoPage": (context) => PromoPage(),
        "/TreatmentPage": (context) => TreatmentPage(),
        "/EventPage": (context) => EventPage(),
      },
    );
  }
}

// void subscribe() {
//   FirebaseMessaging messsaging = FirebaseMessaging.instance;
//   final a = messsaging.subscribeToTopic('all');
//   print("langganan ke $a");
// }
