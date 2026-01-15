// import 'package:googleapis_auth/auth_io.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

// class AccessFirebaseToken {
//   static String firebaseMessagingScope =
//       "https://www.googleapis.com/auth/firebase.messaging";

//   Future<String?> getAccessToken() async {
//     // Cek koneksi internet
//     bool hasConnection = await InternetConnectionChecker().hasConnection;

//     if (!hasConnection) {
//       print("Tidak ada koneksi internet. Tidak akan mengambil token.");
//       return null; // Jika tidak ada koneksi, hentikan proses dan kembalikan null
//     }

//     // Jika ada koneksi, lanjutkan dengan pengambilan token
//     try {
//       final client = await clientViaServiceAccount(
//         ServiceAccountCredentials.fromJson(
//           {
//             "type": "service_account",
//             "project_id": "aag4u-5878f",
//             "private_key_id": "017fab9ab1e322f7809352fee4ef74b8b30e131f",
//             "private_key":
//                 "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDiwsMg/Cmbe6d1\nhcNQA7VXgIyVh5JzUe9nQ3VBAdEfrae1yvpTrd6PT9jWLv1OKdDEKETGifEMrtOl\nR0RsPyS50sH40Yq8/e9dSdW75NQ8Pf90iec5wSz1VZ5za5hKFXvSUo2EfD9VRoFa\nQHSey0bcRZ5CQoe/WI5J0rpT9aVHBBee7ZlOdggVwTUa/ghm4zFuV+UA9kJruHbr\nju9mXRaw2Nan0YBFc5Zx8pRcvUDuAfCm3oIFDjEvRSF3qJPnItaFiIm5KhHwzxqZ\n+zMACXswvzRtCAPAOedio2qwqUqybYi01ped6dU1ARHoDCcQlHmrIfP4nEyUub8S\nGwLhIK6pAgMBAAECggEAGfPfJU1MQxv55HzKB8RaODOMONOVXVbJUZuU4JB2q2t9\nQFSE0JhGWpycMpdE18dNZMXpvoIBxp5+YUeGJeVsLKBZzEJ0iyt8/m5O5Kb3QMB6\na49vmVqUl1eUlPKBhtPCoiW0m1nPsyYonnhgtd6KCPfReb/njWzIjDEZW4vyaJgb\ndOUAlj+L4VdZyRQNr4LU/WWzx9VMPjXDNPyPeSvN+NDVZxmJKMhZEuUMBoIEglO3\ntFhfhzJSZH/4mhuKfkg24jOERwf3suO/l5rvizYIXhO2CzNeLiJlqETILubkcYHj\nyEH5kKDDZ9TPK2vM6XG9uMjT5QxPTXxJp1pJR7xUCQKBgQD5ZQ2J1JMtDHbUIGnD\nxfV1cL9PzLowlnIMP7ojGiawP6v3+E+iXQ9be+jdwYMUshTx8gkaaxWqFYosCTjN\nDV9nCqUHXFDrqfJB+HrM7gPS+xSjhjFxH2WgHGxzUq6zAOVePR8yEjPkNqUeFEXH\nTX443N1skzGHDTUcctZHiGy/UwKBgQDoxD8eof7/UhUkgg8oFnp+TEbhVJlPoDDd\nwXpQdZpivB7kSQQfOOkMLtOemAR8OUdTTUeWFC9miO/qAaWozJxISMWSbkTipZTt\nuQK8u8z4OuWbeUb5PawgI2MGQjp2GHrylHZfhKsthTwb3ZgU/zmYV+hmP53RjNs9\n5476TgWmkwKBgEoSen/qdEAYCJ8edWthO3NDJn9EFjTiKkN7FgTg+oa0kpYW2Ugn\nDa2lUteyZwVZkyD9Ozjuf0PCHATSRF2a0DAhmDxkbeBg3IQ9kfOV6erbChk7fSnV\nInD4oDlsYFjoNjfUPZS4lVL96/LQIJ1+ZbPr3ZQm77nl8VVewkgCvBHjAoGAdQOC\n/7FMcaof+tRvLiXuumM6FrjiwYa0SiajiKM2U4Bivzx9l/ySG4/Gzql5R8G7u4LU\nA/xtv8wDX84oK22A+02qFOzeMFoxPjiNybdXWUqydrBHH7EDQLzJYTIWFZxE4oID\n6AzXyPB7wT5q39NWbuFycUR14AxBgyNPW0Gx0YUCgYEAvWiseDojZNa/IyK6pyyV\nsotyqC2lyBUuPvqLRWPdBcRscqRamJ+kJV/m9XlNKOQLr/Jn/ISjgOuJ4u1mXJvG\n68o1C5BO7xOnmNHHzAcI0pvGibSrZUmK3EW0YtDTtErddd8sXE6y/0PaQdwPaLTp\nXIPZNfBL1TDXybt6sa7Bwyk=\n-----END PRIVATE KEY-----\n",
//             "client_email":
//                 "com-flutter-aag4u@aag4u-5878f.iam.gserviceaccount.com",
//             "client_id": "104893823078632095542",
//             "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//             "token_uri": "https://oauth2.googleapis.com/token",
//             "auth_provider_x509_cert_url":
//                 "https://www.googleapis.com/oauth2/v1/certs",
//             "client_x509_cert_url":
//                 "https://www.googleapis.com/robot/v1/metadata/x509/com-flutter-aag4u%40aag4u-5878f.iam.gserviceaccount.com",
//             "universe_domain": "googleapis.com"
//           },
//         ),
//         [firebaseMessagingScope],
//       );

//       final accessToken = client.credentials.accessToken.data;
//       return accessToken; // Kembalikan token jika berhasil diambil
//     } catch (e) {
//       print("Terjadi error saat mengambil token: $e");
//       return null; // Kembalikan null jika terjadi error
//     }
//   }
// }


import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';

class AccessFirebaseToken {
  static const String firebaseMessagingScope =
      "https://www.googleapis.com/auth/firebase.messaging";

  Future<String?> getAccessToken() async {
    try {
      // Load JSON asli dari file
      final jsonString =
          await rootBundle.loadString('assets/private/service-account.json');

      // Convert ke credentials
      final credentials = ServiceAccountCredentials.fromJson(
        json.decode(jsonString),
      );

      final client = await clientViaServiceAccount(
        credentials,
        [firebaseMessagingScope],
      );

      return client.credentials.accessToken.data;
    } catch (e) {
      print("Error getAccessToken: $e");
      return null;
    }
  }
}
