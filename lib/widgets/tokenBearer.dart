import 'dart:async';
import 'dart:convert';

import 'package:flutter_aag4u/widgets/access_firebase_token.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:workmanager/workmanager.dart';

const String tokenUpdateTask = "updateTokenTask";

final storage = FlutterSecureStorage();

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == tokenUpdateTask) {
      await updateToken();
    }
    return Future.value(true);
  });
}

Future<void> updateToken() async {
  try {
    final AccessFirebaseToken accessFirebaseToken = AccessFirebaseToken();
    String? tokenbearer = await accessFirebaseToken.getAccessToken();

    if (tokenbearer != null) {
      // Simpan token ke Secure Storage
      await storage.write(key: 'bearer_token', value: tokenbearer);

      // Kirim token ke API
      final url = Uri.parse('https://app.aag4u.co.id/api/updateBearer');
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'bearer $tokenbearer',
      };
      final body = jsonEncode({'bearer': tokenbearer});

      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print("Token successfully sent to API :  ${response.statusCode} ");
      } else {
        // print("Fa iled to send token to API: ${response.statusCode}");
      }
    }
  } catch (e) {
    print("Error updating token: $e");
  }
}

// class TokenUpdater with WidgetsBindingObserver {
//   Timer? _foregroundTimer;
//   static const String tokenUpdateTask = "tokenUpdateTask";
//   static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   void initialize() {
//     WidgetsBinding.instance.addObserver(this);
//     _startForegroundTokenUpdater();

//     // Hapus inisialisasi notification channel jika tidak diperlukan
//     // _initializeNotificationChannel();

//     Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
//     Workmanager().registerPeriodicTask(
//       "tokenUpdater",
//       tokenUpdateTask,
//       frequency: const Duration(minutes: 2),
//       existingWorkPolicy: ExistingWorkPolicy.keep, // Hindari penggantian task
//       constraints: Constraints(networkType: NetworkType.connected),
//     );
//   }

//   // static Future<void> updateToken() async {
//   //   // Pastikan tidak ada notifikasi di sini
//   //   print("Token diperbarui tanpa notifikasi");
//   // }

//   void _initializeNotificationChannel() async {
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'silent_channel',
//       'Silent Notifications',
//       description: 'Channel for silent background tasks',
//       importance: Importance.low,
//       showBadge: false,
//     );

//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//   }

//   void _startForegroundTokenUpdater() {
//     const updateInterval = Duration(minutes: 2);
//     _foregroundTimer = Timer.periodic(updateInterval, (Timer timer) async {
//       await updateToken();
//     });
//   }

//   static void callbackDispatcher() {
//     Workmanager().executeTask((task, inputData) async {
//       if (task == tokenUpdateTask) {
//         await updateToken();
//       }
//       return Future.value(true);
//     });
//   }

//   static Future<void> updateToken() async {
//     // Logika update token tanpa notifikasi
//     print("Token diperbarui tanpa notifikasi");
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.resumed) {
//       _startForegroundTokenUpdater();
//     } else if (state == AppLifecycleState.paused) {
//       _foregroundTimer?.cancel();
//     }
//   }

//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     _foregroundTimer?.cancel();
//     Workmanager().cancelByUniqueName("tokenUpdater");
//   }
// }
