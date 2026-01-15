// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/main.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// ///  *********************************************
// ///     NOTIFICATION CONTROLLER
// ///  *********************************************
// ///
// class NotificationController extends ChangeNotifier {
//   // static ReceivedAction? initialAction;
//   /// *********************************************
//   ///   SINGLETON PATTERN
//   /// *********************************************

//   static final NotificationController _instance =
//       NotificationController._internal();

//   factory NotificationController() {
//     return _instance;
//   }

//   NotificationController._internal();

//   /// *********************************************
//   ///  OBSERVER PATTERN
//   /// *********************************************

//   String _firebaseToken = '';
//   String get firebaseToken => _firebaseToken;

//   String _nativeToken = '';
//   String get nativeToken => _nativeToken;

//   ReceivedAction? initialAction;

//   ///  *********************************************
//   ///     INITIALIZATIONS
//   ///  *********************************************
//   ///
//   static Future<void> initializeLocalNotifications() async {
//     await AwesomeNotifications().initialize(
//         null, //'resource://drawable/res_app_icon',//
//         [
//           /// CHANNEL BISA DI BIKIN BANYAK SESUAI KEBUTUHAN
//           NotificationChannel(
//               channelKey: 'alerts',
//               channelName: 'Alerts',
//               channelDescription: 'Notification tests as alerts',
//               playSound: true,
//               onlyAlertOnce: true,
//               groupAlertBehavior: GroupAlertBehavior.Children,
//               importance: NotificationImportance.High,
//               defaultPrivacy: NotificationPrivacy.Private,
//               defaultColor: Colors.deepPurple,
//               ledColor: Colors.deepPurple)
//         ],
//         debug: true);

//     // Get initial notification action is optional
//     _instance.initialAction = await AwesomeNotifications()
//         .getInitialNotificationAction(removeFromActionEvents: false);
//   }

//   static Future<void> initializeRemoteNotifications(
//       {required bool debug}) async {
//     await Firebase.initializeApp();
//     await AwesomeNotificationsFcm().initialize(
//       onFcmTokenHandle: NotificationController.myFcmTokenHandle,
//       onNativeTokenHandle: NotificationController.myNativeTokenHandle,
//       onFcmSilentDataHandle: NotificationController.mySilentDataHandle,
//       licenseKeys: null,
//       debug: debug,
//     );
//   }

//   ///  *********************************************
//   ///     LOCAL NOTIFICATION EVENTS
//   ///  *********************************************

//   static Future<void> getInitialNotificationAction() async {
//     ReceivedAction? receivedAction = await AwesomeNotifications()
//         .getInitialNotificationAction(removeFromActionEvents: true);
//     if (receivedAction == null) return;

//     // Fluttertoast.showToast(
//     //     msg: 'Notification action launched app: $receivedAction',
//     //   backgroundColor: Colors.deepPurple
//     // );
//     print('App launched by a notification action: $receivedAction');
//   }

//   ///  *********************************************
//   ///     REMOTE NOTIFICATION EVENTS
//   ///  *********************************************

//   /// Use this method to execute on background when a silent data arrives
//   /// (even while terminated)
//   @pragma("vm:entry-point")
//   static Future<void> mySilentDataHandle(FcmSilentData silentData) async {
//     print('"SilentData": ${silentData.toString()}');

//     if (silentData.createdLifeCycle != NotificationLifeCycle.Foreground) {
//       print("bg");
//     } else {
//       print("FOREGROUND");
//     }

//     print('mySilentDataHandle received a FcmSilentData execution');
//     await executeLongTaskInBackground();
//   }

//   /// Use this method to detect when a new fcm token is received
//   @pragma("vm:entry-point")
//   static Future<void> myFcmTokenHandle(String token) async {
//     if (token.isNotEmpty) {
//       debugPrint('Firebase Token:"$token"');
//     } else {
//       Fluttertoast.showToast(
//           msg: 'Fcm token deleted',
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16);

//       debugPrint('Firebase Token deleted');
//     }

//     _instance._firebaseToken = token;
//     _instance.notifyListeners();
//   }

//   /// Use this method to detect when a new native token is received
//   @pragma("vm:entry-point")
//   static Future<void> myNativeTokenHandle(String token) async {
//     debugPrint('Native Token:"$token"');

//     _instance._nativeToken = token;
//     _instance.notifyListeners();
//   }

//   ///  *********************************************
//   ///     NOTIFICATION EVENTS LISTENER
//   ///  *********************************************
//   ///  Notifications events are only delivered after call this method
//   static Future<void> startListeningNotificationEvents() async {
//     AwesomeNotifications().setListeners(
//         onActionReceivedMethod: onActionReceivedMethod,
//         onNotificationDisplayedMethod: onNotificationDisplayedMethod,
//         onNotificationCreatedMethod: onNotificationCreatedMethod,
//         onDismissActionReceivedMethod: onDismissActionReceivedMethod);
//   }

//   ///  *********************************************
//   ///     REMOTE TOKEN REQUESTS
//   ///  *********************************************

//   static Future<String> requestFirebaseToken() async {
//     if (await AwesomeNotificationsFcm().isFirebaseAvailable) {
//       try {
//         return await AwesomeNotificationsFcm().requestFirebaseAppToken();
//       } catch (exception) {
//         debugPrint('$exception');
//       }
//     } else {
//       debugPrint('Firebase is not available on this project');
//     }
//     return '';
//   }

//   ///  *********************************************
//   ///     NOTIFICATION EVENTS
//   ///  *********************************************
//   ///
//   @pragma('vm:entry-point')
//   static Future<void> onActionReceivedMethod(
//       ReceivedAction receivedAction) async {
//     AwesomeNotifications().decrementGlobalBadgeCounter();
//     if (receivedAction.actionType == ActionType.SilentAction ||
//         receivedAction.actionType == ActionType.SilentBackgroundAction) {
//       // For background actions, you must hold the execution until the end
//       print(
//           'Message sent via notification input: "${receivedAction.buttonKeyInput}"');
//       // await executeLongTaskInBackground();
//     } else {
//       // this process is only necessary when you need to redirect the user
//       // to a new page or use a valid context, since parallel isolates do not
//       // have valid context, so you need redirect the execution to main isolate
//       // if (receivePort == null) {
//       //   print(
//       //       'onActionReceivedMethod was called inside a parallel dart isolate.');
//       //   SendPort? sendPort =
//       //       IsolateNameServer.lookupPortByName('notification_action_port');

//       //   if (sendPort != null) {
//       //     print('Redirecting the execution to main isolate process.');
//       //     sendPort.send(receivedAction);
//       //     return;
//       //   }
//       // }

//       // return onActionReceivedImplementationMethod(receivedAction);
//     }
//   }

//   @pragma('vm:entry-point')
//   static Future<void> onNotificationDisplayedMethod(
//       ReceivedNotification receivedNotification) async {
//     AwesomeNotifications().decrementGlobalBadgeCounter();
//   }

//   @pragma('vm:entry-point')
//   static Future<void> onNotificationCreatedMethod(
//       ReceivedNotification ReceivedNotification) async {
//     AwesomeNotifications().decrementGlobalBadgeCounter();
//   }

//   @pragma('vm:entry-point')
//   static Future<void> onDismissActionReceivedMethod(
//       ReceivedAction ReceivedAction) async {
//     AwesomeNotifications().decrementGlobalBadgeCounter();
//   }
//   // @pragma('vm:entry-point')
//   // static Future<void> onNotificationDisplayedMethod(
//   //     ReceivedNotification receivedNotification) async {}

//   // static Future<void> onActionReceivedImplementationMethod(
//   //     ReceivedAction receivedAction) async {
//   //   MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
//   //       '/notification-page',
//   //       (route) =>
//   //           (route.settings.name != '/notification-page') || route.isFirst,
//   //       arguments: receivedAction);
//   // }

//   ///  *********************************************
//   ///     REQUESTING NOTIFICATION PERMISSIONS
//   ///  *********************************************
//   ///
//   static Future<bool> displayNotificationRationale() async {
//     bool userAuthorized = false;

//     /// DIGUNAKAN UNTUK MENGAMBIL CONTEXT DARI DALAM

//     BuildContext context = MyApp.navigatorKey.currentContext!;
//     await showDialog(
//         context: context,
//         builder: (BuildContext ctx) {
//           return AlertDialog(
//             title: Text('Get Notified!',
//                 style: Theme.of(context).textTheme.titleLarge),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 /// UNTUK MENAMPILKAN GAMBAR PADA NOTIFIKASI

//                 // Row(
//                 //   children: [
//                 //     Expanded(
//                 //       child: Image.asset(
//                 //         'assets/images/animated-bell.gif',
//                 //         height: MediaQuery.of(context).size.height * 0.3,
//                 //         fit: BoxFit.fitWidth,
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 const SizedBox(height: 20),
//                 const Text(
//                     'Allow Awesome Notifications to send you beautiful notifications!'),
//               ],
//             ),
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     Navigator.of(ctx).pop();
//                   },
//                   child: Text(
//                     'Deny',
//                     style: Theme.of(context)
//                         .textTheme
//                         .titleLarge
//                         ?.copyWith(color: Colors.red),
//                   )),
//               TextButton(
//                   onPressed: () async {
//                     userAuthorized = true;
//                     Navigator.of(ctx).pop();
//                   },
//                   child: Text(
//                     'Allow',
//                     style: Theme.of(context)
//                         .textTheme
//                         .titleLarge
//                         ?.copyWith(color: Colors.deepPurple),
//                   )),
//             ],
//           );
//         });
//     return userAuthorized &&
//         await AwesomeNotifications().requestPermissionToSendNotifications();
//   }

//   ///  *********************************************
//   ///     BACKGROUND TASKS TEST
//   ///  *********************************************
//   static Future<void> executeLongTaskInBackground() async {
//     print("starting long task");
//     // await Future.delayed(const Duration(seconds: 4));
//     // final url = Uri.parse("http://google.com");
//     // final re = await http.get(url);
//     // print(re.body);
//     print("long task done");
//   }

//   ///  *********************************************
//   ///     NOTIFICATION CREATION METHODS
//   ///  *********************************************
//   ///
//   ///
//   /// MEMBUAT NOTIFICATION BANNER AGAR BISA PANJANG TAMPILAN NYA KE BAWAH
//   ///
//   ///
//   static Future<void> createNewNotification() async {
//     bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
//     if (!isAllowed) isAllowed = await displayNotificationRationale();
//     if (!isAllowed) return;

//     await AwesomeNotifications().createNotification(
//         content: NotificationContent(
//             id: DateTime.now().microsecondsSinceEpoch.remainder(
//                 100000), // ID NOTIFIKASI HARUS RANDOM TIDAK BOLEH SAMA
//             channelKey:
//                 'alerts', //channel key harus sama dengan channel di atas
//             title: 'Huston! The eagle has landed!',
//             body:
//                 "A small step for a man, but a giant leap to Flutter's community!",

//             ///  DI BAWAH UNTUK MENAMPILKAN GAMBAR NOTIFIKASI
//             bigPicture: 'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
//             largeIcon: 'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
//             //'asset://assets/images/balloons-in-sky.jpg',
//             notificationLayout: NotificationLayout.BigPicture,
//             payload: {'notificationId': '1234567890'}),

//         /// DATA YANG MAU DIKIRIMKAN NOTIFICATION

//         /// BOTTOM YANG ADA PADA NOTIFICATION
//         actionButtons: [
//           NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
//           NotificationActionButton(
//               key: 'REPLY',
//               label: 'Reply Message',
//               requireInputText: true,
//               actionType: ActionType.SilentAction),
//           NotificationActionButton(
//               key: 'DISMISS',
//               label: 'Dismiss',
//               actionType: ActionType.DismissAction,
//               isDangerousOption: true)
//         ]);
//   }

//   ///SCHEDUL UNTUK MENGIRIM NOTIFIKASI KAPAN INGIN DI KIRIM
//   static Future<void> scheduleNewNotification() async {
//     bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
//     if (!isAllowed) isAllowed = await displayNotificationRationale();
//     if (!isAllowed) return;

//     await myNotifyScheduleInHours(
//         title: 'test',
//         msg: 'test message',
//         heroThumbUrl:
//             'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
//         hoursFromNow: 5,
//         username: 'test user',
//         repeatNotif: false);
//   }

//   static Future<void> resetBadgeCounter() async {
//     await AwesomeNotifications().resetGlobalBadge();
//   }

//   static Future<void> cancelNotifications() async {
//     await AwesomeNotifications().cancelAll();
//   }

//   static initializeIsolateReceivePort() {}

//   static AwesomeNotificationsFcm() {}

//   // static initializeRemoteNotifications({required bool debug}) {}
// }

// class FcmSilentData {
//   get createdLifeCycle => null;
// }

// Future<void> myNotifyScheduleInHours({
//   required int hoursFromNow,
//   required String heroThumbUrl,
//   required String username,
//   required String title,
//   required String msg,
//   bool repeatNotif = false,
// }) async {
//   var nowDate = DateTime.now().add(Duration(hours: hoursFromNow, seconds: 5));
//   await AwesomeNotifications().createNotification(
//     schedule: NotificationCalendar(
//       //weekday: nowDate.day,
//       hour: nowDate.hour,
//       minute: 0,
//       second: nowDate.second,
//       repeats: repeatNotif,
//       //allowWhileIdle: true,
//     ),
//     // schedule: NotificationCalendar.fromDate(
//     //    date: DateTime.now().add(const Duration(seconds: 10))),

//     content: NotificationContent(
//       id: DateTime.now().microsecondsSinceEpoch.remainder(100000),
//       channelKey: 'basic_channel',
//       title: '${Emojis.food_bowl_with_spoon} $title',
//       body: '$username, $msg',
//       bigPicture: heroThumbUrl,
//       notificationLayout: NotificationLayout.BigPicture,
//       //actionType : ActionType.DismissAction,
//       color: Colors.black,
//       backgroundColor: Colors.black,
//       // customSound: 'resource://raw/notif',
//       payload: {'actPag': 'myAct', 'actType': 'food', 'username': username},
//     ),
//     actionButtons: [
//       NotificationActionButton(
//         key: 'NOW',
//         label: 'btnAct1',
//       ),
//       NotificationActionButton(
//         key: 'LATER',
//         label: 'btnAct2',
//       ),
//     ],
//   );
// }

//     ///UNTUK MENAMPILKAN NOTIFIKASI ICON ANGKA YANG ADA DI APLIKASI

// // static Future<void> resetBadgeCounter() async {
// //   await AwesomeNotifications().resetGlobalBadge();
// // }

// // static Future<void> cancelNotifications() async{
// //   await AwesomeNotifications().cancelAll();
// // }


// // lib/notification_controller.dart

// // import 'dart:async';
// // import 'dart:isolate';
// // import 'dart:ui';

// // import 'package:awesome_notifications/awesome_notifications.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_aag4u/main.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:firebase_messaging/firebase_messaging.dart';

// // class NotificationController {
// //   static ReceivedAction? initialAction;
// //   static ReceivePort? receivePort;

// //   static Future<void> initializeLocalNotifications() async {
// //     await AwesomeNotifications().initialize(
// //         null, // 'resource://drawable/res_app_icon',//
// //         [
// //           NotificationChannel(
// //               channelKey: 'alerts',
// //               channelName: 'Alerts',
// //               channelDescription: 'Notification tests as alerts',
// //               playSound: true,
// //               onlyAlertOnce: true,
// //               groupAlertBehavior: GroupAlertBehavior.Children,
// //               importance: NotificationImportance.High,
// //               defaultPrivacy: NotificationPrivacy.Private,
// //               defaultColor: Colors.deepPurple,
// //               ledColor: Colors.deepPurple)
// //         ],
// //         debug: true);

// //     initialAction = await AwesomeNotifications()
// //         .getInitialNotificationAction(removeFromActionEvents: false);
// //   }

// //   static Future<void> initializeIsolateReceivePort() async {
// //     receivePort = ReceivePort('Notification action port in main isolate')
// //       ..listen(
// //           (silentData) => onActionReceivedImplementationMethod(silentData));

// //     IsolateNameServer.registerPortWithName(
// //         receivePort!.sendPort, 'notification_action_port');
// //   }

// //   static Future<void> startListeningNotificationEvents() async {
// //     AwesomeNotifications()
// //         .setListeners(onActionReceivedMethod: onActionReceivedMethod);
// //   }

// //   @pragma('vm:entry-point')
// //   static Future<void> onActionReceivedMethod(
// //       ReceivedAction receivedAction) async {
// //     if (receivedAction.actionType == ActionType.SilentAction ||
// //         receivedAction.actionType == ActionType.SilentBackgroundAction) {
// //       print(
// //           'Message sent via notification input: "${receivedAction.buttonKeyInput}"');
// //       await executeLongTaskInBackground();
// //     } else {
// //       if (receivePort == null) {
// //         SendPort? sendPort =
// //             IsolateNameServer.lookupPortByName('notification_action_port');
// //         if (sendPort != null) {
// //           sendPort.send(receivedAction);
// //           return;
// //         }
// //       }

// //       return onActionReceivedImplementationMethod(receivedAction);
// //     }
// //   }

// //   static Future<void> onActionReceivedImplementationMethod(
// //       ReceivedAction receivedAction) async {
// //     MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
// //         '/notification-page',
// //         (route) =>
// //             (route.settings.name != '/notification-page') || route.isFirst,
// //         arguments: receivedAction);
// //   }

// //   static Future<bool> displayNotificationRationale() async {
// //     bool userAuthorized = false;
// //     BuildContext context = MyApp.navigatorKey.currentContext!;
// //     await showDialog(
// //         context: context,
// //         builder: (BuildContext ctx) {
// //           return AlertDialog(
// //             title: Text('Get Notified!',
// //                 style: Theme.of(context).textTheme.titleLarge),
// //             content: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Row(
// //                   children: [
// //                     Expanded(
// //                       child: Image.asset(
// //                         'assets/images/animated-bell.gif',
// //                         height: MediaQuery.of(context).size.height * 0.3,
// //                         fit: BoxFit.fitWidth,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 20),
// //                 const Text(
// //                     'Allow Awesome Notifications to send you beautiful notifications!'),
// //               ],
// //             ),
// //             actions: [
// //               TextButton(
// //                   onPressed: () {
// //                     Navigator.of(ctx).pop();
// //                   },
// //                   child: Text(
// //                     'Deny',
// //                     style: Theme.of(context)
// //                         .textTheme
// //                         .titleLarge
// //                         ?.copyWith(color: Colors.red),
// //                   )),
// //               TextButton(
// //                   onPressed: () async {
// //                     userAuthorized = true;
// //                     Navigator.of(ctx).pop();
// //                   },
// //                   child: Text(
// //                     'Allow',
// //                     style: Theme.of(context)
// //                         .textTheme
// //                         .titleLarge
// //                         ?.copyWith(color: Colors.deepPurple),
// //                   )),
// //             ],
// //           );
// //         });
// //     return userAuthorized &&
// //         await AwesomeNotifications().requestPermissionToSendNotifications();
// //   }

// //   static Future<void> executeLongTaskInBackground() async {
// //     print("starting long task");
// //     await Future.delayed(const Duration(seconds: 4));
// //     final url = Uri.parse("http://google.com");
// //     final re = await http.get(url);
// //     print(re.body);
// //     print("long task done");
// //   }

// //   static Future<void> createNewNotification() async {
// //     bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
// //     if (!isAllowed) isAllowed = await displayNotificationRationale();
// //     if (!isAllowed) return;

// //     await AwesomeNotifications().createNotification(
// //         content: NotificationContent(
// //             id: -1, // -1 is replaced by a random number
// //             channelKey: 'alerts',
// //             title: 'Huston! The eagle has landed!',
// //             body:
// //                 "A small step for a man, but a giant leap to Flutter's community!",
// //             bigPicture: 'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
// //             largeIcon: 'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
// //             notificationLayout: NotificationLayout.BigPicture,
// //             payload: {'notificationId': '1234567890'}),
// //         actionButtons: [
// //           NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
// //           NotificationActionButton(
// //               key: 'REPLY',
// //               label: 'Reply Message',
// //               requireInputText: true,
// //               actionType: ActionType.SilentAction),
// //           NotificationActionButton(
// //               key: 'DISMISS',
// //               label: 'Dismiss',
// //               actionType: ActionType.DismissAction,
// //               isDangerousOption: true)
// //         ]);
// //   }

// //   static Future<void> scheduleNewNotification() async {
// //     bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
// //     if (!isAllowed) isAllowed = await displayNotificationRationale();
// //     if (!isAllowed) return;

// //     await myNotifyScheduleInHours(
// //         title: 'test',
// //         msg: 'test message',
// //         heroThumbUrl:
// //             'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
// //         hoursFromNow: 5,
// //         username: 'test user',
// //         repeatNotif: false);
// //   }

// //   static Future<void> resetBadgeCounter() async {
// //     await AwesomeNotifications().resetGlobalBadge();
// //   }

// //   static Future<void> cancelNotifications() async {
// //     await AwesomeNotifications().cancelAll();
// //   }
// // }

// // Future<void> myNotifyScheduleInHours({
// //   required int hoursFromNow,
// //   required String heroThumbUrl,
// //   required String username,
// //   required String title,
// //   required String msg,
// //   bool repeatNotif = false,
// // }) async {
// //   var nowDate = DateTime.now().add(Duration(hours: hoursFromNow, seconds: 5));
// //   await AwesomeNotifications().createNotification(
// //     schedule: NotificationCalendar(
// //       hour: nowDate.hour,
// //       minute: 0,
// //       second: nowDate.second,
// //       repeats: repeatNotif,
// //     ),
// //     content: NotificationContent(
// //       id: -1,
// //       channelKey: 'basic_channel',
// //       title: '${Emojis.food_bowl_with_spoon} $title',
// //       body: '$username, $msg',
// //       bigPicture: heroThumbUrl,
// //       notificationLayout: NotificationLayout.BigPicture,
// //       color: Colors.black,
// //       backgroundColor: Colors.black,
// //       payload: {'actPag': 'myAct', 'actType': 'food', 'username': username},
// //     ),
// //     actionButtons: [
// //       NotificationActionButton(
// //         key: 'NOW',
// //         label: 'btnAct1',
// //       ),
// //       NotificationActionButton(
// //         key: 'LATER',
// //         label: 'btnAct2',
// //       ),
// //     ],
// //   );
// // }
