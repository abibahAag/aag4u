// import 'dart:convert';
// import 'package:flutter_aag4u/Menu_Permintaan_Survey/Models/Cabang_Provider.dart';
// // import 'package:flutter_aag4u/Menu_simulasi_harga/models/Cabang_Provider.dart';
// import 'package:http/http.dart' as http;


// class CabangService {
//   static const String baseUrl =
//       'https://www.app.aag4u.co.id/api/getBranch'; // Ganti dengan URL API Anda

//   Future<List<Cabang>> fetchCabang() async {
//     final response = await http.get(Uri.parse('$baseUrl'));

//     if (response.statusCode == 200) {
//       List<dynamic> body = jsonDecode(response.body);
//       List<Cabang> cabang =
//           body.map((dynamic item) => Cabang.fromJson(item)).toList();
//       return cabang;
//     } else {
//       throw Exception('Failed to load cabang');
//     }
//   }
// }
