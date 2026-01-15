// import 'dart:convert';
// import 'package:flutter_aag4u/Menu_simulasi_harga/Models/Cabang_Provider.dart';
// import 'package:flutter_aag4u/Menu_simulasi_harga/Models/Segment_Provider.dart';
// import 'package:http/http.dart' as http;


// class SegmentService {
//   static const String baseUrl =
//       'https://www.app.aag4u.co.id/api/getSegment'; // Ganti dengan URL API Anda

//   Future<List<Segment>> fetchSegment() async {
//     final response = await http.get(Uri.parse('$baseUrl'));

//     if (response.statusCode == 200) {
//       List<dynamic> body = jsonDecode(response.body);
//       List<Segment> segment =
//           body.map((dynamic item) => Segment.fromJson(item)).toList();
//       return segment;
//     } else {
//       throw Exception('Failed to load Segment');
//     }
//   }
// }
