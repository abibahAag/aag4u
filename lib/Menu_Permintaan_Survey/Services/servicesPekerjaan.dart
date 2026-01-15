// import 'dart:convert';
// import 'package:flutter_aag4u/Menu_Permintaan_Survey/Models/Pekerjaan_Provider.dart';

// import 'package:http/http.dart' as http;

// import '../Models/Pekerjaan_Provider.dart';


// class PekerjaanService {
//   static const String baseUrl =
//       'https://www.app.aag4u.co.id/api/getWork'; // Ganti dengan URL API Anda

//   Future<List<Pekerjaan>> fetchPekerjaan() async {
//     final response = await http.get(Uri.parse('$baseUrl'));

//     if (response.statusCode == 200) {
//       List<dynamic> body = jsonDecode(response.body);
//       List<Pekerjaan> pekerjaan =
//           body.map((dynamic item) => Pekerjaan.fromJson(item)).toList();
//       return pekerjaan;
//     } else {
//       throw Exception('Failed to load Pekerjaan');
//     }
//   }
// }
