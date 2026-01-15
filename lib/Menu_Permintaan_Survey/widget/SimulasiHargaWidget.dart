// import 'dart:convert';
// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/Menu_simulasi_harga/widget/HasilHargaWidget.dart';
// import 'package:http/http.dart' as http;

// // Model class for Cabang
// class Cabang {
//   final int id;
//   final String nama_cabang;

//   Cabang({required this.id, required this.nama_cabang});

//   factory Cabang.fromJson(Map<String, dynamic> json) {
//     return Cabang(
//       id: json['id'],
//       nama_cabang: json['nama_cabang'],
//     );
//   }
// }

// // class Luasan {
// //   final int id;
// //   final String ukuran_luasan;

// //   Luasan({required this.id, required this.ukuran_luasan});

// //   factory Luasan.fromJson(Map<String, dynamic> json) {
// //     return Luasan(
// //       id: json['id'],
// //       ukuran_luasan: json['ukuran_luasan'],
// //     );
// //   }
// // }

// // Model class for Pekerjaan
// class Pekerjaan {
//   final int id;
//   final String nama_pekerjaan;

//   Pekerjaan({required this.id, required this.nama_pekerjaan});

//   factory Pekerjaan.fromJson(Map<String, dynamic> json) {
//     return Pekerjaan(
//       id: json['id'],
//       nama_pekerjaan: json['nama_pekerjaan'],
//     );
//   }
// }

// // Model class for Segment
// class Segment {
//   final int id;
//   final String area_segmentasi;

//   Segment({required this.id, required this.area_segmentasi});

//   factory Segment.fromJson(Map<String, dynamic> json) {
//     return Segment(
//       id: json['id'],
//       area_segmentasi: json['area_segmentasi'],
//     );
//   }
// }

// class SimulasiHargaWidget extends StatefulWidget {
//   @override
//   _SimulasiHargaWidgetState createState() => _SimulasiHargaWidgetState();
// }

// class _SimulasiHargaWidgetState extends State<SimulasiHargaWidget> {
//   final _formKey = GlobalKey<FormState>();
//   final _formKey2 = GlobalKey<FormState>();

//   Future<List<Cabang>>? futureCabang;
//   Future<List<Pekerjaan>>? futurePekerjaan;
//   Future<List<Segment>>? futureSegment;
//   List<dynamic> dropdownItems = [];

//   // List<Map<String, dynamic>> dropdownItems = [];
//   // List<dynamic> futureHarga = [];

//   Cabang? selectedCabang;
//   Pekerjaan? selectedPekerjaan;
//   Segment? selectedSegment;
//   String? selectedItem;
//   String? futureHarga;
//      String? selectedPrice;

//   String? harga; // Variable untuk menyimpan harga

//   @override
//   void initState() {
//     super.initState();
//     futureCabang = fetchCabang();
//     futurePekerjaan = fetchPekerjaan();
//     futureSegment = fetchSegment();
//     //  fetchDropdownItems();
//   }

//   Future<List<Cabang>> fetchCabang() async {
//     final response =
//         await http.get(Uri.parse('https://www.app.aag4u.co.id/api/getBranch'));
//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((data) => Cabang.fromJson(data)).toList();
//     } else {
//       throw Exception('Failed to load cabang');
//     }
//   }

//   Future<List<Pekerjaan>> fetchPekerjaan() async {
//     final response =
//         await http.get(Uri.parse('https://www.app.aag4u.co.id/api/getWork'));
//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((data) => Pekerjaan.fromJson(data)).toList();
//     } else {
//       throw Exception('Failed to load pekerjaan');
//     }
//   }

//   Future<List<Segment>> fetchSegment() async {
//     final response =
//         await http.get(Uri.parse('https://www.app.aag4u.co.id/api/getSegment'));
//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((data) => Segment.fromJson(data)).toList();
//     } else {
//       throw Exception('Failed to load Segment');
//     }
//   }

//   void _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       // Create data to send
//       final data = {
//         'cabang': selectedCabang?.id,
//         'kerjaan': selectedPekerjaan?.id,
//         'segmen': selectedSegment?.id,
//       };

//       // Send data to the API
//       final response = await http.post(
//         Uri.parse('https://app.aag4u.co.id/api/getAreaBy'),
//         headers: {'Content-Type': 'application/json'},
//         // body: json.encode({'luasan': selectedItem}),
//         body: json.encode(data),
//       );

//       if (response.statusCode == 200) {
//         // Handle successful response
//         final responseData = json.decode(response.body) as List<dynamic>;
//         setState(() {
//           dropdownItems = responseData;
//         });
//          // Navigate to the next page
//          print(dropdownItems);
//           Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HasilHargaWidget(dropdownItems: dropdownItems),
//           ),
//         );
//       } else {
//         // Handle error response
//         print('Failed to submit data: ${response.statusCode}');
//       }
//     }
//   }

//   void _cekFormm() async {
//     if (_formKey2.currentState!.validate()) {
//       _formKey2.currentState!.save();
//       // Create data to send
//       final data = {
//         'luasan': dropdownItems,
//       };

//       // print('hjhjhjhj ${dropdownItems}  ');

//       // Send data to the AP/I
//       final response = await http.post(
//         Uri.parse('https://app.aag4u.co.id/api/getResult'),
//         headers: {'Content-Type': 'application/json'},
//       // body: json.encode({'luasan': selectedItem}),
//         body: json.encode(data),
//       );

//       // if (response.statusCode == 200) {
//       //   final responseData = json.decode(response.body);
//       //    if (responseData != null &&
//       //       responseData['data'] != null &&
//       //       responseData['data']['harga'] != null) {
//       //     setState(() {
//       //       futureHarga = responseData['data']['harga'].toString();
//       //     });

//       // } else {
//       //   print('Failed to submit data: ${response.statusCode}');
//       // }
//       // }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width * 0.9;
//     double inWidth = MediaQuery.of(context).size.width * 0.8;

//     return SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//             // crossAxisAlignment: CrossAxisAlignment.center,

//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 12.0, vertical: 15.0),
//                     child: Column(
//                       children: [
//                         Container(
//                           width: screenWidth,
//                           height: 100,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             color: Color(0xFF233d63),
//                             borderRadius: BorderRadius.circular(24),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "Simulasi Harga",
//                                     style: TextStyle(
//                                         fontSize: 35,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12.0,
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Column(
//                           children: [
//                             Container(
//                               width: screenWidth,
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                     style: BorderStyle.solid,
//                                     color: Colors.grey),
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(24)),
//                               ),
//                               child: Form(
//                                 key: _formKey,
//                                 child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Column(
//                                         children: [
//                                           Container(
//                                             // color: Colors.amber,
//                                             // width: inWidth,
//                                             height: 420,
//                                             alignment: Alignment.center,
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                         top: 10,
//                                                         bottom: 10,
//                                                       ),
//                                                       child: Column(
//                                                         children: [
//                                                           Row(
//                                                             children: [
//                                                               Column(
//                                                                 children: [
//                                                                   Container(
//                                                                     child:
//                                                                         Column(
//                                                                       crossAxisAlignment:
//                                                                           CrossAxisAlignment
//                                                                               .start,
//                                                                       children: [
//                                                                         Row(
//                                                                           children: [
//                                                                             Column(
//                                                                               children: <Widget>[
//                                                                                 Container(
//                                                                                   // color: Colors.blue,
//                                                                                   // width:,

//                                                                                   height: 30,
//                                                                                   child: Text(
//                                                                                     "CABANG",
//                                                                                     style: TextStyle(
//                                                                                       fontSize: 15,
//                                                                                       fontWeight: FontWeight.bold,
//                                                                                     ),
//                                                                                   ),
//                                                                                 )
//                                                                               ],
//                                                                             )
//                                                                           ],
//                                                                         ),
//                                                                         Row(
//                                                                           children: [
//                                                                             Padding(
//                                                                               padding: const EdgeInsets.all(0),
//                                                                               child: Column(
//                                                                                 children: [
//                                                                                   FutureBuilder<List<Cabang>>(
//                                                                                     future: futureCabang,
//                                                                                     builder: (context, snapshot) {
//                                                                                       if (snapshot.connectionState == ConnectionState.waiting) {
//                                                                                         return Center(child: CircularProgressIndicator());
//                                                                                       } else if (snapshot.hasError) {
//                                                                                         return Center(child: Text('Error: ${snapshot.error}'));
//                                                                                       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                                                                                         return Center(child: Text(''));
//                                                                                       } else {
//                                                                                         return Container(
//                                                                                           width: inWidth,
//                                                                                           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                                                                                           decoration: BoxDecoration(
//                                                                                             borderRadius: BorderRadius.circular(8.0),
//                                                                                             border: Border.all(color: Colors.grey),
//                                                                                           ),
//                                                                                           child: DropdownButtonFormField<Cabang>(
//                                                                                             hint: Text('Pilih Cabang'),
//                                                                                             value: selectedCabang,
//                                                                                             onChanged: (Cabang? newValue) {
//                                                                                               setState(() {
//                                                                                                 selectedCabang = newValue;
//                                                                                               });
//                                                                                             },
//                                                                                             items: snapshot.data!.map<DropdownMenuItem<Cabang>>((Cabang cabang) {
//                                                                                               return DropdownMenuItem<Cabang>(
//                                                                                                 value: cabang,
//                                                                                                 child: Text(cabang.nama_cabang),
//                                                                                               );
//                                                                                             }).toList(),
//                                                                                             isExpanded: true,
//                                                                                             // validator: (value) => value == null ? 'Pilih Cabang' : null,
//                                                                                             validator: (value) {
//                                                                                               if (value == null) {
//                                                                                                 return 'Pilih Cabang';
//                                                                                               }
//                                                                                               return null;
//                                                                                             },
//                                                                                             onSaved: (value) {
//                                                                                               selectedCabang = value;
//                                                                                             },

//                                                                                             decoration: InputDecoration(
//                                                                                               enabledBorder: UnderlineInputBorder(
//                                                                                                 borderSide: BorderSide(color: Colors.grey),
//                                                                                               ),
//                                                                                               focusedBorder: UnderlineInputBorder(
//                                                                                                 borderSide: BorderSide(color: Colors.grey),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ),
//                                                                                         );
//                                                                                       }
//                                                                                     },
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           SizedBox(height: 25),
//                                                           Row(
//                                                             children: [
//                                                               Column(
//                                                                 children: [
//                                                                   Container(
//                                                                     child:
//                                                                         Column(
//                                                                       crossAxisAlignment:
//                                                                           CrossAxisAlignment
//                                                                               .start,
//                                                                       children: [
//                                                                         Row(
//                                                                           children: [
//                                                                             Column(
//                                                                               children: <Widget>[
//                                                                                 Container(
//                                                                                   // color: Colors.blue,
//                                                                                   // width:,

//                                                                                   height: 30,
//                                                                                   child: Text(
//                                                                                     "PEKERJAAN",
//                                                                                     style: TextStyle(
//                                                                                       fontSize: 15,
//                                                                                       fontWeight: FontWeight.bold,
//                                                                                     ),
//                                                                                   ),
//                                                                                 )
//                                                                               ],
//                                                                             )
//                                                                           ],
//                                                                         ),
//                                                                         Row(
//                                                                           children: [
//                                                                             Padding(
//                                                                               padding: const EdgeInsets.all(.0),
//                                                                               child: Column(
//                                                                                 children: [
//                                                                                   FutureBuilder<List<Pekerjaan>>(
//                                                                                     future: futurePekerjaan,
//                                                                                     builder: (context, snapshot) {
//                                                                                       if (snapshot.connectionState == ConnectionState.waiting) {
//                                                                                         return Center(child: CircularProgressIndicator());
//                                                                                       } else if (snapshot.hasError) {
//                                                                                         return Center(child: Text('Error: ${snapshot.error}'));
//                                                                                       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                                                                                         return Center(child: Text('No Data Available'));
//                                                                                       } else {
//                                                                                         return Container(
//                                                                                           width: inWidth,
//                                                                                           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                                                                                           decoration: BoxDecoration(
//                                                                                             borderRadius: BorderRadius.circular(8.0),
//                                                                                             border: Border.all(color: Colors.grey),
//                                                                                           ),
//                                                                                           child: DropdownButtonFormField<Pekerjaan>(
//                                                                                             hint: Text('Pilih Pekerjaan'),
//                                                                                             value: selectedPekerjaan,
//                                                                                             onChanged: (Pekerjaan? newValue) {
//                                                                                               setState(() {
//                                                                                                 selectedPekerjaan = newValue;
//                                                                                               });
//                                                                                             },
//                                                                                             items: snapshot.data!.map<DropdownMenuItem<Pekerjaan>>((Pekerjaan pekerjaan) {
//                                                                                               return DropdownMenuItem<Pekerjaan>(
//                                                                                                 value: pekerjaan,
//                                                                                                 child: Text(pekerjaan.nama_pekerjaan),
//                                                                                               );
//                                                                                             }).toList(),
//                                                                                             isExpanded: true,
//                                                                                             // validator: (value) => value == null ? 'Pilih Pekerjaan' : null,

//                                                                                             validator: (value) {
//                                                                                               if (value == null) {
//                                                                                                 return 'Pilih Pekerjaan';
//                                                                                               }
//                                                                                               return null;
//                                                                                             },
//                                                                                             onSaved: (value) {
//                                                                                               selectedPekerjaan = value;
//                                                                                             },
//                                                                                             decoration: InputDecoration(
//                                                                                               enabledBorder: UnderlineInputBorder(
//                                                                                                 borderSide: BorderSide(color: Colors.grey),
//                                                                                               ),
//                                                                                               focusedBorder: UnderlineInputBorder(
//                                                                                                 borderSide: BorderSide(color: Colors.grey),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ),
//                                                                                         );
//                                                                                       }
//                                                                                     },
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           SizedBox(height: 25),
//                                                           Row(
//                                                             children: [
//                                                               Column(
//                                                                 children: [
//                                                                   Container(
//                                                                     child:
//                                                                         Column(
//                                                                       crossAxisAlignment:
//                                                                           CrossAxisAlignment
//                                                                               .start,
//                                                                       children: [
//                                                                         Row(
//                                                                           children: [
//                                                                             Column(
//                                                                               children: <Widget>[
//                                                                                 Container(
//                                                                                   // color: Colors.blue,
//                                                                                   // width:,

//                                                                                   height: 30,
//                                                                                   child: Text(
//                                                                                     "SEGMENT",
//                                                                                     style: TextStyle(
//                                                                                       fontSize: 15,
//                                                                                       fontWeight: FontWeight.bold,
//                                                                                     ),
//                                                                                   ),
//                                                                                 )
//                                                                               ],
//                                                                             )
//                                                                           ],
//                                                                         ),
//                                                                         Row(
//                                                                           children: [
//                                                                             Padding(
//                                                                               padding: const EdgeInsets.all(.0),
//                                                                               child: Column(
//                                                                                 children: [
//                                                                                   FutureBuilder<List<Segment>>(
//                                                                                     future: futureSegment,
//                                                                                     builder: (context, snapshot) {
//                                                                                       if (snapshot.connectionState == ConnectionState.waiting) {
//                                                                                         return Center(child: CircularProgressIndicator());
//                                                                                       } else if (snapshot.hasError) {
//                                                                                         return Center(child: Text('Error: ${snapshot.error}'));
//                                                                                       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                                                                                         return Center(child: Text('No Data Available'));
//                                                                                       } else {
//                                                                                         return Container(
//                                                                                           width: inWidth,
//                                                                                           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                                                                                           decoration: BoxDecoration(
//                                                                                             borderRadius: BorderRadius.circular(8.0),
//                                                                                             border: Border.all(color: Colors.grey),
//                                                                                           ),
//                                                                                           child: DropdownButtonFormField<Segment>(
//                                                                                             hint: Text('Pilih Segment'),
//                                                                                             value: selectedSegment,
//                                                                                             onChanged: (Segment? newValue) {
//                                                                                               setState(() {
//                                                                                                 selectedSegment = newValue;
//                                                                                               });
//                                                                                             },
//                                                                                             items: snapshot.data!.map<DropdownMenuItem<Segment>>((Segment segment) {
//                                                                                               return DropdownMenuItem<Segment>(
//                                                                                                 value: segment,
//                                                                                                 child: Text(segment.area_segmentasi),
//                                                                                               );
//                                                                                             }).toList(),
//                                                                                             isExpanded: true,
//                                                                                             // validator: (value) => value == null ? 'Pilih Segment' : null,

//                                                                                             validator: (value) {
//                                                                                               if (value == null) {
//                                                                                                 return 'Pilih Segment';
//                                                                                               }
//                                                                                               return null;
//                                                                                             },
//                                                                                             onSaved: (value) {
//                                                                                               selectedSegment = value;
//                                                                                             },
//                                                                                             decoration: InputDecoration(
//                                                                                               enabledBorder: UnderlineInputBorder(
//                                                                                                 borderSide: BorderSide(color: Colors.grey),
//                                                                                               ),
//                                                                                               focusedBorder: UnderlineInputBorder(
//                                                                                                 borderSide: BorderSide(color: Colors.grey),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ),
//                                                                                         );
//                                                                                       }
//                                                                                     },
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           SizedBox(height: 30),
//                                                           Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                     .only(
//                                                                     left: 150),
//                                                             child: Row(
//                                                               children: [
//                                                                 ElevatedButton(
//                                                                   style:
//                                                                       ButtonStyle(
//                                                                     backgroundColor: MaterialStateProperty.all<
//                                                                             Color>(
//                                                                         Color(
//                                                                             0xFF233d63)),
//                                                                   ),
//                                                                   onPressed:
//                                                                       _submitForm,
//                                                                   child: Row(
//                                                                     mainAxisAlignment:
//                                                                         MainAxisAlignment
//                                                                             .end,
//                                                                     children: [
//                                                                       Text(
//                                                                         'Next',
//                                                                         style: TextStyle(
//                                                                             color:
//                                                                                 Colors.white),
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ]),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),

//                   ],
//                 ),
//               ),
//             ]));
//   }
// }

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Permintaan_Survey/widget/SurveyResultWidget.dart';
import 'package:flutter_aag4u/pages/homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart'; // Untuk validasi dan format tanggal

// Model class for Cabang
class Hama {
  final int id;
  final String nama_hama;

  Hama({required this.id, required this.nama_hama});

  factory Hama.fromJson(Map<String, dynamic> json) {
    return Hama(
      id: json['id'],
      nama_hama: json['nama_hama'],
    );
  }
}

class HamaItem {
  final int id;
  final String nama_hama;

  HamaItem({required this.id, required this.nama_hama});

  factory HamaItem.fromJson(Map<String, dynamic> json) {
    return HamaItem(
      id: json['id'],
      nama_hama: json['nama_hama'],
    );
  }
}

// Model class for Pekerjaan
class Provinsi {
  final int id;
  final String name;

  Provinsi({required this.id, required this.name});

  factory Provinsi.fromJson(Map<String, dynamic> json) {
    return Provinsi(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      name: json['name'],
    );
  }
}

// Model class for Segment
class Kota {
  final int id;
  final String name;

  Kota({required this.id, required this.name});

  factory Kota.fromJson(Map<String, dynamic> json) {
    return Kota(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      name: json['name'],
    );
  }
}

class SimulasiHargaWidget extends StatefulWidget {
  const SimulasiHargaWidget(
      {super.key,
      required bool isRegistered,
      required bool login,
      required bool isLoggedIn,
      // required String url
      });

  @override
  _SimulasiHargaWidgetState createState() => _SimulasiHargaWidgetState();
}

class _SimulasiHargaWidgetState extends State<SimulasiHargaWidget> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _waController = TextEditingController();
  final TextEditingController _hamacontroller = TextEditingController();

  // List<String> _selectedItem = [];
  Future<List<String>>? futureHama;
  Future<List<Provinsi>>? futureProvinsi;
  Future<List<Kota>>? futureKota;
  late Future<List<HamaItem>> _futureItems;

  List<Map<String, dynamic>> _selectedItems = [];
  bool isConnected = true; // Assume initially connected
  bool _isFormVisible = false;

  HamaItem? _selectedItem;
  // Hama? selectedHama;
  Provinsi? selectedProvinsi;
  Kota? selectedKota;
  String? selectedItem;
  bool _isLoadingdata = true;
  bool hasInternet = true;

  // String? futureHarga;
  // String? selectedPrice;
  // String? harga; // Variable untuk menyimpan harga

  @override
  void initState() {
    super.initState();
    // final box = Hive.box('loginBox');
    // box.delete('after_login');  
    // Hive.box('loginBox').delete('after_login');
    // futureHama = fetchItems();
    futureProvinsi = fetchProvinsi();

    _futureItems = fetchItems();
    _fetchItems();

    // futureKota = fetchKota();
    //  fetchDropdownItems();

    // Pastikan tidak ada setState yang dipanggil sebelum frame pertama selesai dirender
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _isFormVisible =
              false; // Atur state secara aman setelah frame pertama
        });
      }
    });
  }

  void _onHamaSelected(HamaItem item) {
    setState(() {
      _selectedItem = item;
    });
  }

  Future<List<HamaItem>> fetchItems() async {
    isConnected = await InternetConnectionChecker().hasConnection;
    setState(() {
      _isLoadingdata = true;
    });

    try {
      final response =
          await http.get(Uri.parse('https://app.aag4u.co.id/api/getPest'));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        List<HamaItem> hama =
            jsonResponse.map((data) => HamaItem.fromJson(data)).toList();
        setState(() {
          _isLoadingdata = false;
        });
        return hama;
      } else {
        throw Exception('Failed to load blog posts');
      }
    } catch (e) {
      print('Error fetching data: $e');
      return _getPlaceholderhama();
    }
  }

  List<HamaItem> _getPlaceholderhama() {
    return [
      HamaItem(
        id: 0,
        nama_hama: '',
      ),
    ];
  }

  Future<List<Provinsi>> fetchProvinsi() async {
    isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      try {
        final response = await http.get(Uri.parse(
            'https://www.emsifa.com/api-wilayah-indonesia/api/provinces.json'));

        if (response.statusCode == 200) {
          List jsonResponse = json.decode(response.body);
          List<Provinsi> provinsi =
              jsonResponse.map((data) => Provinsi.fromJson(data)).toList();
          return provinsi;
        } else {
          throw Exception('Failed to load blog posts');
        }
      } catch (e) {
        print('Error fetching data: $e');
        return _getPlaceholderprovinsi();
      }
    } else {
      return _getPlaceholderprovinsi();
    }
  }

  List<Provinsi> _getPlaceholderprovinsi() {
    return [
      Provinsi(
        id: 0,
        name: '',
      ),
    ];
  }

  Future<List<Kota>> fetchKota(int provinsiId) async {
    isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      try {
        final response = await http.get(Uri.parse(
            'https://www.emsifa.com/api-wilayah-indonesia/api/regencies/$provinsiId.json'));

        if (response.statusCode == 200) {
          List jsonResponse = json.decode(response.body);
          List<Kota> kota =
              jsonResponse.map((data) => Kota.fromJson(data)).toList();
          return kota;
        } else {
          throw Exception('Failed to load blog posts');
        }
      } catch (e) {
        print('Error fetching data: $e');
        return _getPlaceholderkota();
      }
    } else {
      return _getPlaceholderkota();
    }
  }

  List<Kota> _getPlaceholderkota() {
    return [
      Kota(
        id: 0,
        name: '',
      ),
    ];
  }

  // void _submitForm() async {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //     List<int> selectedHamaIds = _selectedItemIds.toList();
  //     // Memeriksa apakah ada data yang kosong
  //     if (selectedHamaIds.isEmpty ||
  //         selectedProvinsi == null ||
  //         selectedKota == null ||
  //         _alamatController.text.isEmpty ||
  //         _waController.text.isEmpty ||
  //         _hamacontroller.text.isEmpty ||
  //         _dateController.text.isEmpty || // Memeriksa input tanggal
  //         _timeController.text.isEmpty)
  //     //     {
  //     //   // Memeriksa input jam
  //     //   showDialog(
  //     //     context: context,
  //     //     builder: (BuildContext context) {
  //     //       return AlertDialog(
  //     //         title: Text(
  //     //           'Warning!!!',
  //     //           style: TextStyle(color: Colors.red),
  //     //         ),
  //     //         content: Text(
  //     //           'Semua data harus diisi.',
  //     //           style: TextStyle(fontSize: 15),
  //     //         ),
  //     //         actions: <Widget>[
  //     //           TextButton(
  //     //             onPressed: () {
  //     //               Navigator.of(context).pop();
  //     //             },
  //     //             child: Text('OK'),
  //     //           ),
  //     //         ],
  //     //       );
  //     //     },
  //     //   );
  //     //   return; // Keluar dari fungsi jika ada data yang kosong
  //     // }
  //     final data = {
  //       'hama': selectedHamaIds,
  //       'provinsi': selectedProvinsi?.name,
  //       'kota': selectedKota?.name,
  //       'alamat': _alamatController.text,
  //       'wa': _waController.text,
  //       'hama_lainnya': _hamacontroller.text,
  //       'jadwal': _dateController.text, // Menambahkan tanggal ke request body
  //       'jam': _timeController.text, // Menambahkan jam ke request body
  //       // 'email': , // Menambahkan dari hive box login
  //     };
  //     print('Request data: $data');
  //     final response = await http.post(
  //       Uri.parse('https://app.aag4u.co.id/api/survey'),
  //       headers: {'Content-Type': 'application/json'},
  //       body: json.encode(data),
  //     );
  //     print('Response body: ${response.body}');
  //     if (response.statusCode == 200) {
  //       final responseData = json.decode(response.body) as Map<String, dynamic>;
  //       final surveyId = responseData['idi'];
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => SurveyResultWidget(surveyId: surveyId),
  //         ),
  //       );
  //     } else {
  //       print('Failed to submit data: ${response.statusCode}');
  //     }
  //   }
  // }

  void _submitForm() async {
    double fontSize = MediaQuery.of(context).size.height * 0.02;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      List<int> selectedHamaIds = _selectedItemIds.toList();

      // Memeriksa apakah ada data yang kosong, tetapi mengizinkan selectedHamaIds dan _hamacontroller.text untuk kosong
      if (selectedProvinsi == null ||
          selectedKota == null ||
          _alamatController.text.isEmpty ||
          _waController.text.isEmpty ||
          _dateController.text.isEmpty || // Memeriksa input tanggal
          _timeController.text.isEmpty) {
        // Menampilkan dialog peringatan jika ada data yang kosong
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Warning!!!',
                style: TextStyle(color: Colors.red, fontSize: fontSize * 0.04),
              ),
              content: Text(
                'Semua data harus diisi, kecuali Hama dan kolom Hama tambahan.',
                style: TextStyle(fontSize: fontSize * 0.04),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child:
                      Text('OK', style: TextStyle(fontSize: fontSize * 0.04)),
                ),
              ],
            );
          },
        );
        return; // Keluar dari fungsi jika ada data yang kosong
      }
      final isiBox = await Hive.openBox('loginBox');

      final data = {
        'hama': selectedHamaIds,
        'provinsi': selectedProvinsi?.name,
        'kota': selectedKota?.name,
        'alamat': _alamatController.text,
        'wa': _waController.text,
        'hama_lainnya': _hamacontroller.text, // Ini bisa kosong
        'jadwal': _dateController.text, // Menambahkan tanggal ke request body
        'jam': _timeController.text, // Menambahkan jam ke request body
        'email_user': isiBox.get('email'), // Menambahkan dari hive box login
      };

      print('Request data: $data');

      final response = await http.post(
        Uri.parse('https://app.aag4u.co.id/api/survey'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );

      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        final surveyId = responseData['idi'];

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SurveyResultWidget(surveyId: surveyId),
          ),
        );
      } else {
        print('Failed to submit data: ${response.statusCode}');
      }
    }
  }

  List<HamaItem> _items = [];
  Set<int> _selectedItemIds = {};
  String? _selectedText;

  Future<void> _fetchItems() async {
    try {
      _items = await fetchItems();
      setState(() {});
    } catch (error) {
      print('Error fetching items: $error');
    }
  }

  Future<void> _refreshData() async {
    await fetchItems();
    await fetchProvinsi();
    // await fetchKota();
    setState(() {});
  }

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  // final _formKey = GlobalKey<FormState>();

  List<TextEditingController> _controllers = [];

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();

    for (var controller in _controllers) {
      controller.dispose();
    }
    _hamacontroller.dispose();

    // super.dispose();
  }

  void _addNewForm() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  String? _validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Masukkan Tanggal';
    }
    try {
      // Validasi format tanggal
      DateFormat('yyyy-MM-dd').parseStrict(value);
    } catch (e) {
      return 'Format Tanggal Salah (Gunakan yyyy-MM-dd)';
    }
    return null;
  }

  String? _validateTime(String? value) {
    if (value == null || value.isEmpty) {
      return 'Masukkan Jam';
    }
    try {
      // Validasi format waktu
      DateFormat('HH:mm').parseStrict(value);
    } catch (e) {
      return 'Format Jam Salah (Gunakan HH:mm)';
    }
    return null;
  }

  String? _address(String? value) {
    if (value == null || value.isEmpty) {
      return ' Masukkan Detail Alamat';
    }
    return null;
  }

  String? _whatsapp(String? value) {
    if (value == null || value.isEmpty) {
      return ' Maukkan Nomor Whatsapp';
    }
    return null;
  }

  Future<void> _selectDate() async {
    final screenWidth = MediaQuery.of(context).size.width;

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialEntryMode: screenWidth > 600
          ? DatePickerEntryMode.calendarOnly
          : DatePickerEntryMode.calendar, // Mode berbeda untuk tablet
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor:
                screenWidth > 600 ? 1.9 : 1.0, // Perbesar teks di tablet
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text =
            "${pickedDate.toLocal()}".split(' ')[0]; // Format yyyy-MM-dd
      });
    }
  }

  // Future<void> _selectTime() async {
  //   double fontSize = MediaQuery.of(context).size.height * 0.02;

  //   // Menampilkan time picker
  //   TimeOfDay? selectedTime = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //   );

  //   if (selectedTime != null) {
  //     // Konversi TimeOfDay menjadi DateTime untuk perbandingan
  //     final now = DateTime.now();
  //     final selectedDateTime = DateTime(
  //         now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
  //     final startTime =
  //         DateTime(now.year, now.month, now.day, 8, 0); // Jam 8 pagi
  //     final endTime =
  //         DateTime(now.year, now.month, now.day, 17, 0); // Jam 5 sore

  //     // Cek apakah waktu yang dipilih berada dalam rentang yang diperbolehkan
  //     if (selectedDateTime.isAfter(startTime) &&
  //         selectedDateTime.isBefore(endTime)) {
  //       // Format waktu dan masukkan ke controller
  //       setState(() {
  //         _timeController.text = selectedTime.format(context);
  //       });
  //     } else {
  //       // Jika waktu tidak valid, tampilkan pesan kesalahan
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text('Harap pilih waktu antara pukul 08:00 - 17:00',
  //             style: TextStyle(fontSize: fontSize * 0.04)),
  //       ));
  //     }
  //   }
  // }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(alwaysUse24HourFormat: true), // Paksa 24 jam
          child: child!,
        );
      },
    );

    if (picked != null) {
      // Konversi ke format jam:menit (24 jam)
      final formattedTime = DateFormat('HH:mm').format(
        DateTime(0, 1, 1, picked.hour, picked.minute),
      );

      final int selectedInMinutes = picked.hour * 60 + picked.minute;
      final int startOperational = 8 * 60; // 08:00 = 480 menit
      final int endOperational = 17 * 60; // 17:00 = 1020 menit

      if (selectedInMinutes < startOperational ||
          selectedInMinutes > endOperational) {
        // Jika waktu tidak dalam rentang operasional, tampilkan alert
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Di Luar Jam Oprational"),
            content: Text("Jam yang dipilih harus antara 08:00 sampai 17:00."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              )
            ],
          ),
        );
        return;
      }

      setState(() {
        _timeController.text = formattedTime;
      });
    }
  }

  // bool _isFormVisible = false;

  Future<void> _loadingData() async {
    // Simulasi delay untuk menunjukkan loading
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      _isLoadingdata = true; // Selesai memuat data
    });
  }

  Future<void> _checkInternetConnection() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    if (mounted) {
      setState(() {
        hasInternet = isConnected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 1.0;
    double screenheight = MediaQuery.of(context).size.height;
    double titleWidth = MediaQuery.of(context).size.width * 0.8;

    double inWidth = MediaQuery.of(context).size.width;
    double inheight = MediaQuery.of(context).size.height;
    double inWidth1 = MediaQuery.of(context).size.width * 0.10;
    double inWidthhama = MediaQuery.of(context).size.width * 0.6;
    double inputWidth = MediaQuery.of(context).size.width * 0.8;
    double inWidthContainer = MediaQuery.of(context).size.width * 0.95;
    double inputheightContainer = MediaQuery.of(context).size.width;
    double inWidthisi = MediaQuery.of(context).size.width * 0.8;
    double inputheightisi = MediaQuery.of(context).size.height * 0.03;
    double fontSize = MediaQuery.of(context).size.height;
    double fontSize2 = MediaQuery.of(context).size.height * 0.02;
    double iconSize = MediaQuery.of(context).size.height;
    double screenWidtAppBar = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: screenWidtAppBar * 0.10,
          // backgroundColor: Colors.amber,
          leading: IconButton(
            padding: EdgeInsets.only(bottom: 30),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: iconSize * 0.02,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      homePage(
                    isRegistered: false,
                    // login: false,
                    isLoggedIn: false,
                  ),
                ),
                (route) => false, // Menghapus semua rute sebelumnya
              );
            },
          ),
          title: Container(
            // color: Colors.amber,
            // height: 300,
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            child: Image.asset(
                              "images/icons/aag.png",
                              height: iconSize * 0.07,
                              width: iconSize * 0.07,
                            ),
                          ),
                          // Text(
                          //   "data",
                          //   style: TextStyle(color: Colors.black, fontSize: 5),
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Container(
              width: iconSize * 0.09,
              // color: Colors.amber,
              child: Align(
                alignment: Alignment.topCenter, // Posisikan ikon ke atas
                child: IconButton(
                  padding: EdgeInsets.only(bottom: 10),
                  icon: Icon(
                    Icons.refresh,
                    size: iconSize * 0.05,
                  ),
                  onPressed: () async {
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ),
        body: hasInternet
            ? SafeArea(
                child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RefreshIndicator(
                      onRefresh: _refreshData,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 15.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: inWidthContainer,
                                            height: inheight * 0.1,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF233d63),
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Permintaan Survey",
                                                      style: TextStyle(
                                                          fontSize:
                                                              fontSize * 0.02,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                RefreshIndicator(
                                  onRefresh: _refreshData,
                                  child: FutureBuilder<bool>(
                                    future: InternetConnectionChecker()
                                        .hasConnection,
                                    builder: (context, snapshot) {
                                      // if (snapshot.connectionState == ConnectionState.waiting) {
                                      //   return Center(child: CircularProgressIndicator());
                                      // } else
                                      if (snapshot.hasError) {
                                        return Center(
                                            child: Text(
                                          "Error: ${snapshot.error}",
                                          style: TextStyle(
                                              fontSize: fontSize * 0.04),
                                        ));
                                      } else if (snapshot.hasData &&
                                          snapshot.data == true) {
                                        // Internet is available
                                        return _isLoadingdata
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 150),
                                                child: Center(
                                                    child: LoadingAnimationWidget
                                                        .inkDrop(
                                                            color: const Color
                                                                .fromARGB(255,
                                                                34, 20, 227),
                                                            size: 50)),
                                              )
                                            : RefreshIndicator(
                                                onRefresh: _refreshData,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0, right: 0),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Container(
                                                                width:
                                                                    screenWidth,
                                                                height:
                                                                    inheight *
                                                                        1.4,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  // color: const Color
                                                                  //     .fromARGB(
                                                                  //     87,
                                                                  //     153,
                                                                  //     131,
                                                                  //     8),
                                                                  // border: Border.all(
                                                                  //     style: BorderStyle
                                                                  //         .solid,
                                                                  //     color: Colors
                                                                  //         .grey),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              24)),
                                                                ),
                                                                child: Form(
                                                                  key: _formKey,
                                                                  child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Column(
                                                                          children: [
                                                                            Row(
                                                                              // mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Container(
                                                                                  padding: EdgeInsets.only(top: 10),
                                                                                  child: Center(
                                                                                    child: Column(
                                                                                      // crossAxisAlignment:
                                                                                      //     CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Row(
                                                                                          children: [
                                                                                            Container(
                                                                                              width: inWidthContainer,
                                                                                              // height: inheight * 1.3,
                                                                                              alignment: Alignment.center,
                                                                                              decoration: BoxDecoration(
                                                                                                // color: Colors.amber,
                                                                                                border: Border.all(style: BorderStyle.solid, color: Colors.grey),
                                                                                                borderRadius: BorderRadius.all(Radius.circular(24)),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsets.only(top: 15, bottom: 10, left: 10, right: 5),
                                                                                                child: Column(
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      children: [
                                                                                                        Column(
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              child: Column(
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    children: [
                                                                                                                      Column(
                                                                                                                        children: <Widget>[
                                                                                                                          Container(
                                                                                                                            // color: Colors.blue,
                                                                                                                            // width:,

                                                                                                                            height: inputheightisi,
                                                                                                                            child: Text(
                                                                                                                              "HAMA",
                                                                                                                              style: TextStyle(
                                                                                                                                fontSize: fontSize * 0.02,
                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          )
                                                                                                                        ],
                                                                                                                      )
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: const EdgeInsets.all(0),
                                                                                                                        child: Column(
                                                                                                                          children: [
                                                                                                                            FutureBuilder<List<HamaItem>>(
                                                                                                                              future: _futureItems,
                                                                                                                              builder: (context, snapshot) {
                                                                                                                                if (snapshot.connectionState == ConnectionState.waiting) {
                                                                                                                                  return Center(child: Text(''));
                                                                                                                                } else if (snapshot.hasError) {
                                                                                                                                  return Center(
                                                                                                                                      child: Text(
                                                                                                                                    'Error: ${snapshot.error}',
                                                                                                                                    style: TextStyle(fontSize: fontSize * 0.04),
                                                                                                                                  ));
                                                                                                                                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                                                                                                                  return Center(child: Text('No items found.', style: TextStyle(fontSize: fontSize * 0.04)));
                                                                                                                                } else {
                                                                                                                                  final items = snapshot.data!;
                                                                                                                                  return Container(
                                                                                                                                    width: inWidth * 0.9,
                                                                                                                                    height: inheight * 0.07, // Tinggi container luar tetap besar
                                                                                                                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                                                      border: Border.all(color: Colors.grey),
                                                                                                                                    ),
                                                                                                                                    child: GestureDetector(
                                                                                                                                      onTap: _showSelectHamaDialog,
                                                                                                                                      child: AbsorbPointer(
                                                                                                                                          child: DropdownButtonFormField<String>(
                                                                                                                                        value: _selectedText,
                                                                                                                                        isExpanded: true,
                                                                                                                                        // hint: Text(
                                                                                                                                        //   'Pilih Hama',
                                                                                                                                        //   style: TextStyle(
                                                                                                                                        //       fontSize: MediaQuery.of(context).size.height * 0.02, // Ukuran teks responsif
                                                                                                                                        //       fontWeight: FontWeight.bold,
                                                                                                                                        //       color: Colors.black),
                                                                                                                                        // ),
                                                                                                                                        decoration: InputDecoration(
                                                                                                                                          // label: Text('Pilih Hama'),
                                                                                                                                          // labelStyle: TextStyle(fontSize: fontSize * 0.03),
                                                                                                                                          // hintStyle: TextStyle(fontSize: fontSize * 0.09),
                                                                                                                                          border: InputBorder.none,
                                                                                                                                          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                                                                                                                        ),
                                                                                                                                        style: TextStyle(
                                                                                                                                          fontSize: fontSize * 0.2, // Ukuran teks lebih jelas untuk semua perangkat
                                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                                          color: Colors.black,
                                                                                                                                        ),
                                                                                                                                        items: [
                                                                                                                                          DropdownMenuItem<String>(
                                                                                                                                            value: _selectedText,
                                                                                                                                            child: Container(
                                                                                                                                              width: MediaQuery.of(context).size.width * 0.8, // 80% dari lebar layar
                                                                                                                                              height: MediaQuery.of(context).size.width > 600 ? 100 : 60, // Tinggi dropdown berbeda untuk tablet dan HP
                                                                                                                                              alignment: Alignment.centerLeft,
                                                                                                                                              child: Text(
                                                                                                                                                _selectedText ?? 'Pilih Hama',
                                                                                                                                                style: TextStyle(
                                                                                                                                                  fontSize: MediaQuery.of(context).size.width > 800 ? fontSize2 : fontSize2, // Ukuran teks menyesuaikan perangkat
                                                                                                                                                  color: Colors.black,
                                                                                                                                                ),
                                                                                                                                                overflow: TextOverflow.ellipsis,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                        onChanged: (_) {},
                                                                                                                                      )),
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                }
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    SizedBox(height: 5),
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsets.all(0),
                                                                                                      child: Column(
                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                        children: <Widget>[
                                                                                                          Row(
                                                                                                            mainAxisAlignment: MainAxisAlignment.start, // Tempatkan tombol di sebelah kiri
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                // color: const Color.fromARGB(255, 48, 7, 255),
                                                                                                                width: MediaQuery.of(context).size.width * 0.5,
                                                                                                                height: MediaQuery.of(context).size.width * 0.09,
                                                                                                                child: ElevatedButton(
                                                                                                                  onPressed: () {
                                                                                                                    if (mounted) {
                                                                                                                      setState(() {
                                                                                                                        _isFormVisible = !_isFormVisible;
                                                                                                                      });
                                                                                                                    }
                                                                                                                  },
                                                                                                                  style: ButtonStyle(
                                                                                                                    fixedSize: WidgetStatePropertyAll(Size(100, 10)),
                                                                                                                    backgroundColor: WidgetStatePropertyAll(Colors.grey[300]),
                                                                                                                  ),
                                                                                                                  child: Row(
                                                                                                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Column(
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            // color: Colors.amber,
                                                                                                                            child: Row(
                                                                                                                              children: [
                                                                                                                                Icon(
                                                                                                                                  Icons.add,
                                                                                                                                  color: Colors.black,
                                                                                                                                  size: iconSize * 0.03,
                                                                                                                                ),
                                                                                                                                Text(
                                                                                                                                  _isFormVisible ? 'Hama lainnya ' : 'Hama lainnya',
                                                                                                                                  style: TextStyle(
                                                                                                                                    color: Colors.black,
                                                                                                                                    fontSize: fontSize * 0.02,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),

                                                                                                          // Tampilkan form jika _isFormVisible adalah true
                                                                                                          if (_isFormVisible) ...[
                                                                                                            SizedBox(height: 20), // Menambahkan jarak antara tombol dan form
                                                                                                            TextField(
                                                                                                              controller: _hamacontroller,
                                                                                                              enableInteractiveSelection: true,
                                                                                                              maxLines: 2,
                                                                                                              style: TextStyle(fontSize: fontSize * 0.02),
                                                                                                              decoration: InputDecoration(
                                                                                                                labelText: 'Nama Hama',
                                                                                                                labelStyle: TextStyle(fontSize: fontSize * 0.02),
                                                                                                                border: OutlineInputBorder(
                                                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    // Column(
                                                                                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    //   children: <Widget>[
                                                                                                    //     // Konten lain di sini...
                                                                                                    //     ElevatedButton(
                                                                                                    //       onPressed: () {
                                                                                                    //         setState(() {
                                                                                                    //           _isFormVisible = !_isFormVisible; // Toggle visibility of the form
                                                                                                    //         });
                                                                                                    //       },
                                                                                                    //       style: ButtonStyle(
                                                                                                    //         fixedSize: WidgetStatePropertyAll(Size(150, 10)),
                                                                                                    //         backgroundColor: WidgetStatePropertyAll(Colors.grey[300]),
                                                                                                    //       ),
                                                                                                    //       child: Container(
                                                                                                    //         child: Row(
                                                                                                    //           children: [
                                                                                                    //             Icon(
                                                                                                    //               Icons.add,
                                                                                                    //               color: Colors.black,
                                                                                                    //               size: 20,
                                                                                                    //             ),
                                                                                                    //             Text(
                                                                                                    //               _isFormVisible ? 'Hama Lainnya' : 'Hama Lainnya',
                                                                                                    //               style: TextStyle(
                                                                                                    //                 color: Colors.black,
                                                                                                    //                 fontSize: 12,
                                                                                                    //               ),
                                                                                                    //             ),
                                                                                                    //           ],
                                                                                                    //         ),
                                                                                                    //       ),
                                                                                                    //     ),
                                                                                                    //     // Tampilkan form jika _isFormVisible adalah true
                                                                                                    //     if (_isFormVisible) ...[
                                                                                                    //       SizedBox(height: 10), // Menambahkan jarak antara tombol dan form
                                                                                                    //       Container(
                                                                                                    //         decoration: BoxDecoration(
                                                                                                    //           border: Border.all(
                                                                                                    //             color: Colors.grey,
                                                                                                    //             width: 1,
                                                                                                    //             style: BorderStyle.solid,
                                                                                                    //           ),
                                                                                                    //           borderRadius: BorderRadius.circular(10),
                                                                                                    //         ),
                                                                                                    //         padding: EdgeInsets.only(left: 10, top: 10),
                                                                                                    //         child: TextField(
                                                                                                    //           controller: _hamacontroller,
                                                                                                    //           enableInteractiveSelection: true,
                                                                                                    //           maxLines: 2,
                                                                                                    //           decoration: InputDecoration(
                                                                                                    //             hintText: ('Masukkan Hama  '),
                                                                                                    //             border: InputBorder.none,
                                                                                                    //           ),
                                                                                                    //         ),
                                                                                                    //       ),
                                                                                                    //     ],
                                                                                                    //   ],
                                                                                                    // ),
                                                                                                    SizedBox(height: 10),
                                                                                                    Row(
                                                                                                      children: [
                                                                                                        Column(
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              child: Column(
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    children: [
                                                                                                                      Column(
                                                                                                                        children: <Widget>[
                                                                                                                          Container(
                                                                                                                            // color: Colors.blue,
                                                                                                                            // width:,

                                                                                                                            height: inputheightisi,
                                                                                                                            child: Text(
                                                                                                                              "PROVINSI",
                                                                                                                              style: TextStyle(
                                                                                                                                fontSize: fontSize * 0.02,
                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          )
                                                                                                                        ],
                                                                                                                      )
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: const EdgeInsets.all(.0),
                                                                                                                        child: Column(
                                                                                                                          children: [
                                                                                                                            RefreshIndicator(
                                                                                                                              onRefresh: _refreshData,
                                                                                                                              child: FutureBuilder<List<Provinsi>>(
                                                                                                                                future: futureProvinsi,
                                                                                                                                builder: (context, snapshot) {
                                                                                                                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                                                                                                                    return CircularProgressIndicator();
                                                                                                                                  } else if (snapshot.hasError) {
                                                                                                                                    return Text('Error: ${snapshot.error}', style: TextStyle(fontSize: fontSize * 0.04));
                                                                                                                                  } else if (snapshot.hasData) {
                                                                                                                                    if (snapshot.data!.isEmpty) {
                                                                                                                                      WidgetsBinding.instance.addPostFrameCallback((_) {
                                                                                                                                        showDialog(
                                                                                                                                          context: context,
                                                                                                                                          builder: (BuildContext context) {
                                                                                                                                            return AlertDialog(
                                                                                                                                              title: Text('Peringatan'),
                                                                                                                                              content: Text('Data harus diisi'),
                                                                                                                                              actions: <Widget>[
                                                                                                                                                TextButton(
                                                                                                                                                  onPressed: () {
                                                                                                                                                    Navigator.of(context).pop();
                                                                                                                                                  },
                                                                                                                                                  child: Text('OK'),
                                                                                                                                                ),
                                                                                                                                              ],
                                                                                                                                            );
                                                                                                                                          },
                                                                                                                                        );
                                                                                                                                      });
                                                                                                                                      return Container(); // Return an empty container or another widget
                                                                                                                                    }

                                                                                                                                    return Container(
                                                                                                                                      width: inWidth * 0.9,
                                                                                                                                      height: inheight * 0.07,
                                                                                                                                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                                                        border: Border.all(color: Colors.grey),
                                                                                                                                      ),
                                                                                                                                      child: DropdownButton<Provinsi>(
                                                                                                                                        hint: Text(
                                                                                                                                          'Pilih Provinsi',
                                                                                                                                          style: TextStyle(fontSize: fontSize * 0.02),
                                                                                                                                        ),
                                                                                                                                        value: selectedProvinsi,
                                                                                                                                        onChanged: (Provinsi? newValue) {
                                                                                                                                          setState(() {
                                                                                                                                            selectedProvinsi = newValue;
                                                                                                                                            selectedKota = null; // Reset the Kota selection
                                                                                                                                            if (newValue != null) {
                                                                                                                                              futureKota = fetchKota(newValue.id);
                                                                                                                                            }
                                                                                                                                          });
                                                                                                                                        },
                                                                                                                                        items: snapshot.data!.map((Provinsi provinsi) {
                                                                                                                                          return DropdownMenuItem<Provinsi>(
                                                                                                                                            value: provinsi,
                                                                                                                                            child: Text(
                                                                                                                                              provinsi.name,
                                                                                                                                              style: TextStyle(
                                                                                                                                                fontSize: fontSize * 0.02,
                                                                                                                                                // fontWeight: FontWeight.bold,
                                                                                                                                              ),
                                                                                                                                              maxLines: 2,
                                                                                                                                              overflow: TextOverflow.visible,
                                                                                                                                              softWrap: true,
                                                                                                                                            ),
                                                                                                                                          );
                                                                                                                                        }).toList(),
                                                                                                                                      ),
                                                                                                                                    );
                                                                                                                                  } else {
                                                                                                                                    return Text('No data', style: TextStyle(fontSize: fontSize * 0.04));
                                                                                                                                  }
                                                                                                                                },
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    SizedBox(height: 10),
                                                                                                    Row(
                                                                                                      children: [
                                                                                                        Column(
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              child: Column(
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    children: [
                                                                                                                      Column(
                                                                                                                        children: <Widget>[
                                                                                                                          Container(
                                                                                                                            // color: Colors.blue,
                                                                                                                            // width:,

                                                                                                                            height: inputheightisi,
                                                                                                                            child: Text(
                                                                                                                              "KOTA",
                                                                                                                              style: TextStyle(
                                                                                                                                fontSize: fontSize * 0.02,
                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          )
                                                                                                                        ],
                                                                                                                      )
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: const EdgeInsets.all(.0),
                                                                                                                        child: Column(
                                                                                                                          children: [
                                                                                                                            FutureBuilder<List<Kota>>(
                                                                                                                              future: futureKota,
                                                                                                                              builder: (context, snapshot) {
                                                                                                                                // if (snapshot.connectionState == ConnectionState.waiting) {
                                                                                                                                //   return CircularProgressIndicator();
                                                                                                                                // } else
                                                                                                                                if (snapshot.hasError) {
                                                                                                                                  return Text('Error: ${snapshot.error}', style: TextStyle(fontSize: fontSize * 0.04));
                                                                                                                                } else if (snapshot.hasData) {
                                                                                                                                  return Container(
                                                                                                                                    width: inWidth * 0.9,
                                                                                                                                    height: inheight * 0.07,
                                                                                                                                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                                                      border: Border.all(color: Colors.grey),
                                                                                                                                    ),
                                                                                                                                    child: DropdownButton<Kota>(
                                                                                                                                      hint: Text(
                                                                                                                                        'Pilih Kota',
                                                                                                                                        style: TextStyle(fontSize: fontSize * 0.02),
                                                                                                                                        maxLines: 3,
                                                                                                                                        overflow: TextOverflow.ellipsis,
                                                                                                                                        softWrap: true,
                                                                                                                                      ),
                                                                                                                                      value: selectedKota,
                                                                                                                                      onChanged: (Kota? newValue) {
                                                                                                                                        setState(() {
                                                                                                                                          selectedKota = newValue;
                                                                                                                                        });
                                                                                                                                      },
                                                                                                                                      items: snapshot.data!.map((Kota kota) {
                                                                                                                                        return DropdownMenuItem<Kota>(
                                                                                                                                          value: kota,
                                                                                                                                          child: ConstrainedBox(
                                                                                                                                            constraints: BoxConstraints(maxWidth: inWidth * 0.8), // Sesuaikan lebar maksimum sesuai kebutuhan
                                                                                                                                            child: Text(
                                                                                                                                              kota.name,
                                                                                                                                              style: TextStyle(
                                                                                                                                                fontSize: fontSize * 0.02,
                                                                                                                                                // fontWeight: FontWeight.bold,
                                                                                                                                              ),
                                                                                                                                              maxLines: 3,
                                                                                                                                              overflow: TextOverflow.ellipsis,
                                                                                                                                              // softWrap: true,
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        );
                                                                                                                                      }).toList(),
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                } else {
                                                                                                                                  return Container(
                                                                                                                                    width: inWidth * 0.9,
                                                                                                                                    height: inheight * 0.07,
                                                                                                                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                                                      border: Border.all(color: Colors.grey),
                                                                                                                                    ),
                                                                                                                                    child: Column(
                                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                      children: [
                                                                                                                                        Row(
                                                                                                                                          children: [
                                                                                                                                            Text(
                                                                                                                                              'Silakan pilih provinsi',
                                                                                                                                              style: TextStyle(
                                                                                                                                                color: const Color.fromARGB(255, 58, 56, 56),
                                                                                                                                                fontSize: fontSize * 0.02,
                                                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                }
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    SizedBox(height: 10),
                                                                                                    Row(
                                                                                                      children: [
                                                                                                        Column(
                                                                                                          children: [
                                                                                                            Row(
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  child: Column(
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        children: [
                                                                                                                          Column(
                                                                                                                            children: <Widget>[
                                                                                                                              Container(
                                                                                                                                // color: Colors.blue,
                                                                                                                                // width:,

                                                                                                                                height: inputheightisi,
                                                                                                                                child: Text(
                                                                                                                                  "ALAMAT ",
                                                                                                                                  style: TextStyle(
                                                                                                                                    fontSize: fontSize * 0.02,
                                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              )
                                                                                                                            ],
                                                                                                                          )
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      Row(
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: inWidth * 0.9,
                                                                                                                            height: inheight * 0.08,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              border: Border.all(
                                                                                                                                color: Colors.grey,
                                                                                                                                width: 1,
                                                                                                                                style: BorderStyle.solid,
                                                                                                                              ),
                                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                                            ),
                                                                                                                            padding: EdgeInsets.only(left: 10, top: 10),
                                                                                                                            child: TextFormField(
                                                                                                                                controller: _alamatController,
                                                                                                                                style: TextStyle(fontSize: fontSize * 0.02),
                                                                                                                                textAlignVertical: TextAlignVertical.center,
                                                                                                                                // autofocus: true,
                                                                                                                                enableInteractiveSelection: true,
                                                                                                                                maxLines: 3,
                                                                                                                                textAlign: TextAlign.start,
                                                                                                                                decoration: InputDecoration(
                                                                                                                                  border: InputBorder.none,
                                                                                                                                  hintStyle: TextStyle(fontSize: fontSize * 0.02),
                                                                                                                                  hintText: ('Info Alamat Lengkap  '),
                                                                                                                                  errorStyle: TextStyle(fontSize: fontSize * 0.02 // Ubah sesuai kebutuhan
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                                validator: _address),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      )
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                )
                                                                                                              ],
                                                                                                            )
                                                                                                          ],
                                                                                                        )
                                                                                                      ],
                                                                                                    ),
                                                                                                    SizedBox(
                                                                                                      height: 10,
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          // color: Colors.blue,
                                                                                                          width: inWidth * 0.9,
                                                                                                          height: inheight * 0.16,
                                                                                                          child: Row(
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Column(
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        child: Column(
                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                          children: [
                                                                                                                            Row(
                                                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                              children: [
                                                                                                                                Column(
                                                                                                                                  children: <Widget>[
                                                                                                                                    Container(
                                                                                                                                      // color: Colors.blue,
                                                                                                                                      width: MediaQuery.of(context).size.width * 0.3,
                                                                                                                                      height: inputheightisi,
                                                                                                                                      child: Text(
                                                                                                                                        "JADWAL",
                                                                                                                                        style: TextStyle(
                                                                                                                                          fontSize: fontSize * 0.02,
                                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    )
                                                                                                                                  ],
                                                                                                                                )
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                            Row(
                                                                                                                              children: [
                                                                                                                                Container(
                                                                                                                                  // color: Colors.blue,
                                                                                                                                  width: inWidth * 0.4,
                                                                                                                                  height: inheight * 0.09,
                                                                                                                                  child: TextFormField(
                                                                                                                                    style: TextStyle(fontSize: fontSize * 0.02),
                                                                                                                                    controller: _dateController,
                                                                                                                                    readOnly: true,
                                                                                                                                    onTap: _selectDate, // Memilih tanggal menggunakan date picker
                                                                                                                                    decoration: InputDecoration(
                                                                                                                                      labelStyle: TextStyle(fontSize: fontSize * 0.02),
                                                                                                                                      labelText: 'Tanggal',
                                                                                                                                      border: OutlineInputBorder(),
                                                                                                                                      errorStyle: TextStyle(fontSize: fontSize * 0.02 // Ubah sesuai kebutuhan
                                                                                                                                          ),
                                                                                                                                      suffixIcon: Icon(
                                                                                                                                        Icons.calendar_today,
                                                                                                                                        size: inWidth * 0.06,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    keyboardType: TextInputType.datetime,
                                                                                                                                    validator: _validateDate,
                                                                                                                                  ),
                                                                                                                                )
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      )
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                              // SizedBox(
                                                                                                              //   width: 5,
                                                                                                              // ),
                                                                                                              Column(
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        child: Column(
                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                          children: [
                                                                                                                            Row(
                                                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                              children: [
                                                                                                                                Column(
                                                                                                                                  children: <Widget>[
                                                                                                                                    Container(
                                                                                                                                      // color: Colors.blue,
                                                                                                                                      width: MediaQuery.of(context).size.width * 0.3,
                                                                                                                                      height: inputheightisi,
                                                                                                                                      child: Text(
                                                                                                                                        "JAM",
                                                                                                                                        style: TextStyle(
                                                                                                                                          fontSize: fontSize * 0.02,
                                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    )
                                                                                                                                  ],
                                                                                                                                )
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                            Row(
                                                                                                                              children: [
                                                                                                                                Container(
                                                                                                                                  // color: Colors.blue,
                                                                                                                                  width: MediaQuery.of(context).size.width * 0.4,
                                                                                                                                  height: inheight * 0.09,
                                                                                                                                  child: TextFormField(
                                                                                                                                    style: TextStyle(fontSize: fontSize * 0.02),
                                                                                                                                    controller: _timeController,
                                                                                                                                    readOnly: true,
                                                                                                                                    onTap: () => _selectTime(context),
                                                                                                                                    decoration: InputDecoration(
                                                                                                                                      labelText: 'Jam ',
                                                                                                                                      labelStyle: TextStyle(fontSize: fontSize * 0.02),
                                                                                                                                      border: OutlineInputBorder(),
                                                                                                                                      suffixIcon: Icon(
                                                                                                                                        Icons.access_time,
                                                                                                                                        size: inWidth * 0.06,
                                                                                                                                      ),
                                                                                                                                      errorStyle: TextStyle(fontSize: fontSize * 0.02 // Ubah sesuai kebutuhan
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                    validator: _validateTime,
                                                                                                                                  ),
                                                                                                                                )
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                            Row(
                                                                                                                              children: [
                                                                                                                                Column(
                                                                                                                                  children: [
                                                                                                                                    Text(
                                                                                                                                      "* 08:00 - 17:00",
                                                                                                                                      style: TextStyle(fontSize: fontSize * 0.02, fontWeight: FontWeight.bold, color: Colors.red),
                                                                                                                                    )
                                                                                                                                  ],
                                                                                                                                )
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      )
                                                                                                                    ],
                                                                                                                  )
                                                                                                                ],
                                                                                                              )
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    SizedBox(height: 5),
                                                                                                    Row(
                                                                                                      children: [
                                                                                                        Column(
                                                                                                          children: [
                                                                                                            Row(
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  child: Column(
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Column(
                                                                                                                            children: <Widget>[
                                                                                                                              Container(
                                                                                                                                // color: Colors.blue,
                                                                                                                                // width:,

                                                                                                                                height: inputheightisi,
                                                                                                                                child: Text(
                                                                                                                                  "WHATSAPP",
                                                                                                                                  style: TextStyle(
                                                                                                                                    fontSize: fontSize * 0.02,
                                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              )
                                                                                                                            ],
                                                                                                                          )
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      Row(
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: inWidth * 0.9,
                                                                                                                            height: inheight * 0.07,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              border: Border.all(
                                                                                                                                color: Colors.grey,
                                                                                                                                width: 1,
                                                                                                                                style: BorderStyle.solid,
                                                                                                                              ),
                                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                                            ),
                                                                                                                            padding: EdgeInsets.only(
                                                                                                                              left: 10,
                                                                                                                            ),
                                                                                                                            child: TextFormField(
                                                                                                                                controller: _waController,
                                                                                                                                keyboardType: TextInputType.phone,
                                                                                                                                style: TextStyle(fontSize: fontSize * 0.02),
                                                                                                                                decoration: InputDecoration(
                                                                                                                                  hintStyle: TextStyle(fontSize: fontSize * 0.02),
                                                                                                                                  border: InputBorder.none,
                                                                                                                                  hintText: 'Nomor Whatsapp',
                                                                                                                                  errorStyle: TextStyle(fontSize: fontSize * 0.02 // Ubah sesuai kebutuhan
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                                validator: _whatsapp),
                                                                                                                          )
                                                                                                                        ],
                                                                                                                      )
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                )
                                                                                                              ],
                                                                                                            )
                                                                                                          ],
                                                                                                        )
                                                                                                      ],
                                                                                                    ),
                                                                                                    SizedBox(height: 40),
                                                                                                    Column(
                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              // width: inWidth,
                                                                                                              // height: inWidth * 0.2,
                                                                                                              child: Column(
                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    children: [
                                                                                                                      ElevatedButton(
                                                                                                                        style: ButtonStyle(
                                                                                                                          fixedSize: WidgetStatePropertyAll(Size(inputWidth, inWidth * 0.09)),
                                                                                                                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF233d63)),
                                                                                                                        ),
                                                                                                                        onPressed: _submitForm,
                                                                                                                        child: Row(
                                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              'Submit',
                                                                                                                              style: TextStyle(fontSize: fontSize * 0.02, color: Colors.white),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ]),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                      }
                                      ;
                                      return Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 100),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'images/assets/No_internet.png',
                                                width: screenWidth * 0.6,
                                                height: screenheight * 0.3,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(height: 20),
                                              Text(
                                                'Please check your internet connection and try again.',
                                                style: TextStyle(
                                                  fontSize: fontSize * 0.03,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(height: 20),
                                              ElevatedButton.icon(
                                                onPressed: () async {
                                                  // Re-check the internet connection and refresh the data
                                                  bool connection =
                                                      await InternetConnectionChecker()
                                                          .hasConnection;
                                                  if (connection) {
                                                    setState(() {
                                                      isConnected = true;
                                                      _futureItems =
                                                          fetchItems();
                                                      futureProvinsi =
                                                          fetchProvinsi();
                                                    });
                                                  } else {
                                                    setState(() {
                                                      isConnected = false;
                                                    });
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                          content: Text(
                                                              'No internet connection available',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      fontSize *
                                                                          0.04))),
                                                    );
                                                  }
                                                },
                                                icon: Icon(Icons.refresh),
                                                label: Text('Refresh',
                                                    style: TextStyle(
                                                        fontSize:
                                                            fontSize * 0.04)),
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor: Colors.white,
                                                  backgroundColor:
                                                      Colors.blue, // Text color
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ])),
                    )
                  ],
                ),
              ))
            : Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/assets/No_internet.png',
                        width: screenWidth * 3.0,
                        height: screenheight * 3.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Please check your internet connection and try again.',
                        style: TextStyle(
                          fontSize: fontSize * 1.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () async {
                          // Re-check the internet connection and refresh the data
                          bool connection =
                              await InternetConnectionChecker().hasConnection;
                          if (connection) {
                            setState(() {
                              isConnected = true;
                              _futureItems = fetchItems();
                              futureProvinsi = fetchProvinsi();
                            });
                          } else {
                            setState(() {
                              isConnected = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'No internet connection available',
                                      style: TextStyle(
                                          fontSize: fontSize * 0.04))),
                            );
                          }
                        },
                        icon: Icon(Icons.refresh),
                        label: Text('Refresh',
                            style: TextStyle(fontSize: fontSize * 0.04)),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue, // Text color
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              )
        // bottomNavigationBar: HomeBottomNavBar(),
        );
  }

  void _showSelectHamaDialog() async {
    try {
      List<HamaItem> items = await fetchItems(); // Fetch the items from the API

      // Set the initial selected IDs based on _selectedItemIds
      Set<int> initialSelectedIds = Set.from(_selectedItemIds);
      double inWidth = MediaQuery.of(context).size.width * 0.8;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          double fontSize = MediaQuery.of(context).size.width;

          return AlertDialog(
            title: Text(
              'Select Hama',
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),
            ),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return SizedBox(
                  width: double
                      .maxFinite, // Make sure the content can take full width
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: items.map((item) {
                        return CheckboxListTile(
                          title: Text(
                            item.nama_hama,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03),
                            overflow: TextOverflow.visible,
                            softWrap: true,
                          ),
                          value: initialSelectedIds.contains(item.id),
                          onChanged: (bool? selected) {
                            setState(() {
                              if (selected == true) {
                                initialSelectedIds.add(item.id);
                              } else {
                                initialSelectedIds.remove(item.id);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child:
                    Text('Cancel', style: TextStyle(fontSize: fontSize * 0.04)),
              ),
              Container(
                child: TextButton(
                  // style: ButtonStyle(
                  //     backgroundColor: WidgetStatePropertyAll(Colors.amber)),
                  onPressed: () {
                    setState(() {
                      _selectedItemIds = Set.from(initialSelectedIds);
                      _selectedText = items
                          .where((item) => _selectedItemIds.contains(item.id))
                          .map((item) => item.nama_hama)
                          .join(', ');
                    });
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('OK',
                      style: TextStyle(
                        fontSize: fontSize * 0.04,
                      )),
                ),
              ),
            ],
          );
        },
      );
    } catch (error) {
      print('Error showing dialog: $error');
    }
  }

//   Future<void> _showSelectDialog(List<String> items) async {
//     final List<String>? selectedItems = await showDialog<List<String>>(
//       context: context,
//       builder: (context) {
//         return MultiSelectDialog(
//           items: items,
//           selectedItems: _selectedItem,
//         );
//       },
//     );
//     if (selectedItems != null) {
//       setState(() {
//         _selectedItem = selectedItems;
//       });
//     }
//   }
}

// class MultiSelectDialog extends StatefulWidget {
//   final List<String> items;
//   final List<String> selectedItems;

//   MultiSelectDialog({required this.items, required this.selectedItems});

//   @override
//   _MultiSelectDialogState createState() => _MultiSelectDialogState();
// }

// class _MultiSelectDialogState extends State<MultiSelectDialog> {
//   late List<String> _selectedItems;

//   @override
//   void initState() {
//     super.initState();
//     _selectedItems = List.from(widget.selectedItems);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Select Items'),
//       content: SingleChildScrollView(
//         child: Column(
//           children: widget.items.map((item) {
//             return CheckboxListTile(
//               title: ConstrainedBox(
//                 constraints: BoxConstraints(
//                     maxWidth: 200), // Sesuaikan lebar maksimum sesuai kebutuhan
//                 child: Text(
//                   item,
//                   maxLines: 3,
//                   overflow: TextOverflow.visible,
//                   softWrap: true,
//                 ),
//               ),
//               value: _selectedItems.contains(item),
//               onChanged: (bool? selected) {
//                 setState(() {
//                   if (selected == true) {
//                     _selectedItems.add(item);
//                   } else {
//                     _selectedItems.remove(item);
//                   }
//                 });
//               },
//             );
//           }).toList(),
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(_selectedItems),
//           child: Text('OK'),
//         ),
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(),
//           child: Text('Cancel'),
//         ),
//       ],
//     );
//   }
// }
