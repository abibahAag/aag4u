import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/Menu_Promo/MenuPromoWidget.dart';
import 'package:flutter_aag4u/Menu_Promo/promoPage.dart';
import 'package:flutter_aag4u/Notification/PushNotifications.dart';
import 'package:flutter_aag4u/Notification/local_notification_service.dart';
import 'package:flutter_aag4u/controller/pushnotificationController.dart';
import 'package:flutter_aag4u/pages/SplashScreenPage.dart';
import 'package:flutter_aag4u/pages/berandaPage.dart';
import 'package:flutter_aag4u/pages/chatPage.dart';
// import 'package:flutter_aag4u/pages/promoPage.dart';
import 'package:flutter_aag4u/pages/surveyPage.dart';
import 'package:flutter_aag4u/services/local_notifications.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'firebase_options.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print("This is message frome background");
  print(message.notification!.title);
  print(message.notification!.body);
}

final GlobalKey<NavigatorState> nevegatorkey = GlobalKey();
Future _bg_notification(RemoteMessage message) async {
  if (message.notification != null) {
    print('message received in bg');
  }
}

Future<void> _backgroundMessageHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  LocalNotificationsService.showNotificationOnForeground(message);
}

///login with google
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>['email'],
);

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Inisialisasi Hive dengan Hive Flutter

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Future.wait([]);
  // await PushNotificationsService.init(), //2
  await LocalNotificationService.init(); //3
  await pushnotificationController.init(); //2

  // FirebaseApi firebaseApi = FirebaseApi();
  // await FirebaseApi().initNotifications();
  // String? token = await FirebaseMessaging.instance.getToken();
  // print('token $token');
  // // FirebaseMessaging.onBackgroundMessage(_bg_notification);

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

  /// untuk menyimpan data login ke dalam hive box
  await Hive.initFlutter();
  await Hive.openBox('loginBox'); // Buka Hive box untuk menyimpan data login

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

  runApp(const MyApp());
}

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
  static var navigatorKey;

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // print("onMessage: $message ");
      String payloadData = jsonEncode(message.data);
      if (message.notification != null) {
        pushnotificationController.showSimpleNotification(
            title: message.notification!.title!,
            body: message.notification!.body!,
            payload: payloadData);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // print("on MessageOpenedApp: $message");
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      navigatorKey: nevegatorkey,
      routes: {
        "/": (context) => SplashScreenPage(),
        // "homePage": (context) => homePage(isRegistered: false, isLoggedIn: false),
        "BerandaPage": (context) => berandaPage(),
        "surveyPage": (context) => SurveyPage(),
        "promoPage": (context) => promoPage(),
        // "profilePage": (context) =>
        //     Pekerjaanwidget(email: '', name: '', phoneNumber: ''),
        // "blogPage": (context) => BlogPage(),
        "chatPage": (context) => ChatPage(),
        "PushNotifications": (context) => PushNotifications(),
      },
    );
  }
}
