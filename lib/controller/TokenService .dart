import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class TokenService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> sendTokenToServer() async {
    // Mendapatkan token dari Firebase
    final token = await _firebaseMessaging.getToken();
    print("Firebase Token: $token");

    // Cek apakah token berhasil didapatkan
    if (token != null) {
      // Endpoint API untuk menyimpan token
      final String apiUrl = "https://app.aag4u.co.id/api/updateToken";

      // Buat body request
      final Map<String, dynamic> body = {
        'token': token, // Simpan token dalam body
        // 'userId': '1234', // Contoh tambahan parameter lain jika diperlukan
      };

      try {
        // Kirim token ke API
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer your_api_key_or_access_token', // Sesuaikan dengan kebutuhan
          },
          body: json.encode(body),
        );

        // Cek respon dari server
        if (response.statusCode == 200) {
          print("Token berhasil disimpan di server");
        } else {
          print("Gagal menyimpan token: ${response.body}");
        }
      } catch (error) {
        print("Error saat mengirim token ke server: $error");
      }
    } else {
      print("Gagal mendapatkan token dari Firebase");
    }
  }
}
